using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Ionic.Zip;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System;
using System.Text.RegularExpressions;

namespace iCE_Webapp_Bootstrap
{
    public partial class copyediting : System.Web.UI.Page
    {
private string _errFiles = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] == null) { Response.Redirect("../login.aspx"); }
            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            errorlable.Visible = false;
            LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString();
            DB_Operations _DB = new DB_Operations();

            if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
            {
                __admin__.Visible = false;
            }

            string _product = "VPS-ICE";
            if (Session["products"] != null)
            {
                Dictionary<string, string> _productDict = (Dictionary<string, string>)Session["products"];
                if (!_productDict.ContainsKey(_product))
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                Dictionary<string, string> _proList = new Dictionary<string,string>();
                _proList = _DB.CheckProjects(Session["userid"].ToString(),
                    Session["clientid"].ToString().ToLower(), "1");

                if (_proList.Count > 0)
                {
                    SelProject.Items.Clear();
                    SelProject.Items.Add(new ListItem("Default","0"));
                    foreach (var _s in _proList)
                    {
                        SelProject.Items.Add(new ListItem(_s.Value.ToString(), _s.Key.ToString()));
                    }
                }
                else
                {
                    SelProject.Items.Add(new ListItem("Default", "0"));
                }

                try
                {
                    if (Session["errorfiles"] != null)
                    {
                        if (Session["errorfiles"].ToString().Length > 0)
                        {
                            errorlable.InnerHtml = Session["errorfiles"].ToString();
                            errorlable.Visible = true;
                            Session["errorfiles"] = "";
                        }
                    }
                }
                catch
                {
                }
                //generateReport();
                this.BindListView();
            }

        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        #region Add Excel to zip
        private void CreateZIP_Package(string _xml, string _docx, string _zip)
        {
            try
            {
                using (ZipFile zip = new ZipFile())
                {
                    zip.AddFile(_xml,"");
                    zip.AddFile(_docx,"");
                    zip.Save(_zip);
                }
            }
            catch (Exception _e)
            {
                Debug.WriteLine("Exc@ZIP>>" + _e.Message.ToString());
            }
        }
        #endregion

        #region Upload File click
        protected void UploadFile_Click(object sender, EventArgs e)
        {
            if (UploadDOCX.HasFiles)
            {
                DB_Operations _DB = new DB_Operations();
                List<string> _allSQL = new List<string>();
                string _conn = WebConfigurationManager.ConnectionStrings["connSTR"].ConnectionString;

                string _currpro = SelProject.SelectedValue.ToString();
                string _xmltop = "<config>" + Environment.NewLine + 
                    "<option>AnchorHyperlink</option>" + Environment.NewLine +
                    "<connstring>" + _conn + "</connstring>" + Environment.NewLine + 
                    "<modules>" + Environment.NewLine;
                string _xmlbot = "</modules>" + Environment.NewLine + "</config>";
                string _xmlbody = string.Empty;
                /////////////////////////////////////////////////////////////////
                ////   PULL ALL CONFIG FORM DB - WITH REGARDING TO PROJECT   ////
                /////////////////////////////////////////////////////////////////
                DataTable _Modules = new DataTable();
                //select * from project_modules_mapping where (client_id = 1 AND (project_id=0 OR project_id=1) AND isactive='true')
                //select project_id, module_code from project_modules_mapping where (client_id = 1 AND (project_id=0 OR project_id=1) AND isactive='true')
                //select project_id, module_code from project_modules_mapping where (client_id = 1 AND project_id=1 AND isactive='true')
                string _moduleSQL = string.Empty;
                if (_currpro == "0")
                {
                    _moduleSQL = "select project_id, module_code from project_modules_mapping where (client_id=" + 
                        Session["clientid"].ToString() + " AND project_id=0 AND isactive='true');";
                }
                else
                {
                    _moduleSQL = "select project_id, module_code from project_modules_mapping where (client_id=" + 
                        Session["clientid"].ToString() + " AND (project_id=0 OR project_id=" + 
                        _currpro.Trim() + ") AND isactive='true') ORDER BY project_id;";
                }

                _Modules = _DB.DataTableFrom_Query(_moduleSQL);
                foreach(DataRow _m in _Modules.Rows)
                {
                    _xmlbody += "<module>" + _m[1].ToString() + "</module>" + Environment.NewLine;
                    Debug.WriteLine(_m[0].ToString() + "-----" + _m[1].ToString());
                }
                /////////////////////////////////////////////////////////////////

                foreach (HttpPostedFile uploadedFile in UploadDOCX.PostedFiles)
                {
                    try
                    {
                        if ((uploadedFile.FileName.ToString().ToLower().EndsWith(".docx")))
                        {
                            string _timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                            //Directory.CreateDirectory(System.IO.Path.Combine(Server.MapPath("~/OutputFiles/" + _timestamp)));
                            string _newFilename = uploadedFile.FileName.ToString().Replace(" ","_");

                            uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Downloads/"), _newFilename));

                            string _docx = System.IO.Path.Combine(Server.MapPath("~/Downloads/"), _newFilename);
                            string _iXML = System.IO.Path.Combine(Server.MapPath("~/Downloads/"), _timestamp + ".xml");
                            string _iZIP = System.IO.Path.Combine(Server.MapPath("~/Downloads/"), _timestamp + "_" + Path.GetFileNameWithoutExtension(uploadedFile.FileName.ToString()).Replace(" ","_") + "_CE.zip");

                            File.WriteAllText(_iXML, _xmltop + _xmlbody + _xmlbot);


                            CreateZIP_Package(_iXML,_docx,_iZIP);
                            File.Delete(_docx);
                            File.Delete(_iXML);

                            string sql = @"INSERT INTO job (id,status,user_id,input_file_name,upr_id,input_time,project_name) VALUES(" +
                            _timestamp + ",'Queued'," + Session["userid"].ToString() + ", '" + uploadedFile.FileName +
                            "', 1, '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + SelProject.SelectedItem.Text.ToString() + "');";
                            _allSQL.Add(sql);
                        }
                        else
                        {
                            _errFiles += String.Format("{0} | ", uploadedFile.FileName);
                            //listofuploadedfiles.InnerHtml += String.Format("{0}<br />", uploadedFile.FileName);
                        }
                    }
                    catch(Exception _e)
                    {
                        Debug.WriteLine("EXC@>>>" + _e.Message.ToString());
                    }
                }
                _DB.Execute_SQL_Query(_allSQL);
                //generateReport();
                //ProcessQueue();//Chetan
                _errFiles = System.Text.RegularExpressions.Regex.Replace(_errFiles, @" \| $", "");
                Session["errorfiles"] = _errFiles;
                Response.Redirect(Request.Url.AbsoluteUri);
                ClientScript.RegisterStartupScript(Page.GetType(), "Excel Converter", "<script language='javascript'>alert('" + _errFiles + "')</script>");
            }
        }

        #endregion

        private void BindListView()
        {
            try
            {
                //string sql = @"Select id, input_file_name, status from job WHERE (user_id=" + Session["userid"].ToString() + " and upr_id=1) ORDER BY id DESC;";
                string sql = @"Select id, input_file_name, project_name, status, word_count, page_count, input_time, output_time, output_file_name  from job WHERE (user_id=" + Session["userid"].ToString() + " and upr_id=1) ORDER BY id DESC;";
                /*, word_count, page_count, input_time, output_time, output_file_name, project_name*/
                DB_Operations _DB = new DB_Operations();
                DataTable dt = new DataTable();
                dt = _DB.DataTableFrom_Query(sql);
                DataTable newdt = new DataTable();
                DataRow dataRow = null;

                newdt.Columns.Add(new DataColumn("id", typeof(string)));
                newdt.Columns.Add(new DataColumn("input_file_name", typeof(string)));
                newdt.Columns.Add(new DataColumn("project_name", typeof(string)));
                newdt.Columns.Add(new DataColumn("status", typeof(string)));
                newdt.Columns.Add(new DataColumn("word_count", typeof(string)));
                newdt.Columns.Add(new DataColumn("page_count", typeof(string)));
                newdt.Columns.Add(new DataColumn("input_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("output_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("total_time", typeof(string)));
                newdt.Columns.Add(new DataColumn("html_file", typeof(string)));
                newdt.Columns.Add(new DataColumn("output_file_name", typeof(string)));
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        dataRow = newdt.NewRow();
                        //bellow you can modify your ouput in what ever formating you want
                        dataRow["id"] = dr["id"].ToString();
                        dataRow["input_file_name"] = dr["input_file_name"].ToString();
                        dataRow["project_name"] = dr["project_name"].ToString();
                        dataRow["status"] = dr["status"].ToString();
                        dataRow["word_count"] = dr["word_count"].ToString();
                        dataRow["page_count"] = dr["page_count"].ToString();
                        dataRow["input_time"] = dr["input_time"].ToString();
                        dataRow["output_time"] = dr["output_time"].ToString();
                        dataRow["total_time"] = string.Empty;

                        try
                        {
                            TimeSpan diff = DateTime.Parse(dr["output_time"].ToString()) - DateTime.Parse(dr["input_time"].ToString());
                            dataRow["total_time"] = diff.Hours.ToString("D2") + ":" + diff.Minutes.ToString("D2") + ":" + diff.Seconds.ToString("D2");
                        }
                        catch { }

                        string _op = dr["output_file_name"].ToString();
                        _op = _op.Replace(@"\", @"/");
                        _op = Regex.Replace(_op, "^(.+?)(OutputFiles)(.+?)$", "../$2$3", RegexOptions.IgnoreCase);

                        dataRow["output_file_name"] = _op.ToString();
                        string _html = Regex.Replace(_op, @"^(.+?)\.zip$", "$1.html", RegexOptions.IgnoreCase);
                        dataRow["html_file"] = _html.ToString();

                        
                        newdt.Rows.Add(dataRow);
                    }
                    lvCustomers.DataSource = newdt;
                }
                lvCustomers.DataBind();
            }
            catch(Exception _e)
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
    }
}