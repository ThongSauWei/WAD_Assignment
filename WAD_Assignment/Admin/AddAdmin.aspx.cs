using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testing
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StaffName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void StaffPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void StaffEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void StaffName_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void StaffPhoneNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ReenterPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void AddAdmin_Click(object sender, EventArgs e)
        {
            string staffName = StaffName.Text;
            string staffEmail = StaffEmail.Text;
            string staffPhoneNo = StaffPhoneNo.Text;
            string staffPassword = StaffPassword.Text;
            string reenterPassword = ReenterPassword.Text;
            string staffSalary = StaffSalary.Text;
            string staffPosition = StaffPosition.Text;

            if (staffPassword != reenterPassword)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "passwordMismatch", "alert('Passwords do not match!');", true);
                return;
            }

            string hashedPassword = HashPassword(staffPassword);

            try
            {
                conn.Open();

                using (
                    SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Staff WHERE staffEmail = @staffEmail", conn))
                {
                    command.Parameters.AddWithValue("@staffEmail", staffEmail);
                    int existingUserCount = (int)command.ExecuteScalar();//to read the user of first list by one by one
                    if (existingUserCount > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "emailDuplicate", "alert('Email is already registered!');", true);
                        return;
                    }
                }

                string staffID;
                string lastDigi = "SELECT TOP 1 staffID FROM Staff ORDER BY staffID DESC";
                SqlCommand cmdSelect = new SqlCommand(lastDigi, conn);
                string lastCustID = (string)cmdSelect.ExecuteScalar();
                if (lastCustID != null)
                {
                    int index = Convert.ToInt32(lastCustID.Substring(1));
                    index++;
                    staffID = "S" + index.ToString("000");
                }

                else
                {
                    staffID = "S001";
                }
                using (SqlCommand command = new SqlCommand("INSERT INTO Staff (staffID, staffName, staffEmail, staffPhoneNo, staffPassword, staffPosition, salary) VALUES (@staffID, @staffName, @staffEmail, @staffPhoneNo, @staffPassword, @staffPosition, @salary)", conn))
                {
                    command.Parameters.AddWithValue("@staffID", staffID);
                    command.Parameters.AddWithValue("@staffName", staffName);
                    command.Parameters.AddWithValue("@staffEmail", staffEmail);
                    command.Parameters.AddWithValue("@staffPhoneNo", staffPhoneNo);
                    command.Parameters.AddWithValue("@staffPassword", hashedPassword);
                    command.Parameters.AddWithValue("@staffPosition", staffPosition);
                    command.Parameters.AddWithValue("@salary", staffSalary);

                    int insertedStaffID = (int)command.ExecuteNonQuery();
                    if (insertedStaffID > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "registrationSuccess", "alert('Account registration successful!');", true);
                        Response.Redirect("~/Admin/AdminCRUD.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "registrationFailed", "alert('Account registration unsuccessful!');", true);
                    }
                }

            }
            catch (SqlException sqlEx)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sqlError", "alert('A database error occurred during registration. Please try again later.');", true);

                Response.Write($"SQL Exception Number: {sqlEx.Number}");
                Response.Write($"SQL Exception Message: {sqlEx.Message}");
                Response.Write($"SQL Exception Class: {sqlEx.Class}");
                Response.Write($"SQL Exception State: {sqlEx.State}");

            }
            finally
            {
                conn.Close();
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                StringBuilder stringBuilder = new StringBuilder();
                for (int i = 0; i < hashedBytes.Length; i++)
                {
                    stringBuilder.Append(hashedBytes[i].ToString("x2"));

                }

                return stringBuilder.ToString();
            }
        }
    }
}