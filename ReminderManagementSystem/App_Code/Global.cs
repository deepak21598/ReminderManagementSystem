using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem.App_Code
{
    public class Global
    {
        public SqlConnection conn = null;
        public SqlCommand cmd = null;
        public DataTable dt = null;
        public string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["CreamBell"].ToString();
        }
        public SqlConnection GetConnection()
        {
            conn = new SqlConnection(GetConnectionString());
            conn.Open();
            return conn;
        }

        public void CloseSqlConnection()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public DataTable GetData(string query)
        {
            GetConnection();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

    }
}