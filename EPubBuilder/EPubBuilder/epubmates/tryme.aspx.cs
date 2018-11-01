using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using System.Web.Script.Serialization;



namespace EPubBuilder.epubmates
{
    
    public partial class tryme : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = "6Lemc00UAAAAANsfqSvcLN3pVI_tLdUScMWoEOyH";
        protected static string ReCaptcha_Secret = "6Lemc00UAAAAAIHdsPCZC0eVV8u_32wV8b1zHovh";

        
        protected void Page_Load(object sender, EventArgs e)
        {
            // GetUser();
            //if (Session["UserAuthentication"] != null) { login_lbl.Visible = false; logout_Lbl.Visible = true; }
            //else { login_lbl.Visible = true; logout_Lbl.Visible = false; }

            //Session["prevUrl"] = Request.Url;
            //LabelUser.InnerText = "Hi Guest";
            //DB_Operations _DB = new DB_Operations();
            //if (IsPostBack)
            //{

            //    string userResponse = HttpContext.Request.Params["g-recaptcha-response"];
            //    bool validCaptcha = ReCaptcha.ValidateCaptcha(userResponse);
            //    if (validCaptcha)
            //    {
            //    }
            //}
            
        }

        public void btnGuest_Click(object sender, EventArgs e)
        {

        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (terms.Checked == false)
                {
                    accTXT.Text = @"<span style=""color: red; font-size: 12px; text-align: left;""> Required</span>";
                    return;
                }

                //CaptchaResult

                //MSCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());

                //if (MSCaptcha.UserValidated)
                //{
                //    CaptchaResult.ForeColor = System.Drawing.Color.Green;
                //    CaptchaResult.Font.Size = 12;
                //    CaptchaResult.Text = "Valid";
                //}
                //else
                //{
                //    CaptchaResult.ForeColor = System.Drawing.Color.Red;
                //    CaptchaResult.Font.Size = 12;
                //    CaptchaResult.Text = "InValid";
                //    return;
                //}

                DB_Operations _DB = new DB_Operations();
                //string _nm = c1_nm.Text.ToString().Trim();
                List<string> _allSQL = new List<string>();
                //INSERT INTO Project VALUES(nextval('login_inc'),'TEST_CE', 1, true);
                //_sql = @"update job_epubmate_fl set status='WIP', input_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + @"' where job_id='" + _jobid + "';";
                //"2018-03-24 12:13:41"
                //'2018-03-20 01:00:00'
                string _sql = "INSERT INTO login(id,username,password,client_id,isadmin,isactive,firstname,lastname,country,contact_number,usertype,startdate,enddate,campaign) VALUES(nextval('login_inc'),'" +
                    Email.Text.Trim().ToLower() + "','" +
                    password1.Text.Trim() + "',12,'False','True','" +
                    Firstname.Text.Trim() + "','" +
                    Lastname.Text.Trim() + "','" +
                    country.Text.Trim() + "','" +
                    contactnum.Text.Trim() + "','Demo','2018-03-20 00:01:00','2018-04-17 23:59:00','LBF-2018');";
                Dictionary<string, string> _reguser = _DB.CheckRegUser(Email.Text.Trim().ToLower(), password1.Text.Trim());
                if (_reguser.Count <= 0)
                {
                    _allSQL.Add(_sql);

                    if (_DB.Execute_SQL_Query(_allSQL))
                    {
                        Firstname.Text = string.Empty;
                        Lastname.Text = string.Empty;
                        Email.Text = string.Empty;
                        password1.Text = string.Empty;
                        password2.Text = string.Empty;
                        country.Text = string.Empty;
                        contactnum.Text = string.Empty;
                    }
                }
                else
                {
                    Extstlbl.Visible = true;
                    Extstlbl.Text = @"<span style=""color: red; font-size: 12px; text-align: right; padding-left:50px;""> Username already Exists!</span>";
                }
            }
            catch (Exception ex)
            {
                

            }

        }

        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

        protected void Email_TextChanged(object sender, EventArgs e)
        {
            
            Dictionary<string, string> _un_li = new Dictionary<string, string>();
            DB_Operations _db = new DB_Operations();
           _un_li = _db.CheckRegUser(Email.Text);
            if(_un_li.Count>0)
            {
                Extstlbl.Visible = true;
                Extstlbl.Text = @"<span style=""color: red; font-size: 12px; text-align: right; padding-left:50px;""> Username taken!</span>";
                btnSubmit.Visible = false;
            }
            else
            {
                Extstlbl.Visible = false;
                btnSubmit.Visible = true;
            }
        }
    }

    //public class ReCaptchaClass
    //{
    //    public static string Validate(string EncodedResponse)
    //    {
    //        var client = new System.Net.WebClient();

    //        string PrivateKey = "6LcH-6Lemc00UAAAAAIHdsPCZC0eVV8u_32wV8b1zHovh";

    //        var GoogleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", PrivateKey, EncodedResponse));

    //        var captchaResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<ReCaptchaClass>(GoogleReply);

    //        return captchaResponse.Success;
    //    }

    //    [JsonProperty("success")]
    //    public string Success
    //    {
    //        get { return m_Success; }
    //        set { m_Success = value; }
    //    }

    //    private string m_Success;
    //    [JsonProperty("error-codes")]
    //    public List<string> ErrorCodes
    //    {
    //        get { return m_ErrorCodes; }
    //        set { m_ErrorCodes = value; }
    //    }


    //    private List<string> m_ErrorCodes;
    //}
}