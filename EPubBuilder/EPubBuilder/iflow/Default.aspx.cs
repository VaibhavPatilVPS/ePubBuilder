using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap.itrack
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["prevUrl"] = Request.Url;
            if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; LabelUser.InnerText = "Hi " + Session["UserAuthentication"].ToString(); }
            else { login_lbl.Visible = true; logout_Lbl.Visible = false; }
        }
    }
}