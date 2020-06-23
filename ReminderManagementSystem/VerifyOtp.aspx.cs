using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem
{
    public partial class VerifyOtp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["otp"].ToString() == txtName.Text)
            {
                ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
                string query = "USP_REGISTER_USER_REMINDER ";
                //*'" + txtName.Text + "','" + txtEmail.Text + "','" + txtMobile.Text + "','" + txtPassword.Text + "',''";
                string message = obj.ExecuteNonQueryForSignup(query, Session["uname"].ToString(), Session["umail"].ToString(), Session["umob"].ToString(), Session["upass"].ToString());
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + message + "');", true);
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Login.aspx");
                

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('You have Entered Wrong OTP');", true);
            }
           
            
        }
    }
}