using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class project_management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] == null) { Response.Redirect("Default.aspx"); }

            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString();

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

            DB_Operations _DB = new DB_Operations();

            if (!IsPostBack)
            {
                if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
                {
                    __admin__.Visible = false;
                    Response.Redirect("logout.aspx", false);
                }
                else
                {
                    __admin__.Visible = true;
                }
                GridView1.DataSource = _DB.getProjectData(Session["clientid"].ToString());
                GridView1.DataBind();
            }
        }

        protected void ButtonAddProject_Click(object sender, EventArgs e)
        {
            try
            {
                if (__admin__.Visible == true)
                {
                    DB_Operations _DB = new DB_Operations();
                    string _proname = proname.Text.ToString().Trim();
                    if (_proname != string.Empty)
                    {
                        if (_proname.Length > 0)
                        {
                            List<string> _allSQL = new List<string>();
                            string _sql = "INSERT INTO project VALUES (nextval('login_inc'),'" + _proname + "'," + Session["clientid"].ToString() + ",'true');";

                            _allSQL.Add(_sql);
                            _DB.Execute_SQL_Query(_allSQL);
                            GridView1.DataSource = _DB.getProjectData(Session["clientid"].ToString());//Session["clientid"]
                            GridView1.DataBind();
                            proname.Text = string.Empty;
                        }
                    }
                }
            }
            catch { }
        }

        protected void ButtonCombo_Click(object sender, EventArgs e)
        {
            try
            {
                List<string> _update = new List<string>();
                //List<string> _delete = new List<string>();

                foreach (GridViewRow _row in GridView1.Rows)
                {
                    var idbox = _row.FindControl("id_") as Label;
                    var textbox = _row.FindControl("projectname") as TextBox;
                    CheckBox c1 = (CheckBox)_row.FindControl("cb1");

                    string _c1 = "false";
                    string _l1 = idbox.Text.Trim();
                    string _t1 = textbox.Text.Trim();
                    if (c1.Checked == true) { _c1 = "true"; }

                    string _usql = "UPDATE project SET name='" + _t1 + "', isactive='" + _c1 + "' where (id=" + _l1 + ");";
                    _update.Add(_usql);
                }
                DB_Operations _DB = new DB_Operations();
                _DB.Execute_SQL_Query(_update);
                //_DB.Execute_SQL_Query(_delete);
            }
            catch (Exception _e)
            {
                Debug.WriteLine("EXC@>>ButtonCombo_Click>>>" + _e.Message.ToString());
            }
        }
    }
}