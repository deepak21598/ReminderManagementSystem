using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ReminderManagementSystem
{
    public partial class DisableReminder : System.Web.UI.Page
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
            string query = "select DISTINCT SUBJECT from Reminder_data where DATE='" + txtDate.Text + "' and EMAIL='" + Session["User_Email"].ToString() + "' ";
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
            string query = "select REMINDER_NAME from Reminder_data where DATE='" + txtDate.Text + "' and SUBJECT='" + ddlSubject.SelectedValue + "' and EMAIL='" + Session["User_Email"].ToString() + "' ";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            ddlReminder.Items.Clear();
            ddlReminder.DataSource = dt;
            ddlReminder.DataTextField = "REMINDER_NAME";
            ddlReminder.DataValueField = "REMINDER_NAME";
            ddlReminder.DataBind();
            ddlReminder.Items.Insert(0, new ListItem("-Select-", ""));
            ddlReminder.SelectedIndex = 0;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "update Reminder_Data set STATUS=0 where DATE='" + txtDate.Text + "' and SUBJECT='" + ddlSubject.SelectedValue + "' and REMINDER_NAME='" + ddlReminder.SelectedValue + "' and DESCRYPTION='" + txtDescryption.Text + "' and EMAIL='" + Session["User_Email"].ToString() + "' ";
            int i = obj.ExecuteNonQuery(query);
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Reminder Disable Successfully!');", true);
            }
        }

        protected void ddlReminder_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string query = "select *  from Reminder_data where DATE='" + txtDate.Text + "' and SUBJECT='" + ddlSubject.SelectedValue + "' and REMINDER_NAME='" + ddlReminder.SelectedValue + "' AND EMAIL='" + Session["User_Email"].ToString() + "' ";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            foreach (DataRow dr in dt.Rows)
            {
                txtDescryption.Text = dr["DESCRYPTION"].ToString();

            }
        }
    }
}