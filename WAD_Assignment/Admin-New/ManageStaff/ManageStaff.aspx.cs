using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment.Admin_New.ManageStaff
{
    public partial class ManageStaff : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staffID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                deletePanel.Visible = false;
                allContent.Style["filter"] = "brightness(100%)";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnClicked = (Button)sender;
            staffIDField.Value = btnClicked.CommandArgument;

            deletePanel.Visible = true;
            allContent.Style["filter"] = "brightness(50%)";
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string staffID = staffIDField.Value;

            Delete_Staff(staffID);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            deletePanel.Visible = false;
            allContent.Style["filter"] = "brightness(100%)";
        }

        private void Delete_Staff(string staffID)
        {
            conn.Open();

            string queryStr = "DELETE FROM Staff WHERE staffID = @staffID";
            SqlCommand cmdDelete = new SqlCommand(queryStr, conn);
            cmdDelete.Parameters.AddWithValue("@staffID", staffID);
            int n = cmdDelete.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete Success", "alert('Staff Deleted Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete Failed", "alert('Staff Deleted Failed.');", true);
            }

            conn.Close();
        }
    }
}