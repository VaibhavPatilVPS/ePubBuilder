using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPubBuilder.epubmate
{
    public partial class epubmate_fl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] == null) { Response.Redirect("../login.aspx"); }
            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString();
            DB_Operations _DB = new DB_Operations();

            string _product = "VPS-EPFL";
            if (Session["products"] != null)
            {
                Dictionary<string, string> _productDict = (Dictionary<string, string>)Session["products"];
                if(!_productDict.ContainsKey(_product))
                {
                    ExitPage();
                }
            }
            else
            {
                ExitPage();
            }

            if (!IsPostBack)
            {
                error_status.Visible = true;
                //Gridview2.Enabled = false;

                string server = HttpContext.Current.Server.MapPath("~/Downloads/" + Session["UserAuthentication"].ToString());
                try
                {
                    if (!Directory.Exists(server)) { Directory.CreateDirectory(server); }
                }
                catch { }

                if (!IsPostBack)
                {
                    SetInitialRow(Gridview2, "CurrentTable1");
                }

                this.BindListView();
            }
        }

        private void SetInitialRow(GridView gv, string currentTable)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState
            ViewState[currentTable] = dt;

            gv.DataSource = dt;
            gv.DataBind();
        }

        public void CovCheked_Changed(object sender, EventArgs e)
        {
            if(coverradio.SelectedValue.ToString() == "yes")
                coverupload.Enabled = false;
            else if (coverradio.SelectedValue.ToString() == "no")
                coverupload.Enabled = true;
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text","ResetView()", true);
        }

        public void bCovCheked_Changed(object sender, EventArgs e)
        {
            string _x = backcoverradio.SelectedValue.ToString();
            if (backcoverradio.SelectedValue.ToString() == "yes")
                backcoverupload.Enabled = false;
            else if (backcoverradio.SelectedValue.ToString() == "no")
                backcoverupload.Enabled = true;
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>ResetView();</script>", false);
        }

        public void TOCtxt_Changed(object sender, EventArgs e)
        {
            if (tocradio.SelectedValue.ToString() == "yes")
                Gridview2.Enabled = true;
            else if (backcoverradio.SelectedValue.ToString() == "no")
                Gridview2.Enabled = false;
            //document.getElementById("defaultOpen").click();
            //openTAB(event, 'metainfo')
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>ResetView();</script>", false);

        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("------------YES--FILE--------------");
            string _timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            try
            {
                bool _cover = false;
                bool _bcover = false;

                string _cover_file = string.Empty;
                string _bcover_file = string.Empty;


                if (coverradio.SelectedValue.ToString() == "yes")
                    _cover = true;
                else
                    if (coverupload.HasFile && coverupload.FileName.ToLower().EndsWith(".jpg"))
                        _cover_file = coverupload.FileName.ToString();

                if (backcoverradio.SelectedValue.ToString() == "yes")
                    _bcover = true;
                else
                    if (backcoverupload.HasFile && backcoverupload.FileName.ToLower().EndsWith(".jpg"))
                        _bcover_file = backcoverupload.FileName.ToString();

                if ((FileUploadControl.HasFile && FileUploadControl.FileName.ToLower().EndsWith(".pdf")) &&
                    ((_cover == true) || (_cover_file.Length > 0)))// &&
                    //((_bcover == true) || (_bcover_file.Length > 0)))
                {
                    string fileName = FileUploadControl.FileName;
                    string _xml = string.Empty;
                    //string coverName = coverupload.FileName;
                    //string bcoverName = backcoverupload.FileName;

                    string server = HttpContext.Current.Server.MapPath("~/Downloads/" + Session["UserAuthentication"].ToString() + "/" + _timestamp);
                    if (!Directory.Exists(server))
                        Directory.CreateDirectory(server);

                    string ts = _timestamp + Path.GetExtension(fileName);
                    if (!_cover)
                    {
                        _cover_file = server + "\\" + _timestamp + "_cover" + Path.GetExtension(_cover_file);
                        coverupload.SaveAs(_cover_file);
                    }
                    else
                    {
                        _xml += "<coverincluded>true</coverincluded>" + Environment.NewLine;
                    }

                    if (!_bcover)
                    {
                        if (_bcover_file.Length > 0)
                        {
                            _bcover_file = server + "\\" + _timestamp + "_backcover" + Path.GetExtension(_bcover_file);
                            backcoverupload.SaveAs(_bcover_file);
                        }
                    }
                    else
                    {
                        _xml += "<backcoverincluded>true</backcoverincluded>" + Environment.NewLine;
                    }

                    fileName = server + "\\" + _timestamp + Path.GetExtension(fileName);
                    string INI = server + "\\" + _timestamp + ".ini";

                    FileUploadControl.SaveAs(fileName);

                    string _pagecount = txtPagecount.Text.Trim();
                    if (txtIsbn.Text.Trim() != string.Empty) { _xml += "<ISBN>" + txtIsbn.Text.Trim() + "</ISBN>" + Environment.NewLine; }
                    if (txtBooktitle.Text.Trim() != string.Empty) { _xml += "<Title>" + txtBooktitle.Text.Trim() + "</Title>" + Environment.NewLine; }
                    if (txtAuthname.Text.Trim() != string.Empty) { _xml += "<Author>" + txtAuthname.Text.Trim() + "</Author>" + Environment.NewLine; }
                    if (txtpublishername.Text.Trim() != string.Empty) { _xml += "<Publisher>" + txtpublishername.Text.Trim() + "</Publisher>" + Environment.NewLine; }
                    _xml += "<Copyright>All rights reserved</Copyright>" + Environment.NewLine;
                    //if (txtCopyright.Text.Trim() != string.Empty) { _xml += "<Copyright>" + txtCopyright.Text.Trim() + "</Copyright>" + Environment.NewLine; }
                    if (txtPagecount.Text.Trim() != string.Empty) { _xml += "<Pagecount>" + txtPagecount.Text.Trim() + "</Pagecount>" + Environment.NewLine; }
                    //if (txtDate.Text.ToString().Trim() != string.Empty) { _xml += "<Date>" + txtDate.Text.ToString().Trim() + "</Date>" + Environment.NewLine; }
                    _xml += "<Date>" + DateTime.Now.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture) + "</Date>" + Environment.NewLine;
                    //if (Page.Request.Form["txtDate"].ToString().Trim() != string.Empty) {
                    //    _xml += "<Date>" + Page.Request.Form["txtDate"].ToString().Trim() + "</Date>" + Environment.NewLine;
                    //}

                    if (DropEngine.Text.Trim() != string.Empty) { _xml += "<Engine>" + DropEngine.Text.Trim() + "</Engine>" + Environment.NewLine; }
                    if (DropLanguage.Text.Trim() != string.Empty) { _xml += "<Language>" + DropLanguage.Text.Trim() + "</Language>" + Environment.NewLine; }
                    if (DropLayout.Text.Trim() != string.Empty) { _xml += "<Layout>" + DropLayout.Text.Trim() + "</Layout>" + Environment.NewLine; }

                    // Make TOC Links
                    //<link><page>2</page><head>Copyright</head></link>
                    string _links = string.Empty;
                    foreach (GridViewRow row in Gridview2.Rows)
                    {
                        DropDownList dl1 = (DropDownList)row.Cells[1].FindControl("fllevel");
                        TextBox box1 = (TextBox)row.Cells[2].FindControl("TextBox1x");
                        TextBox box2 = (TextBox)row.Cells[3].FindControl("TextBox2x");
                        string _l1 = dl1.SelectedValue.ToString().Trim();
                        string _b1 = box1.Text.Trim();
                        string _b2 = box2.Text.Trim();
                        if (_b1.Length > 0 && _b2.Length > 0)
                        {
                            _links += "<link><page>" + _b2 + "</page><head>" + _b1 + "</head><level>" + _l1 + "</level></link>" + Environment.NewLine;
                        }
                    }
                    _xml += _links;

                    /////////////////////////// Image Quality /////////////////////////////////
                    _xml += "<imagequality>" + imgquality.SelectedValue.ToString().Trim() + "</imagequality>" + Environment.NewLine;
                    /////////////////////////// Image Type ////////////////////////////////////
                    if(DropEngine.Text.ToLower() == "mhe")
                    {
                        _xml += "<popup>true</popup>" + Environment.NewLine;
                    }
                    
                    _xml += "<imagetype>" + bgImg.Text.ToString().Trim() + "</imagetype>" + Environment.NewLine;
                    /////////////////////////// Book Size /////////////////////////////////
                    _xml += "<booksize>" + booksize.Text.ToString().Trim() + "</booksize>" + Environment.NewLine;
                    /////////////////////////// Font type /////////////////////////////////
                    _xml += "<fonttype>" + fonttype.SelectedValue.ToString().Trim() + "</fonttype>" + Environment.NewLine;
                    
                    /////////////////////////// User Type /////////////////////////////////////
                    try
                    {
                        if (Session["usertype"] != null)
                            _xml += "<usertype>" + Session["usertype"].ToString().Trim().ToLower() + "</usertype>" + Environment.NewLine;
                    }
                    catch { }
                    ////////////////////////////////////////////////////////////

                    if (_xml != string.Empty)
                    {
                        try
                        {
                            StreamWriter file = new StreamWriter(INI);
                            file.WriteLine(_xml);
                            file.Close();
                        }
                        catch (Exception _e)
                        {
                            Debug.WriteLine("_________EXC_________");
                            Debug.WriteLine(_e.Message.ToString());
                            Debug.WriteLine("_____________________");
                        }
                    }

                    Debug.WriteLine("----------------Upload Success---------------------");
                    Debug.WriteLine(fileName);
                    Debug.WriteLine("---------------------------------------------------");

                    string _product = "VPS-EPFL";
                    string _product_ID = "";

                    if (Session["products"] != null)
                    {
                        Dictionary<string, string> _productDict = (Dictionary<string, string>)Session["products"];
                        if (_productDict.ContainsKey(_product))
                        {
                            _product_ID = _productDict[_product];
                        }
                    }
                    string sql = string.Empty;
                    //insert into job_epubmate_fl Values(nextval('job_epubmate_fl_Inc'),1,2,true);
                    sql = @"INSERT INTO job_epubmate_fl(id, job_id, product_code, isbn, page_count, user_id, file_name, input_file_name, vm_id, product_id, status) VALUES(" +
                        "nextval('job_epubmate_fl_Inc'),'" + _timestamp + "','" + _product + "', '" + txtIsbn.Text.Trim() + "', '" + _pagecount + "', '" +
                        Session["userid"].ToString() + "', '" + _timestamp + "', '" + Path.GetFileName(FileUploadControl.FileName) + "', '1','" + _product_ID + "','Queued');";

                    //INSERT INTO public.job(job_id, product_code, pagecount, user_id, file_name,role_id,vm_id) VALUES('20170525175032546', 'VPS-EPFL', '333', '2', 'veera',2,1);
                    //Logics.CommunicateDB _CD_ = new Logics.CommunicateDB();
                    DB_Operations _db = new DB_Operations();
                    List<string> _QueryList = new List<string>();
                    _QueryList.Add(sql);
                    //_db.Execute_SQL_Query(_QueryList);

                    if (_db.Execute_SQL_Query(_QueryList))
                    {
                        Debug.WriteLine("----------------JOB Registered Success---------------------");

                        txtBooktitle.Text = string.Empty;
                        txtAuthname.Text = string.Empty;
                        txtpublishername.Text = string.Empty;
                        txtIsbn.Text = string.Empty;
                        txtPagecount.Text = string.Empty;
                        DropLanguage.Text = string.Empty;
                        DropLayout.Text = string.Empty;
                        FileUploadControl.Attributes.Clear();
                        backcoverupload.Attributes.Clear();
                        coverupload.Attributes.Clear();
                        //Response.Redirect(this.Request.Url.ToString());
                        Response.Redirect("epubmate_fl.aspx");
                        //Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
                    }
                    else
                    {
                        error_status.Visible = true;
                        error_status.Text = "Job Registeration failed.";
                    }
                    Debug.WriteLine("----------------JOB Registered FAILED----------------------");
                }
            }
            catch { }
        }

        private void BindListView()
        {

            try
            {
                //Session["userid"]
                //string sql = @"Select id, input_file_name, status from job WHERE (user_id=" + Session["userid"].ToString() + " and upr_id=1) ORDER BY id DESC;";
                string sql = @"Select input_file_name,status,isbn,page_count,input_time, output_time,file_name from job_epubmate_fl WHERE (user_id=" + Session["userid"].ToString() + ") ORDER BY id DESC;";
                /*, word_count, page_count, input_time, output_time, output_file_name, project_name*/
                DB_Operations _DB = new DB_Operations();
                DataTable dt = new DataTable();
                dt = _DB.DataTableFrom_Query(sql);
                DataTable newdt = new DataTable();
                DataRow dataRow = null;

                newdt.Columns.Add(new DataColumn("slno", typeof(string)));
                newdt.Columns.Add(new DataColumn("input_file_name", typeof(string)));
                newdt.Columns.Add(new DataColumn("isbn", typeof(string)));
                newdt.Columns.Add(new DataColumn("page_count", typeof(string)));
                newdt.Columns.Add(new DataColumn("input_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("output_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("total_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("status", typeof(string)));
                newdt.Columns.Add(new DataColumn("file_name", typeof(string)));
                newdt.Columns.Add(new DataColumn("log_name", typeof(string)));
                newdt.Columns.Add(new DataColumn("ico_name", typeof(string)));
                int _sl = 1;
                int _first = 1;
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        dataRow = newdt.NewRow();
                        //bellow you can modify your ouput in what ever formating you want
                        dataRow["slno"] = _sl.ToString("D3");
                        dataRow["input_file_name"] = dr["input_file_name"].ToString();
                        dataRow["isbn"] = dr["isbn"].ToString();
                        dataRow["status"] = dr["status"].ToString();
                        dataRow["page_count"] = dr["page_count"].ToString();
                        dataRow["input_time"] = dr["input_time"].ToString();
                        dataRow["output_time"] = dr["output_time"].ToString();
                        dataRow["total_time"] = string.Empty;
                        dataRow["log_name"] = string.Empty;
                        dataRow["ico_name"] = string.Empty;

                        try
                        {
                            TimeSpan diff = DateTime.Parse(dr["output_time"].ToString()) - DateTime.Parse(dr["input_time"].ToString());
                            dataRow["total_time"] = diff.Hours.ToString("D2") + ":" + diff.Minutes.ToString("D2") + ":" + diff.Seconds.ToString("D2");
                        }
                        catch { }

                        string _op = dr["file_name"].ToString();
                        _op = _op.Replace(@"\", @"/");
                        string _lg = _op;

                        _lg = Path.GetDirectoryName(_op) + "/" + Path.GetFileNameWithoutExtension(_op) + ".txt";
                        _lg = _lg.Replace(@"\", @"/");

                        _op = Regex.Replace(_op, "^(i:/)(.+?)$", "../downloads/$2", RegexOptions.IgnoreCase);

                        dataRow["file_name"] = _op.ToString();
                        try
                        {
                            if (Session["startdate"] != null && Session["enddate"] != null)
                            {
                                var sDate = DateTime.Parse(Session["startdate"].ToString());
                                var eDate = DateTime.Parse(Session["enddate"].ToString());
                                var cDate = DateTime.Today;

                                int result1 = DateTime.Compare(sDate, cDate);
                                int result2 = DateTime.Compare(cDate, eDate);

                                if ((cDate <= eDate) && (sDate <= cDate))//((sDate >= cDate))
                                {
                                    if (_first <= 4)
                                    {
                                        _first++;
                                        dataRow["file_name"] = _op.ToString();
                                    }
                                    else
                                    {
                                        dataRow["file_name"] = string.Empty;
                                    }
                                }
                                else if (sDate.ToString().Length> 0 && eDate.ToString().Count() > 0)
                                {
                                    dataRow["file_name"] = string.Empty;
                                }
                            }
                        }
                        catch(Exception _e) {
                            Debug.WriteLine("EXC@>>>" + _e.Message.ToString());
                        }

                        _lg = Regex.Replace(_lg, "^(i:/)(.+?)$", "~/downloads/$2", RegexOptions.IgnoreCase);

                        string _logfile = HttpContext.Current.Server.MapPath(_lg);
                        if (File.Exists(_logfile))
                        {
                            string _err = File.ReadAllText(_logfile).ToLower();
                            _lg = _lg.Replace("~/downloads", "../downloads");
                            dataRow["log_name"] = _lg;
                            if(_err.Contains("no errors or warnings detected."))
                                dataRow["ico_name"] = "../images/thumbsup.png";
                            else
                                dataRow["ico_name"] = "../images/thumbsdown.png";
                        }
                        else
                        {
                            dataRow["ico_name"] = "../images/error.png";
                        }
                        newdt.Rows.Add(dataRow);
                        _sl++;
                    }
                    lvCustomers.DataSource = newdt;
                }
                lvCustomers.DataBind();
            }
            catch (Exception _e)
            {
                Debug.WriteLine("Exc@>>>" + _e.Message.ToString());
            }
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }

        private void ExitPage()
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Product Config", "<script language='javascript'>alert('Product Authentication Denied')</script>");
            Response.Redirect("Default.aspx");
        }

        public void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid(Gridview2, "fllevel", "TextBox1x", "TextBox2x", "CurrentTable1");
        }

        public void DeleteLastRow1_Click(object sender, EventArgs e)
        {
            DeleteRow(Gridview2, "fllevel", "TextBox1x", "TextBox2x", "CurrentTable1");
        }

        private void DeleteRow(GridView gv, string lvl,string ddl, string tb, string currentTable)
        {
            GridViewRow r = gv.Rows[gv.Rows.Count - 1];
            int index = r.RowIndex;
            if (index != 0)
            {
                int rowIndex = 0;
                if (ViewState[currentTable] != null)
                {
                    DataTable dtCurrentTable = (DataTable)ViewState[currentTable];
                    DataRow drCurrentRow = null;
                    if (dtCurrentTable.Rows.Count > 0)
                    {
                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {
                            //extract the TextBox values
                            DropDownList dl1 = (DropDownList)gv.Rows[rowIndex].Cells[1].FindControl(lvl);
                            TextBox box1 = (TextBox)gv.Rows[rowIndex].Cells[2].FindControl(ddl);
                            TextBox box2 = (TextBox)gv.Rows[rowIndex].Cells[3].FindControl(tb);

                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["RowNumber"] = i + 1;
                            drCurrentRow["Column1"] = dl1.SelectedValue.ToString();
                            drCurrentRow["Column2"] = box1.Text;
                            drCurrentRow["Column3"] = box2.Text;

                            rowIndex++;
                        }

                        //test

                        //delete last row from DataTable
                        dtCurrentTable.Rows[index].Delete();
                        //Store the current data to ViewState
                        ViewState[currentTable] = dtCurrentTable;

                        //Rebind the Grid with the current data
                        gv.DataSource = dtCurrentTable;
                        gv.DataBind();
                    }
                }
                else
                {
                    Response.Write("ViewState is null");
                }
                //Set Previous Data on Postbacks
                SetPreviousData(gv, lvl, ddl, tb, currentTable);
            }

        }

        private void AddNewRowToGrid(GridView gv, string lvl, string ddl, string tb, string currentTable)
        {
            int rowIndex = 0;
            if (ViewState[currentTable] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState[currentTable];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        DropDownList dl1 = (DropDownList)gv.Rows[rowIndex].Cells[1].FindControl(lvl);
                        TextBox box1 = (TextBox)gv.Rows[rowIndex].Cells[2].FindControl(ddl);
                        TextBox box2 = (TextBox)gv.Rows[rowIndex].Cells[3].FindControl(tb);

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        dtCurrentTable.Rows[i - 1]["Column1"] = dl1.SelectedValue.ToString();
                        dtCurrentTable.Rows[i - 1]["Column2"] = box1.Text;
                        dtCurrentTable.Rows[i - 1]["Column3"] = box2.Text;

                        rowIndex++;
                    }

                    //add new row to DataTable
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState
                    ViewState[currentTable] = dtCurrentTable;

                    //Rebind the Grid with the current data
                    gv.DataSource = dtCurrentTable;
                    gv.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData(gv, lvl, ddl, tb, currentTable);
        }

        private void SetPreviousData(GridView gv, string lvl, string ddl, string tb, string currentTable)
        {
            int rowIndex = 0;
            if (ViewState[currentTable] != null)
            {
                DataTable dt = (DataTable)ViewState[currentTable];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DropDownList dl1 = (DropDownList)gv.Rows[rowIndex].Cells[1].FindControl(lvl);
                        TextBox box1 = (TextBox)gv.Rows[rowIndex].Cells[2].FindControl(ddl);
                        TextBox box2 = (TextBox)gv.Rows[rowIndex].Cells[3].FindControl(tb);
                        dl1.Text = dt.Rows[i]["Column1"].ToString();
                        box1.Text = dt.Rows[i]["Column2"].ToString();
                        box2.Text = dt.Rows[i]["Column3"].ToString();
                        rowIndex++;
                    }
                }
            }
        }
    }
}