using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;
using System.Data;
using System.Web.Configuration;
using System.Diagnostics;

namespace EPubBuilder
{
    public class DB_Operations
    {
        private string _conn = WebConfigurationManager.ConnectionStrings["connSTR"].ConnectionString;
        private DataTable dt = new DataTable();
        private DataSet ds = new DataSet();

        public List<string> CheckRegUser()
        {
            List<string> lst = new List<string>();
            try
            {
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand cmd = new NpgsqlCommand("select username from login",conn);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                while(rd.Read())
                {
                    lst.Add(rd[0].ToString());
                }
                return lst;
            }
            catch(Exception ex)
            {

            }
            return lst;
        }
        public Dictionary<string,string> CheckRegUser(string un)
        {
            Dictionary<string, string> _un_ci = new Dictionary<string, string>();
            try
            {
                string sql = @"SELECT username,client_id,id,usertype,startdate,enddate FROM Login" +
                            " WHERE(LOWER(username) like LOWER('%" + un.Trim() + "%') AND isactive='true');";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _un_ci.Clear();
                while (dr.Read() == true)
                {
                    _un_ci.Add("username", dr[0].ToString());
                    _un_ci.Add("clientid", dr[1].ToString());
                    _un_ci.Add("userid", dr[2].ToString());
                    _un_ci.Add("usertype", dr[3].ToString());
                    _un_ci.Add("startdate", dr[4].ToString());
                    _un_ci.Add("enddate", dr[5].ToString());
                    return _un_ci;
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(ex.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _un_ci;
        }
        #region Return Username if registered
        public Dictionary<string,string> CheckRegUser(string un, string pw)
        {
            Dictionary<string, string> _un_ci = new Dictionary<string, string>();
            try
            {
                //select * from login where LOWER(username)=LOWER('Chetan')
                //string sql = @"SELECT username, client_id, id FROM Login" +
                //    " WHERE(" + @"""username""='" + un
                //    + "' AND " + @"""password""='" + pw
                //    + "' AND " + @"""isactive""=true"
                //    + ");";

                string sql = @"SELECT username,client_id,id,usertype,startdate,enddate FROM Login" +
                            " WHERE(LOWER(username)=LOWER('" + un.Trim() + "') AND password='" + pw
                            + "' AND isactive='true');";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _un_ci.Clear();
                while (dr.Read() == true)
                {
                    _un_ci.Add("username", dr[0].ToString());
                    _un_ci.Add("clientid", dr[1].ToString());
                    _un_ci.Add("userid", dr[2].ToString());
                    _un_ci.Add("usertype", dr[3].ToString());
                    _un_ci.Add("startdate", dr[4].ToString());
                    _un_ci.Add("enddate", dr[5].ToString());
                    return _un_ci;
                }
                conn.Close();
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _un_ci;
        }
        #endregion

        #region Return Client_Products
        public Dictionary<string, string> GetSubscribed_Product(string clientid)
        {
            Dictionary<string, string> _un_ci = new Dictionary<string, string>();
            try
            {
                string sql = @"select product.code, product.id from product INNER JOIN company_Product_Role on product.id=company_Product_Role.product_id AND company_Product_Role.isactive='true' AND company_Product_Role.client_id=" + clientid + ";";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _un_ci.Clear();
                while (dr.Read() == true)
                {
                    _un_ci.Add(dr[0].ToString(), dr[1].ToString());
                }
                conn.Close();
                return _un_ci;
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _un_ci;
        }
        #endregion

        #region Execute SQl Query
        public bool Execute_SQL_Query(List<string> _sql)
        {
            try
            {
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                foreach (string sql in _sql)
                {
                    NpgsqlCommand comm = new NpgsqlCommand(sql, conn);
                    Int32 rowsaffected = comm.ExecuteNonQuery();
                    //Debug.WriteLine("Affected:" + rowsaffected + "---" + sql);
                }
                conn.Close();
                //if (rowsaffected > 0) { return true; }
                //else { return false; }
                return true;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception@_registerNewJob-Function-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("-------------------------------------------");
                return false;
            }
        }
        #endregion

        #region Check_Super_Admin
        public bool Check_Super_Admin(string _user)
        {
            try
            {
                string sql = @"SELECT * FROM Login" +
                    " WHERE(" + @"""username""='" + _user
                    + "' AND " + @"""isadmin""=true"
                    + ");";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();

                int _count = 0;
                while (dr.Read() == true)
                {
                    _count += 1;
                }
                conn.Close();

                if (_count >= 1)
                    return true;
                else
                    return false;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return false;
            }
        }
        #endregion

        #region Generate_Report - Normal
        public string generateReport(string _uname, int _product, string _serverout)
        {
            string _thead = @"<table class=""report""><tr>
                <th>Job ID</th>
                <th>Input File</th>
                <th>Project Name</th>
                <th>Status</th>
                <th>Word Count</th>
                <th>Page Count</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Duration</th>
                <th>Output Link</th>
                </tr>";
            string _tdata = string.Empty;

            string _tend = Environment.NewLine + @"</table>";
            try
            {
                string sql = @"Select 
                                    id, 
                                    input_file_name, 
                                    status, 
                                    word_count, 
                                    page_count, 
                                    input_time, 
                                    output_time, 
                                    output_file_name, 
                                    project_name 
                                    from job WHERE (user_id=" + _uname + " and upr_id=" + _product + ") ORDER BY id DESC;";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                while (dr.Read() == true)
                {
                    //string outputPath = System.IO.Path.Combine(Server.MapPath("~/OutputFiles/")
                    //string _dfile = System.IO.Path.Combine(_serverout + dr[3].ToString());
                    string _dfile = @"../OutputFiles/" + dr[0].ToString() + @"/" + dr[3].ToString();
                    string _diffTime = "Undefined";
                    string _f = dr[7].ToString();
                    try
                    {
                        string[] _fl = _f.Split(new[] { "OutputFiles" }, StringSplitOptions.None);
                        _f = @"../OutputFiles" + _fl[1];
                    }
                    catch { }
                    try
                    {
                        TimeSpan diff = DateTime.Parse(dr[6].ToString()) - DateTime.Parse(dr[5].ToString());
                        _diffTime = diff.Hours.ToString("D2") + ":" + diff.Minutes.ToString("D2") + ":" + diff.Seconds.ToString("D2");
                    }
                    catch { }
                    _tdata += @"<tr><td >" +
                        dr[0].ToString() + @"</td><td>" + dr[1].ToString() + @"</td><td>" + dr[8].ToString() + @"</td><td>" +
                        dr[2].ToString() + @"</td><td>" + dr[3].ToString() + @"</td><td>" + 
                        dr[4].ToString() + @"</td><td>" + dr[5].ToString() + @"</td><td>" + 
                        dr[6].ToString() + @"</td><td>" + _diffTime + @"</td><td>" + 
                        @"<a target=""_blank"" href=""" + _f + @""">" + @"<img src=""../images/download.png""></img></a></td></tr>";
                }

                conn.Close();
                //Debug.WriteLine("------------------------------------");
                //Debug.WriteLine(_thead + _tdata + _tend);
                //Debug.WriteLine("------------------------------------");
                return (_thead + _tdata + _tend);
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return (_thead + _tdata + _tend);
            }
        }
        #endregion

        #region CheckProjects
        public Dictionary<string ,string> CheckProjects(string uid, string clid, string _product)
        {
            Dictionary<string, string> _project = new Dictionary<string, string>();
            try
            {
                string sql = @"SELECT project.id, project.name, project.isactive from login INNER JOIN Client on login.id=" + uid +
                    " AND login.client_id = client.id AND client.product_id=" + _product +
                    " INNER JOIN project on project.client_id = login.client_id;";
                
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _project.Clear();
                while (dr.Read() == true)
                {
                    Debug.WriteLine(dr[0].ToString().Trim() + "--" + dr[1].ToString().Trim() + "--" + dr[2].ToString().Trim());
                    if(dr[2].ToString().Trim() == "True")
                        _project.Add(dr[0].ToString().Trim(), dr[1].ToString().Trim());
                }
                conn.Close();
                return _project;
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _project;
        }
        #endregion

        #region GetUsername and id
        //select id,username from login where client_id=(SELECT client_id FROM login WHERE id = 1);
        public Dictionary<string, string> GetUsername_id(string _clientid)
        {
            Dictionary<string, string> _userDetails = new Dictionary<string, string>();
            try
            {
                string sql = @"SELECT id,username from login WHERE(client_id=" + _clientid + ");";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _userDetails.Clear();
                while (dr.Read() == true)
                {
                    _userDetails.Add(dr[0].ToString().Trim(), dr[1].ToString().Trim());
                }
                conn.Close();
                return _userDetails;
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception@GetUsername_id-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("---------------------------------------");
            }
            return _userDetails;
        }
        #endregion

        #region Generate_Report - Date range
        public string generateReport_Range(string _userid, int _product, string _serverout, bool _isadmin, string start_date, string end_date)
        {
            string _thead = @"<table class=""report""><tr>
                <th>Job ID</th>
                <th>Input File</th>
                <th>Project Name</th>
                <th>Status</th>
                <th>Word Count</th>
                <th>Page Count</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Duration</th>
                <th>Output Link</th>
                </tr>";
            string _tdata = string.Empty;

            string _tend = Environment.NewLine + @"</table>";
            try
            {
                string sql = @"Select id, 
                                    input_file_name, 
                                    status, 
                                    word_count, 
                                    page_count, 
                                    input_time, 
                                    output_time, 
                                    output_file_name, 
                                    project_name 
                                    from job WHERE (user_id=" + 
                    _userid + " and upr_id=" + _product + " AND input_time >='" + 
                    start_date + @"'::timestamp AND input_time <= '" + end_date +
                    @"'::timestamp) ORDER BY id DESC;";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                while (dr.Read() == true)
                {
                    //string outputPath = System.IO.Path.Combine(Server.MapPath("~/OutputFiles/")
                    //string _dfile = System.IO.Path.Combine(_serverout + dr[3].ToString());
                    string _dfile = @"../OutputFiles/" + dr[0].ToString() + @"/" + dr[3].ToString();
                    string _diffTime = "Undefined";
                    string _f = dr[7].ToString();
                    try
                    {
                        string[] _fl = _f.Split(new[] { "OutputFiles" }, StringSplitOptions.None);
                        _f = @"../OutputFiles" + _fl[1];
                    }
                    catch { }
                    try
                    {
                        TimeSpan diff = DateTime.Parse(dr[6].ToString()) - DateTime.Parse(dr[5].ToString());
                        _diffTime = diff.Hours.ToString("D2") + ":" + diff.Minutes.ToString("D2") + ":" + diff.Seconds.ToString("D2");
                    }
                    catch { }
                    _tdata += @"<tr><td >" +
                        dr[0].ToString() + @"</td><td>" + dr[1].ToString() + @"</td><td>" + dr[8].ToString() + @"</td><td>" +
                        dr[2].ToString() + @"</td><td>" + dr[3].ToString() + @"</td><td>" +
                        dr[4].ToString() + @"</td><td>" + dr[5].ToString() + @"</td><td>" +
                        dr[6].ToString() + @"</td><td>" + _diffTime + @"</td><td>" +
                        @"<a target=""_blank"" href=""" + _f + @""">" + @"<img src=""../images/download.png""></img></a></td></tr>";
                }

                conn.Close();
                //Debug.WriteLine("------------------------------------");
                //Debug.WriteLine(_thead + _tdata + _tend);
                //Debug.WriteLine("------------------------------------");
                return (_thead + _tdata + _tend);
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return (_thead + _tdata + _tend);
            }
        }
        #endregion

        #region Get all job report based on user id
        public string getAllReport(string _uprid, string start_date, string end_date)
        {
            string sql = string.Empty;

            sql = @"SELECT id,job.status,page_count, word_count, input_file_name, input_time, output_time, output_file_name FROM job INNER JOIN user_product_role ON job.upr_id=user_product_role.upr_id  where user_product_role.user_id= " + _uprid +
                @"AND job.input_time >='" + start_date + @"'::timestamp AND job.input_time <= '" + end_date +
                @"'::timestamp ORDER BY job.input_time DESC";
            //string sql = @"Select id, status, page_count, word_count, input_file_name, input_time, output_time, output_file_name from job WHERE (user_id=" + _uname + " and upr_id=" + _product + ") ORDER BY id DESC";

            //Start Time   End Time Duration  Status  
            string _thead = @"<table class=""report""><tr>
                <th>Job ID</th>
                <th>Status</th>
                <th>Page Count</th>
                <th>Word Count</th>
                <th>Input File</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Duration</th>
                <th>Output Link</th>
                </tr>";

            string _tdata = string.Empty;

            string _tend = Environment.NewLine + @"</table>";
            try
            {
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();

                int _count = 1;
                bool toggle = true;
                while (dr.Read() == true)
                {
                    if (toggle)
                    {
                        _tdata += @"<tr style=""background-color:rgba(0,0,0,0.1);""><td style=""height:40px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                             _count.ToString("D3") + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[0].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[1].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[2].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[3].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;"">" +
                            @"</td></tr>";
                        toggle = false;
                    }
                    else
                    {
                        _tdata += @"<tr style=""background-color:rgba(104,104,104,0.1);""><td style=""height:40px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                             _count.ToString("D3") + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[0].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[1].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[2].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;font-size:13px;"">" +
                            dr[3].ToString() + @"</td><td style=""height:30px;vertical-align:middle;text-align:center;"">" +
                            @"</td></tr>";
                        toggle = true;
                    }
                    _count++;
                }

                conn.Close();
                //Debug.WriteLine("------------------------------------");
                //Debug.WriteLine(_thead + _tdata + _tend);
                //Debug.WriteLine("------------------------------------");
                return (_thead + _tdata + _tend);
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return (_thead + _tdata + _tend);
            }
        }
        #endregion

        #region getUserData
        public DataTable getUserData(string _clientid)
        {
            DataTable _dt = new DataTable();
            try
            {
                string sql = @"SELECT id,username,password,isadmin,isactive FROM login WHERE(client_id=" + _clientid + ") ORDER BY id;";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                //NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                ds.Reset();
                da.Fill(ds);
                _dt = ds.Tables[0];
                return _dt;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return _dt;
            }
        }
        #endregion

        #region Get_CE_Group_Details
        //public List<object> get_General_config(string clid)
        public DataTable Get_CE_Group_Details()
        {
            DataTable _dt = new DataTable();
            try
            {
                string sql = @"select id,group_name,is_checkbox from ce_group where isactive='true';";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                ds.Reset();
                da.Fill(ds);
                _dt = ds.Tables[0];
                return _dt;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return _dt;
            }
        }
        #endregion

        #region CE modules name
        public DataTable Get_CE_Modules_Name()
        {
            DataTable _dx = new DataTable();
            DataSet dst = new DataSet();
            try
            {
                string sql = @"select module_code,module_name,group_id from ce_module where isactive = 'true' ORDER BY group_id ASC;";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                dst.Reset();
                da.Fill(dst);
                _dx = dst.Tables[0];
                return _dx;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return _dx;
            }
        }
        #endregion

        #region Get_Default_Module_selected_for_project
        public List<string> getConfig(string _pro, string _client)
        {
            List<string> _modules = new List<string>();
            try
            {
                string sql = "SELECT module_code FROM project_modules_mapping WHERE(project_id=" + _pro + " AND client_id=" + _client + ");";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _modules.Clear();
                while (dr.Read() == true)
                {
                    _modules.Add(dr[0].ToString().Trim());
                }
                conn.Close();
                return _modules;
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _modules;
        }
        #endregion

        #region Get_all_project_name_for_the_client
        public Dictionary<int, string> Get_all_project_name_of_client(string _client)
        {
            Dictionary<int, string> _projectLinks = new Dictionary<int, string>();
            try
            {
                string sql = "SELECT id,name FROM project WHERE(isactive='true' AND client_id=" + _client + ");";

                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = command.ExecuteReader();
                _projectLinks.Clear();
                while (dr.Read() == true)
                {
                    _projectLinks.Add(Int32.Parse(dr[0].ToString()), dr[1].ToString().Trim());
                }
                conn.Close();
                return _projectLinks;
            }

            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
            }
            return _projectLinks;
        }
        #endregion

        #region getProjectData
        public DataTable getProjectData(string _clientid)
        {
            DataTable _dt = new DataTable();
            try
            {
                string sql = @"SELECT id,name,isactive FROM project WHERE(client_id=" + _clientid + ") ORDER BY id;";
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                //NpgsqlCommand command = new NpgsqlCommand(sql, conn);
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                ds.Reset();
                da.Fill(ds);
                _dt = ds.Tables[0];
                return _dt;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return _dt;
            }
        }
        #endregion

        #region Get DataTableFrom Query
        public DataTable DataTableFrom_Query(string sql)
        {
            DataTable _dx = new DataTable();
            DataSet dst = new DataSet();
            try
            {
                NpgsqlConnection conn = new NpgsqlConnection(_conn);
                conn.Open();
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                dst.Reset();
                da.Fill(dst);
                _dx = dst.Tables[0];
                return _dx;
            }
            catch (Exception _e)
            {
                Debug.WriteLine("--------Exception-------");
                Debug.WriteLine(_e.Message.ToString());
                Debug.WriteLine("------------------------");
                return _dx;
            }
        }
        #endregion

        
    }
}