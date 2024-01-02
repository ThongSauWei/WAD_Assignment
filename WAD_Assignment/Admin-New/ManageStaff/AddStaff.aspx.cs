using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace WAD_Assignment.Admin_New.ManageStaff
{
    public partial class AddStaff : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                hiddenPanel.Visible = false;
                contentDiv.Style["filter"] = "brightness(100%)";
            }
            else if (!IsPostBack)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
        }

        protected void addStaff_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = true;
            contentDiv.Style["filter"] = "brightness(50%)";
        }

        protected void cancelAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin-New/ManageStaff/ManageStaff.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Add_Staff();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            contentDiv.Style["filter"] = "brightness(100%)";
        }

        private void Add_Staff()
        {
            string staffID = Get_Staff_ID();
            string staffName = txtStaffName.Text;
            string staffEmail = txtStaffEmail.Text;
            string staffPhoneNo = txtStaffPhoneNo.Text;
            string staffPosition = ddlPosition.SelectedValue;

            string staffPassword = txtPassword.Text;
            string hashedPassword = HashPassword(staffPassword);

            string salary = txtSalary.Text;

            conn.Open();

            string queryStr = "INSERT INTO Staff VALUES(@staffID, @staffName, @staffEmail, @staffPhoneNo, @staffPassword, @staffPosition, " +
                "@salary)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@staffID", staffID);
            cmdInsert.Parameters.AddWithValue("@staffName", staffName);
            cmdInsert.Parameters.AddWithValue("@staffEmail", staffEmail);
            cmdInsert.Parameters.AddWithValue("@staffPhoneNo", staffPhoneNo);
            cmdInsert.Parameters.AddWithValue("@staffPassword", hashedPassword);
            cmdInsert.Parameters.AddWithValue("@staffPosition", staffPosition);
            cmdInsert.Parameters.AddWithValue("@salary", salary);
            int n = cmdInsert.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddSuccess", "alert('Staff Added Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Staff Add Unsuccessful", "alert('Staff Failed to Add.');", true);
            }
        }

        private string Get_Staff_ID()
        {
            conn.Open();

            // get the last movie id
            string lastRowQuery = "SELECT TOP 1 staffID FROM Staff ORDER BY staffID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastStaffID = (string)cmdSelect.ExecuteScalar();

            string staffID;
            if (lastStaffID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastStaffID.Substring(1));
                index++;
                staffID = "S" + index.ToString("000");
            }
            else
            {
                staffID = "S001";
            }

            conn.Close();

            return staffID;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                StringBuilder stringBuilder = new StringBuilder();// can changes the string position
                for (int i = 0; i < hashedBytes.Length; i++)
                {
                    stringBuilder.Append(hashedBytes[i].ToString("x2"));//x is hexadecimal and 2 is at least 2 character when save

                }

                return stringBuilder.ToString();
            }
        }
    }
}