using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class ice_downloads : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
                {
                    __admin__.Visible = false;
                }
                else
                {
                    __admin__.Visible = true;
                }
            }
        }
    }
}