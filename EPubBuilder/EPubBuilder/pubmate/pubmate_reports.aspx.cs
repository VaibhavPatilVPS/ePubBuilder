using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class ice_reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] == null) { Response.Redirect("Default.aspx"); }

            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString();
            DB_Operations _DB = new DB_Operations();

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

            if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
            {
                __admin__.Visible = false;
            }

            //txtDate1.Text = DateTime.Now.ToString("dd-MM-yyyy");
            //txtDate1.TextMode = TextBoxMode.Date;
            //txtDate2.Text = DateTime.Today.AddDays(-60).ToString("dd-MM-yyyy");
            //txtDate2.TextMode = TextBoxMode.Date;
            //Debug.WriteLine("------>>>" + txtDate1.Text);
            //Debug.WriteLine("------>>>" + txtDate2.Text);

            if (!IsPostBack)
            {
                //txtDate1.Text = DateTime.Now.ToString("dd-MM-yyyy");
                //txtDate1.TextMode = TextBoxMode.Date;
                //txtDate2.Text = DateTime.Today.AddDays(-60).ToString("dd-MM-yyyy");
                //txtDate2.TextMode = TextBoxMode.Date;

                selUsers.Items.Clear();
                if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
                {
                    __admin__.Visible = false;
                    selUsers.Items.Add(Session["UserAuthentication"].ToString());
                }
                else
                {
                    __admin__.Visible = true;
                    Dictionary<string, string> _usr = new Dictionary<string, string>();
                    _usr = _DB.GetUsername_id(Session["clientid"].ToString());
                    Session["_Username_id_"] = _usr;

                    if (_usr.Count > 0)
                    {
                        foreach(var _v in _usr)
                        {
                            selUsers.Items.Add(_v.Value.ToString());
                        }
                    }
                    else
                    {
                        _usr.Add(Session["userid"].ToString(), Session["UserAuthentication"].ToString());
                        Session["_Username_id_"] = _usr;
                        selUsers.Items.Add(Session["UserAuthentication"].ToString());
                    }
                }
                //generateReport();
                //this.BindListView();
            }
        }

        protected void getReport_Click(object sender, EventArgs e)
        {
            //generateReport();
            lvCustomers.DataSource = null;
            lvCustomers.DataBind();
            this.BindListView();
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }

        private void BindListView()
        {
            DB_Operations _DB = new DB_Operations();
            //bool _isadmin = false;

            //if (__admin__.Visible == true)
            //{
            //    _isadmin = true;
            //}
            //else
            //{
            //    _isadmin = false;
            //}
            try
            {

                if (Session["_Username_id_"].ToString().Length > 0)
                {
                    string _current = selUsers.Text;
                    Dictionary<string, string> _dic = new Dictionary<string, string>();
                    _dic = (Dictionary<string, string>)Session["_Username_id_"];
                    if (_dic.ContainsValue(_current))
                    {
                        foreach (var _v in _dic)
                        {
                            if (_v.Value.ToLower() == _current.ToLower())
                            {
                                string sql = @"Select id, input_file_name, project_name, status, word_count, page_count, input_time, output_time, output_file_name from job WHERE (user_id="
                                + _v.Key.ToString()
                                + " AND upr_id=1"
                                + " AND input_time >='"
                                + txtDate1.Text + @"'::timestamp AND input_time <= '"
                                + txtDate2.Text
                                + "') ORDER BY id DESC;";

                                DataTable dt = new DataTable();
                                DataTable newdt = new DataTable();
                                DataRow dataRow = null;
                                dt = _DB.DataTableFrom_Query(sql);

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
                        }
                    }
                }
            }
            catch { }
        }
    }
}