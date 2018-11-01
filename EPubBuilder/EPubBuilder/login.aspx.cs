using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;

namespace EPubBuilder
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            error_status.Visible = false;
            //Session.Abandon();
            if (!IsPostBack)
            {
                error_status.Text = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DB_Operations _db = new DB_Operations();
            Dictionary<string, string> _status = _db.CheckRegUser(txtUserName.Text.ToLower().Trim().ToLower(), txtPWD.Text.Trim().ToString());
            if (_status.ContainsKey("username") && _status.ContainsKey("userid"))
            {
                string uname = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtUserName.Text.Trim());
                Session["UserAuthentication"] = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtUserName.Text.Trim());
                Session["userid"] = _status["userid"].ToString().Trim();

                if (_status.ContainsKey("usertype"))
                {
                    if (_status["usertype"].ToString().Trim() == string.Empty)
                    {
                        Session["usertype"] = "RegularUser";
                    }
                    else if (_status["usertype"].ToString().Trim().ToLower() == "demo")
                    {
                        Session["usertype"] = _status["usertype"].ToString().Trim();
                    }

                    Dictionary<string, string> _un_ci = new Dictionary<string, string>();
                    _un_ci = _db.GetSubscribed_Product(_status["clientid"].ToString().Trim());
                    Session["products"] = _un_ci;
                }
                if (_status.ContainsKey("enddate"))
                {
                    Session["enddate"] = _status["enddate"].ToString().Trim();
                }
                else
                {
                    Session["enddate"] = string.Empty;
                }

                if (_status.ContainsKey("startdate"))
                {
                    Session["startdate"] = _status["startdate"].ToString().Trim();
                }
                else
                {
                    Session["startdate"] = string.Empty;
                }

                if (_status.ContainsKey("clientid"))
                {
                    Session["clientid"] = _status["clientid"].ToString();
                    Dictionary<string, string> _un_ci = new Dictionary<string, string>();
                    _un_ci = _db.GetSubscribed_Product(_status["clientid"].ToString().Trim());
                    Session["products"] = _un_ci;
                }
                else
                    Session["clientid"] = "0";

                //Debug.WriteLine(Session["clientid"].ToString());
                if (Session["prevUrl"] != null)
                {
                    string link = Session["prevUrl"].ToString();
                    Response.Redirect(Session["prevUrl"].ToString());
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                error_status.Visible = true;
                error_status.Text = "<span style='color:red;'>Authentication Denied</span>";
                //ClientScript.RegisterStartupScript(Page.GetType(), "iCE Converter", "<script language='javascript'>alert('Authentication Denied')</script>");
            }
        }
    }
}