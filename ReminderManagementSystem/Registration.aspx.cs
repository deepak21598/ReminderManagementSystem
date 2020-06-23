using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            //string query = "USP_REGISTER_USER_REMINDER ";
            //    //*'" + txtName.Text + "','" + txtEmail.Text + "','" + txtMobile.Text + "','" + txtPassword.Text + "',''";
            //string message = obj.ExecuteNonQueryForSignup(query, txtName.Text, txtEmail.Text, txtMobile.Text, txtPassword.Text);
            //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + message + "');", true);
            Random r = new Random();
            string OTP = r.Next(1000, 9999).ToString();
            obj.SendMail(txtEmail.Text, "Otp for RemindME","Your Otp is :"+ OTP);
            Session["uname"] = txtName.Text;
            Session["umail"] = txtEmail.Text;
            Session["umob"] = txtMobile.Text;
            Session["upass"] = txtPassword.Text;
            Session["otp"] = OTP;
            Response.Redirect("VerifyOtp.aspx");
        }
    }
}