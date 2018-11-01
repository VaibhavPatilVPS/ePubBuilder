using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class default_config : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                //TreeView1.Attributes.Add("onclick", "postBackByObject()");
                if (!_DB.Check_Super_Admin(Session["UserAuthentication"].ToString().ToLower()))
                {
                    __admin__.Visible = false;
                    Response.Redirect("logout.aspx", false);
                }
                else
                {
                    __admin__.Visible = true;
                    populateData();
                }
                
                //TreeView1.CollapseAll();
                //ddlusers.Items.FindByText("Rohini").Selected = true;
            }
        }

        private void populateData()
        {
            DataTable _dt = new DataTable();
            DataTable _dM = new DataTable();
            int _ind = 1;
            int _grp = 1;
            TreeView1.Nodes.Clear();
            DB_Operations _DB = new DB_Operations();

            List<string> _modules = new List<string>();
            _modules = _DB.getConfig("0", Session["clientid"].ToString());

            _dt = _DB.Get_CE_Modules_Name();
            _dM = _DB.Get_CE_Group_Details();

            // Get all selected previous value in the DB
            foreach (DataRow _v in _dM.Rows)
            {
                string _checked = _v[2].ToString();
                TreeNode _t = new TreeNode();
                _t.Value = _v[0].ToString() + "_" + _checked;
                _t.Text = "<span style='color:blue'>" + _v[1].ToString() + "</span>";
                TreeView1.Nodes.Add(_t);

                foreach (DataRow _r in _dt.Rows)
                {
                    if (Int32.Parse(_r[2].ToString()) == Int32.Parse(_v[0].ToString()))
                    {
                        TreeNode _c = new TreeNode();
                        _c.Text = "<span style='color:black'>" + _r[1].ToString() + "</span>";
                        _c.Value = _r[0].ToString();

                        if (_t.Value.ToLower().EndsWith("_false"))
                        {
                            _t.Text = "<span style='color:blue'>" + _v[1].ToString() + "</span>";
                            _c.ShowCheckBox = false;

                            if (_modules.Contains(_c.Value.ToString()))
                            {
                                string rName = string.Empty;
                                _c.Text = "<input type='radio' id='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' name='rdoC" + _grp.ToString() + "' text='" + _c.Value.ToString() + "' />" + _c.Text;
                                //_c.Text = "<asp:RadioButton id='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' checked='checked' name='rdoC" + _grp.ToString() + "' text='" + _c.Value.ToString() + "' />" + _c.Text;
                                _t.Checked = true;
                            }
                            else
                                //_c.Text = "<asp:RadioButton id='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' name='rdoC" + _grp.ToString() + "' text='" + _c.Value.ToString() + "' />" + _c.Text;
                                _c.Text = "<input type='radio' id='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' name='rdoC" + _grp.ToString() + "' text='" + _c.Value.ToString() + "' />" + _c.Text;
                            _ind++;
                        }

                        if (_modules.Contains(_c.Value.ToString()))
                            _c.Checked = true;

                        _t.ChildNodes.Add(_c);
                        //_t.ChildNodes.Add(new TreeNode(_r[1].ToString(), _r[0].ToString()));
                    }
                }
                _grp++;
            }
            TreeView1.ExpandAll();
        }

        protected void updateDefaultSettingsBtn_Click(object sender, EventArgs e)
        {
            // Delete all the default settings from the DB of current client and add the updated settings.
            // get all selected items from the client page treeview.
            List<string> _updateDB = new List<string>();
            _updateDB.Add("DELETE FROM project_modules_mapping WHERE(project_id=0 AND client_id=" + Session["clientid"].ToString() + ");");
            bool _globalref = false;
            string _refQuery = string.Empty;
            foreach (TreeNode _n in TreeView1.Nodes)
            {
                if(_n.Text.ToLower().ToString().Contains("reference marking structuring"))
                {

                }
                if (_n.ChildNodes.Count > 0)
                {
                    //Debug.WriteLine(">-->" + _n.ChildNodes.Count.ToString() + "---" + _n.Value.ToString() + "---" + _n.Text.ToString());
                    TreeNodeCollection nodes = _n.ChildNodes;
                    if((_n.Value.ToLower().EndsWith("_false")) && (_n.Checked == true))
                    {
                        _globalref = true;
                    }

                    foreach (TreeNode _t in nodes)
                    {
                        Debug.WriteLine("xxx---->" + _t.Text.ToString());
                        //string rName = string.Empty;
                        //try
                        //{
                        //    rName = _t.Text.ToString();
                        //    if(rName.Length > 0)
                        //    {
                        //        rName = Regex.Replace(rName,@"^(.+?)id='(.+?)'(.*)$", "$2");
                        //        //rName1 = Regex.Replace(rName,@"^(.+?)name='(.+?)'(.*)$", "$2");
                        //        HtmlInputRadioButton radioBtn = (HtmlInputRadioButton)this.form1.FindControl(rName);

                        //        //RadioButton radioBtn;
                        //        //radioBtn = TreeView1.FindControl(rName) as RadioButton;
                        //        string __d = "<p>" + Request.Form[rName] + "</p>";
                        //        Debug.WriteLine(__d);
                        //        RadioButton AgeTextBox = Page.FindControl(rName) as RadioButton;
                        //        Debug.WriteLine(__d);
                        //        string __d1 = "<p>" + Request[rName] + "</p>";
                        //        Debug.WriteLine(__d1);
                        //        string strValue = Page.Request.Form["rName"];
                        //        //if (radioBtn.Checked == true)
                        //        //{

                        //        //}
                        //    }
                        //}
                        //catch(Exception _e)
                        //{
                        //    Debug.WriteLine("Exc@>>" + _e.Message.ToString());
                        //}
                        

                        if ((_t.Checked == true) && (!_n.Value.ToLower().EndsWith("_false")))
                        {
                            string _s = "INSERT INTO project_modules_mapping VALUES(nextval('Project_Modules_Mapping_Inc')," + "0,'true'," + Session["clientid"].ToString() + ",'" + _t.Value.ToString() + "');";
                            _updateDB.Add(_s);
                        }
                        else if(_t.Checked == true)
                        {
                            if (_globalref)
                            {
                                _refQuery = "INSERT INTO project_modules_mapping VALUES(nextval('Project_Modules_Mapping_Inc')," + "0,'true'," + Session["clientid"].ToString() + ",'" + _t.Value.ToString() + "');";
                                //_globalref = false;
                                _updateDB.Add(_refQuery);
                            }
                        }
                    }
                }
            }

            //if (_globalref && _refQuery.Length > 0)
            //{
            //    _updateDB.Add(_refQuery);
            //}

            DB_Operations _DB = new DB_Operations();
            _DB.Execute_SQL_Query(_updateDB);
            populateData();
        }

        protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
        {
            if (e.Node.Checked == true)
            {
                //ClientScript.RegisterStartupScript(GetType(), "alertme", "alert('The first node is selected...');", true);
            }
        }

        protected void TreeView1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            //ClientScript.RegisterStartupScript(GetType(), "alertme", "alert('The first node is selected...');", true);
        }
    }
}