using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class user_management : System.Web.UI.Page
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
                GridView1.DataSource = _DB.getUserData(Session["clientid"].ToString());
                GridView1.DataBind();
            }
        }

        protected void ButtonAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (__admin__.Visible == true)
                {
                    DB_Operations _DB = new DB_Operations();
                    //string _nm = c1_nm.Text.ToString().Trim();
                    string _un = c1_un.Text.ToLower().ToString().Trim();
                    string _pw = c1_pw.Text.ToString().Trim();
                    bool _acti = true;
                    bool _supr = false;
                    if (c1_super.Checked == true) { _supr = true; }
                    if ((_un != string.Empty) && (_pw != string.Empty))
                    {
                        if ((_un.Length > 0) && (_pw.Length > 0))
                        {
                            List<string> _allSQL = new List<string>();
                            //INSERT INTO Project VALUES(nextval('login_inc'),'TEST_CE', 1, true);
                            string _sql = "INSERT INTO login(id,username,password,client_id,isadmin,isactive) VALUES (nextval('login_inc'),'" +
                                _un + "','" + _pw + "','" +
                                Session["clientid"].ToString() + "','" + _supr.ToString() + "','" + _acti.ToString() + "');";

                            _allSQL.Add(_sql);

                            _DB.Execute_SQL_Query(_allSQL);

                            GridView1.DataSource = _DB.getUserData(Session["clientid"].ToString());
                            GridView1.DataBind();

                            c1_un.Text = string.Empty;
                            c1_pw.Text = string.Empty;
                            //c1_act.Checked = false;
                            c1_super.Checked = false;
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
                    var passbox = _row.FindControl("password") as TextBox;
                    var textbox = _row.FindControl("username") as Label;
                    CheckBox c1 = (CheckBox)_row.FindControl("cb1");
                    CheckBox c2 = (CheckBox)_row.FindControl("cb2");

                    string _c1 = "false";
                    string _c2 = "false";

                    if (c1.Checked == true) { _c1 = "true"; }
                    if (c2.Checked == true) { _c2 = "true"; }

                    string _usql = "UPDATE LOGIN SET password='" + passbox.Text.Trim() + "', isadmin='" + _c1 + "', isactive='" + _c2 + "' where (id=" + idbox.Text.Trim() + ");";
                    _update.Add(_usql);
                }
                DB_Operations _DB = new DB_Operations();
                _DB.Execute_SQL_Query(_update);
                //_DB.Execute_SQL_Query(_delete);
            }
            catch
            {

            }
        }
    }
}