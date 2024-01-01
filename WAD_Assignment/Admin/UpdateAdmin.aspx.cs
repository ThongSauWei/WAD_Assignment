using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testing
{
    public partial class UpdateAdmin : System.Web.UI.Page
    {
        //string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;


        string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string staffID = Request.QueryString["staffID"];
                DataTable staffDetailsDataTable = GetStaffDetailsFromDatabase(staffID);

                DataRow row = staffDetailsDataTable.Rows[0];

                txtStaffID.Text = row["staffID"].ToString();
                txtStaffName.Text = row["staffName"].ToString();
                txtStaffEmail.Text = row["staffEmail"].ToString();
                txtStaffPhoneNo.Text = row["staffPhoneNo"].ToString();
                txtStaffPassword.Text = row["staffPassword"].ToString();
                txtStaffPosition.Text = row["staffPosition"].ToString();
                txtSalary.Text = row["salary"].ToString();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newStaffID = txtStaffID.Text;
            string newStaffName = txtStaffName.Text;
            string newStaffEmail = txtStaffEmail.Text;
            string newStaffPhoneNo = txtStaffPhoneNo.Text;
            string newStaffPassword = txtStaffPassword.Text;
            string newStaffPosition = txtStaffPosition.Text;
            string newSalary = txtSalary.Text;

            UpdateDataInDatabase(newStaffID, newStaffName, newStaffEmail, newStaffPhoneNo, newStaffPassword, newStaffPosition, newSalary);

            Response.Redirect($"ViewAdmin.aspx?staffID={txtStaffID.Text}");

        }

        private DataTable GetStaffDetailsFromDatabase(string staffID)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Staff";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    reader.Close();
                }
            }
            return dataTable;
        }

        private void UpdateDataInDatabase(string newStaffID, string newStaffName, string newStaffEmail, string newStaffPhoneNo, string newStaffPassword, string newStaffPosition, string newSalary)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("UPDATE Staff SET staffID = @newStaffID, staffName = @newStaffName, staffEmail = @newStaffEmail, staffPhoneNo = @newStaffPhoneNo, staffPassword = @newStaffPassword, staffPosition = @newStaffPosition, salary = @newSalary WHERE staffID = @staffID", connection))
                {
                    command.Parameters.AddWithValue("@newStaffID", newStaffID);
                    command.Parameters.AddWithValue("@newStaffName", newStaffName);
                    command.Parameters.AddWithValue("@newStaffEmail", newStaffEmail);
                    command.Parameters.AddWithValue("@newStaffPhoneNo", newStaffPhoneNo);
                    command.Parameters.AddWithValue("@newStaffPassword", newStaffPassword);
                    command.Parameters.AddWithValue("@newStaffPosition", newStaffPosition);
                    command.Parameters.AddWithValue("@newSalary", newSalary);

                    command.Parameters.AddWithValue("@staffID", newStaffID);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

    }
}