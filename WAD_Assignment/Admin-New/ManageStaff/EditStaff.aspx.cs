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
    public partial class EditStaff : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["staffID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                string staffID = Request.QueryString["staffID"];
                staffIDField.Value = staffID;

                Get_Staff_Detail(staffID);

                hiddenPanel.Visible = false;
                contentDiv.Style["filter"] = "brightness(100%)";
            }
        }

        protected void UpdateStaff_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = true;
            contentDiv.Style["filter"] = "brightness(50%)";
        }

        protected void cancelUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin-New/ManageStaff/ManageStaff.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string staffName = txtStaffName.Text;
            string staffEmail = txtStaffEmail.Text;
            string staffPhoneNo = txtStaffPhoneNo.Text;
            string position = ddlPosition.SelectedValue;
            string salary = txtSalary.Text;
            string staffID = staffIDField.Value;

            conn.Open();

            string queryStr = "UPDATE Staff SET staffName = @staffName, staffEmail = @staffEmail, staffPhoneNo = @staffPhoneNo, staffPosition = @position, " +
                "salary = @salary WHERE staffID = @staffID";
            SqlCommand cmdUpdate = new SqlCommand(queryStr, conn);
            cmdUpdate.Parameters.AddWithValue("@staffName", staffName);
            cmdUpdate.Parameters.AddWithValue("@staffEmail", staffEmail);
            cmdUpdate.Parameters.AddWithValue("@staffPhoneNo", staffPhoneNo);
            cmdUpdate.Parameters.AddWithValue("@position", position);
            cmdUpdate.Parameters.AddWithValue("@salary", salary);
            cmdUpdate.Parameters.AddWithValue("@staffID", staffID);
            int n = cmdUpdate.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UpdateSuccess", "alert('Staff Updated Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UpdateUnsuccess", "alert('Staff Updated Failed.');", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            contentDiv.Style["filter"] = "brightness(100%)";
        }

        private void Get_Staff_Detail(string staffID)
        {
            conn.Open();

            string queryStr = "SELECT * FROM Staff WHERE staffID = @staffID";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@staffID", staffID);
            SqlDataReader reader = cmdSelect.ExecuteReader();
            
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txtStaffName.Text = reader["staffName"].ToString();
                    txtStaffEmail.Text = reader["staffEmail"].ToString();
                    txtStaffPhoneNo.Text = reader["staffPhoneNo"].ToString();
                    ddlPosition.SelectedValue = reader["staffPosition"].ToString();
                    txtSalary.Text = reader["salary"].ToString();
                }
            }
        }
    }
}