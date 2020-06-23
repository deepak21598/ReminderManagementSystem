using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReminderManagementSystem
{
    public partial class ViewReminder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ReminderManagementSystem.App_Start.Global obj = new ReminderManagementSystem.App_Start.Global();
            string subject = ddlSubject.SelectedValue;
            string query = "EXEC USP_VIEWREMINDER '"+ txtFromDate.Text+ "','" + txtToDate.Text + "','"+subject.Trim()+"','"+ Session["User_Email"].ToString()+ "'";
            DataTable dt = new DataTable();
            dt = obj.GetData(query);
            gvdetails.Columns.Clear();
            foreach (DataColumn col in dt.Columns)
            {
                BoundField bField = new BoundField();
                bField.DataField = col.ColumnName;
                bField.HeaderText = col.ColumnName;
                gvdetails.Columns.Add(bField);
            }
            gvdetails.DataSource = dt;
            gvdetails.DataBind();
            gvdetails.Visible = true;

        }
    }
}