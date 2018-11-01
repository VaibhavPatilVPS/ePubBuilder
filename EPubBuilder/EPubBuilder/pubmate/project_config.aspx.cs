using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCE_Webapp_Bootstrap
{
    public partial class project_config : System.Web.UI.Page
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
            Dictionary<int, string> _projectLinks = new Dictionary<int, string>();
            //int _ind = 1;
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
                    Session["projectComboData"] = _DB.Get_all_project_name_of_client(Session["clientid"].ToString());
                    if (HttpContext.Current.Session["projectComboData"] != null)
                    {
                        _projectLinks = (Dictionary<int, string>)HttpContext.Current.Session["projectComboData"];
                    }
                }

                if(_projectLinks.Count > 0)
                {
                    foreach (var _drop in _projectLinks.ToList())
                        selProjectCombo.Items.Add(_drop.Value.ToString());
                }
                else
                {
                    updateProjectSettingsBtn.Enabled = false;
                }

                __Fill_Data(__initProjectSettings());
                //TreeView1.CollapseAll();
            }
        }

        private void __Fill_Data(string _projectid)
        {
            DB_Operations _DB = new DB_Operations();
            int _ind = 1;
            DataTable _dt = new DataTable();
            DataTable _dM = new DataTable();
            TreeView1.Nodes.Clear();
            List<string> _modules = new List<string>();
            List<string> _Pmodules = new List<string>();
            _modules = _DB.getConfig("0", Session["clientid"].ToString());
            _Pmodules = _DB.getConfig(_projectid, Session["clientid"].ToString());

            _dt = _DB.Get_CE_Modules_Name();
            _dM = _DB.Get_CE_Group_Details();

            // Get all selected previous value in the DB
            string _skipcode = "-1";
            //foreach(string _skip in _modules.ToList())
            //{
            //    if (_skip.ToLower().StartsWith("g6_"))
            //    {
            //        _skipcode = "6";
            //    }
            //}
            foreach (DataRow _v in _dM.Rows)
            {
                string _checked = _v[2].ToString();
                TreeNode _t = new TreeNode();
                //_t.Text = _v[1].ToString();
                _t.Value = _v[0].ToString() + "_" + _checked;
                _t.Text = "<span style='color:blue'>" + _v[1].ToString() + "</span>";
                //_t.Value = _v[0].ToString();

                if (_t.Value.ToString() != _skipcode)
                {
                    TreeView1.Nodes.Add(_t);

                    foreach (DataRow _r in _dt.Rows)
                    {
                        if (Int32.Parse(_r[2].ToString()) == Int32.Parse(_v[0].ToString()))
                        {
                            TreeNode _c = new TreeNode();
                            _c.Value = _r[0].ToString();

                            if (_modules.Contains(_c.Value.ToString()))
                            {
                                _c.ShowCheckBox = false;
                                _c.Text = "<span style='color:#fe461e;'>&nbsp;&nbsp;&nbsp;&nbsp;" + _r[1].ToString() + "</span>";
                            }
                            else if (_Pmodules.Contains(_c.Value.ToString()))
                            {
                                if (_t.Value.ToLower().EndsWith("_false"))
                                {
                                    _c.ShowCheckBox = false;

                                    if (_Pmodules.Contains(_c.Value.ToString()))
                                    {
                                        _c.Text = "<input type='radio' ID='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' checked='checked' name='rdoC1' text='" + _c.Value.ToString() + "' />" + _r[1].ToString();
                                        _t.Checked = true;
                                    }
                                    else
                                        _c.Text = "<input type='radio' ID='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' name='rdoC1' text='" + _c.Value.ToString() + "' />" + "<span style='color:green'>" + _r[1].ToString() + "</span>";
                                    _ind++;
                                }
                                else
                                {
                                    _c.ShowCheckBox = true;
                                    _c.Checked = true;
                                    _c.Text = "<span style='color:red'>" + _r[1].ToString() + "</span>";
                                }
                                
                            }
                            else
                            {
                                if (_t.Value.ToLower().EndsWith("_false"))
                                {
                                    _c.ShowCheckBox = false;
                                    _c.Text = "<input type='radio' ID='refOption" + _ind.ToString() + "' runat='server' GroupName='ref' name='rdoC1' text='" + _c.Value.ToString() + "' />" + "<span style='color:green'>" + _r[1].ToString() + "</span>";
                                    _ind++;
                                }
                                else
                                {
                                    _c.Text = "<span style='color:green'>" + _r[1].ToString() + "</span>";
                                }
                            }
                            _t.ChildNodes.Add(_c);
                        }
                    }
                }
            }
            TreeView1.ExpandAll();
        }

        protected void updateProjectSettingsBtn_Click(object sender, EventArgs e)
        {
            // Delete all the default settings from the DB of current client and add the updated settings.
            // get all selected items from the client page treeview.
            List<string> _updateDB = new List<string>();
            string _currentprojectId = __initProjectSettings();
            _updateDB.Add("DELETE FROM project_modules_mapping WHERE(project_id=" + _currentprojectId + "AND client_id=" + Session["clientid"].ToString() + ");");
            
            string _refQuery = string.Empty;
            foreach (TreeNode _n in TreeView1.Nodes)
            {
                if (_n.ChildNodes.Count > 0)
                {

                    TreeNodeCollection nodes = _n.ChildNodes;


                    foreach (TreeNode _t in nodes)
                    {
                        if ((_t.Checked == true) && (!_t.Value.ToString().ToLower().StartsWith("g6_")))
                        {
                            string _s = "INSERT INTO project_modules_mapping VALUES(nextval('Project_Modules_Mapping_Inc')," + _currentprojectId + ",'true'," + Session["clientid"].ToString() + ",'" + _t.Value.ToString() + "');";
                            _updateDB.Add(_s);
                        }
                        else if (_t.Selected == true)
                        {
                            string _s = "INSERT INTO project_modules_mapping VALUES(nextval('Project_Modules_Mapping_Inc')," + _currentprojectId + ",'true'," + Session["clientid"].ToString() + ",'" + _t.Value.ToString() + "');";
                            _updateDB.Add(_s);
                        }
                    }
                }
            }
            DB_Operations _DB = new DB_Operations();
            _DB.Execute_SQL_Query(_updateDB);
            __Fill_Data(_currentprojectId);
            TreeView1.ExpandAll();
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            __Fill_Data(__initProjectSettings());
        }

        private string __initProjectSettings()
        {
            Dictionary<int, string> _projectLinks = new Dictionary<int, string>();
            string _projectid = "0";
            if (HttpContext.Current.Session["projectComboData"] != null)
            {
                _projectLinks = (Dictionary<int, string>)HttpContext.Current.Session["projectComboData"];
            }

            if (_projectLinks.Count > 0)
            {
                var myKey = _projectLinks.FirstOrDefault(x => x.Value == selProjectCombo.Text).Key;
                _projectid = myKey.ToString();
                //Debug.WriteLine("---------------->" + myKey.ToString());
            }
            return _projectid;
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