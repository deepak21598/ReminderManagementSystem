using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReminderManagementSystem.App_Start;

namespace ReminderManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "USP_GETLOGINDETAILS '" + txtName.Text + "','"+ txtPassword .Text+ "' ";
            DataTable dt = new DataTable();
            dt=obj.GetData(query);
            if (dt.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
            }
            else
            {
                foreach(DataRow dr in dt.Rows)
                {
                    Session["User_Email"]=dr["Email"];
                    Session["UserId"] = dr["User_Name"];
                }
                Response.Redirect("Home.aspx");
            }
        }
    }
}