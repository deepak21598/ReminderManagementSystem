using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem
{
    public partial class UpdateReminder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "select DISTINCT SUBJECT from Reminder_data where DATE='"+txtDate.Text+"' ";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            ddlSubject.Items.Clear();
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SUBJECT";
            ddlSubject.DataValueField = "SUBJECT";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, new ListItem("-Select-", ""));
            ddlSubject.SelectedIndex = 0;
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "select REMINDER_NAME from Reminder_data where DATE='" + txtDate.Text + "' and SUBJECT='"+ddlSubject.SelectedValue+"' ";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            txtReminder.Items.Clear();
            txtReminder.DataSource = dt;
            txtReminder.DataTextField = "REMINDER_NAME";
            txtReminder.DataValueField = "REMINDER_NAME";
            txtReminder.DataBind();
            txtReminder.Items.Insert(0, new ListItem("-Select-", ""));
            txtReminder.SelectedIndex = 0;
        }

        protected void txtReminder_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "select *  from Reminder_data where DATE='" + txtDate.Text + "' and SUBJECT='" + ddlSubject.SelectedValue + "' and REMINDER_NAME='"+txtReminder.SelectedValue+"' ";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            foreach (DataRow dr in dt.Rows)
            {
                txtDescryption.Text = dr["DESCRYPTION"].ToString();
                txtEmail.Text = dr["EMAIL"].ToString();
                txtContact.Text = dr["MOBILE"].ToString();
                txtSms.Text = dr["SMS_NO"].ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "update Reminder_Data set MOBILE='" + txtContact.Text + "' where DATE='" + txtDate.Text + "' and SUBJECT='" + ddlSubject.SelectedValue + "' AND REMINDER_NAME='" + txtReminder.SelectedValue + "' ";
            int i = obj.ExecuteNonQuery(query);
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Thank You,Your Transaction is Confirmed!');", true);
            }
        }
    }
}