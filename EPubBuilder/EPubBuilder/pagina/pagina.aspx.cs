using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Ionic.Zip;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using System.Diagnostics;
using System.Data;
using System.Text.RegularExpressions;

namespace iCE_Webapp_Bootstrap.pagina
{
    public partial class pagina : System.Web.UI.Page
    {
        private string _product = "VPS-PAS";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] == null) { Response.Redirect("../login.aspx"); }
            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            errorlable.Visible = false;
            LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString();

            if (Session["products"] != null)
            {
                Dictionary<string, string> _productDict = (Dictionary<string, string>)Session["products"];
                if (!_productDict.ContainsKey(_product))
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
                string server = HttpContext.Current.Server.MapPath("~/Downloads/" + Session["UserAuthentication"].ToString());
                try { if (!Directory.Exists(server)) { Directory.CreateDirectory(server); } } catch { }
                this.BindListView();
            }

        }

        #region Add Excel to zip
        private void AddExcelToZip(string excelPath, string zipPath)
        {
            using (ZipFile zipDest = ZipFile.Read(zipPath))
            {
                zipDest.AddFile(excelPath, "");
                zipDest.Save();
            }
        }
        #endregion

        #region Create Excel
        private void CreateExcel(string excelPath, string zipPath)
        {
            using (ZipFile zipDest = ZipFile.Read(zipPath))
            {
                zipDest.AddFile(excelPath, "");
                zipDest.Save();
            }
        }
        #endregion

        #region  btnSubmitSingle
        protected void btnSubmitSingle_Click(object sender, EventArgs e)
        {
            //lblMessage.Text = "";
            string server = HttpContext.Current.Server.MapPath("~/Downloads/" + Session["UserAuthentication"].ToString());
            //string server1 = HttpContext.Current.Server.MapPath("~/Downloads1/");
            string _timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            string newXMLFile = server + "/" + _timestamp + ".xml";

            try
            {
                string temp = string.Empty, temp1 = string.Empty;

                if (!Directory.Exists(server))
                    Directory.CreateDirectory(server);

                XElement root = new XElement("root");
                root.Add(new XElement("product", "PAGINA"));
                root.Add(new XElement("connstring", "Server=192.168.1.34;Port=5432;User Id=postgres;Password=root;Database=iCE_Main;Pooling=false;"));

                if (File.Exists(newXMLFile))
                    File.Delete(newXMLFile);
                if (pas_isbn.Text.ToString().Trim() != "")
                    root.Add(new XElement("ISBN", pas_isbn.Text));
                if (pas_chapterid.Text.ToString().Trim() != "")
                    root.Add(new XElement("chapID", pas_chapterid.Text));
                if (pas_booktitle.Text.ToString().Trim() != "")
                    root.Add(new XElement("bookTitle", pas_booktitle.Text));
                if (pas_runningheaderstyle.SelectedIndex != 0)
                    root.Add(new XElement("runningHeaderStyle", pas_runningheaderstyle.SelectedValue));

                root.Save(newXMLFile);
            }
            catch (Exception ex)
            {

            }

            string _product_ID = "";

            if (Session["products"] != null)
            {
                Dictionary<string, string> _productDict = (Dictionary<string, string>)Session["products"];
                if (_productDict.ContainsKey(_product))
                {
                    _product_ID = _productDict[_product];
                }
            }

            if (inputuploadsingle.HasFile)
            {
                var hfc = inputuploadsingle.PostedFiles;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    if (hpf.ContentLength > 0)
                    {
                        string FileExtention = System.IO.Path.GetExtension(hpf.FileName);
                        if (FileExtention == ".zip")
                        {

                            string fileName = server + "\\" + _timestamp + "_" + pas_isbn.Text.ToString().Trim() +
                                "_" + pas_chapterid.Text.ToString().Trim() + "_Pagina" + Path.GetExtension(hpf.FileName);
                            hpf.SaveAs(fileName);
                            AddExcelToZip(newXMLFile, fileName);

                            string sql = string.Empty;
                            List<string> _sql = new List<string>();

                            sql = @"INSERT INTO job_pagina(id, job_id, product_code, user_id, file_name, input_file_name, vm_id, product_id, isbn, input_time, status) VALUES(" +
                                "nextval('job_pagina_Inc'),'" + _timestamp + "','" + _product + "','" +
                                Session["userid"].ToString() + "', '" + Path.GetFileName(fileName) + "', '" + Path.GetFileName(fileName) + "', '1','" + _product_ID + "','" 
                                + pas_isbn.Text.Trim() + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                + "','Queued');";
                            //pas_isbn.Text
                            _sql.Add(sql);

                            DB_Operations _db = new DB_Operations();
                            if (_db.Execute_SQL_Query(_sql))
                            {
                                Debug.WriteLine("----------------JOB Registered Success---------------------");
                            }
                            else
                                Debug.WriteLine("----------------JOB Registered FAILED----------------------");
                            //lblMessage.Text += hpf.FileName + ": uploaded successfully !!" + "<br />";
                        }
                        else
                        {
                            string sql = string.Empty;
                            List<string> _sql = new List<string>();

                            sql = @"INSERT INTO job_pagina(id, job_id, product_code, user_id, file_name, vm_id, product_id, isbn, input_time, status) VALUES(" +
                                "nextval('job_pagina_Inc'),'" + _timestamp + "','" + _product + "','" +
                                Session["userid"].ToString() + "', '" + _timestamp + "', '1','" + _product_ID + "','"
                                + pas_isbn.Text.Trim() + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                + "','Extn-Error');";
                            //_sql = @"update job_epubmate_fl set status='WIP', input_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + @"' where job_id='" + _jobid + "';";
                            _sql.Add(sql);
                            DB_Operations _db = new DB_Operations();

                            if (_db.Execute_SQL_Query(_sql))
                            {
                                Debug.WriteLine("----------------JOB Registered Success---------------------");
                            }
                            else
                                Debug.WriteLine("----------------JOB Registered FAILED----------------------");
                            //lblError.Text += hpf.FileName + ": extension is not .zip, file not uploaded !!" + "<br />";
                        }
                    }
                }
            }
            File.Delete(newXMLFile);
            Response.Redirect("pagina.aspx");
        }
        #endregion

        #region BindListView 
        private void BindListView()
        {

            try
            {
                //Session["userid"]
                //string sql = @"Select id, input_file_name, status from job WHERE (user_id=" + Session["userid"].ToString() + " and upr_id=1) ORDER BY id DESC;";
                string sql = @"Select input_file_name,status,isbn,page_count,input_time, output_time, output_file_name from job_pagina WHERE (user_id=" + Session["userid"].ToString() + ") ORDER BY id DESC;";
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
                newdt.Columns.Add(new DataColumn("output_file_name", typeof(string)));
                int _sl = 1;
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

                        try
                        {
                            TimeSpan diff = DateTime.Parse(dr["output_time"].ToString()) - DateTime.Parse(dr["input_time"].ToString());
                            dataRow["total_time"] = diff.Hours.ToString("D2") + ":" + diff.Minutes.ToString("D2") + ":" + diff.Seconds.ToString("D2");
                        }
                        catch { }

                        string _op = dr["output_file_name"].ToString();
                        _op = _op.Replace(@"\", @"/");
                        _op = Regex.Replace(_op, "^(.*?)(i:/)(.+?)$", "../downloads/$3", RegexOptions.IgnoreCase);
                        //_op = Regex.Replace(_op, "^(.+?)(OutputFiles)(.+?)$", "../$2$3", RegexOptions.IgnoreCase);

                        dataRow["output_file_name"] = _op.ToString();

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
        #endregion

        #region OnPagePropertiesChanging
        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }
        #endregion

        #region ExitPage
        private void ExitPage()
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Product Config", "<script language='javascript'>alert('Product Authentication Denied')</script>");
            Response.Redirect("Default.aspx");
        }
        #endregion
    }
}