using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem
{
    public partial class SetReminder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                txtEmail.Text = Session["User_Email"].ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = " EXEC USP_SETREMINDER '"+ txtDate.Text + "','"+ ddlSubject.SelectedValue + "','" + txtReminder.Text + "','" + txtDescryption.Text + "','"+ txtEmail.Text + "','"+ txtContact.Text + "','"+ txtSms.Text + "',''";
            int i=obj.ExecuteNonQuery(query);
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
            }
        }
    }
}