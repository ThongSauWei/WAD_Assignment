using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace WAD_Assignment.loginRegister
{
    public partial class Login1 : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;//CinemaDB is follow by Web Config
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomerEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomerPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string inputEmail = CustomerEmail.Text;
            string inputPassword = CustomerPassword.Text;

            try
            {
                conn.Open();
                using (SqlCommand customerCommand = new SqlCommand("SELECT custPassword, custID FROM Customer WHERE custEmail = @custEmail", conn))
                {
                    customerCommand.Parameters.AddWithValue("@custEmail", inputEmail);
                    SqlDataReader customerReader = customerCommand.ExecuteReader();

                    if (customerReader.HasRows)
                    {
                        //check email exist in customer table
                        customerReader.Read();
                        string hashedPasswordDB = customerReader["custPassword"].ToString();
                        string custID = customerReader["custID"].ToString();
                        customerReader.Close();

                        //encrypte the input password to hash value
                        string hashedInputPassword = HashPassword(inputPassword);
                        if (hashedInputPassword == hashedPasswordDB)
                        {
                            Session["custEmail"] = inputEmail;
                            Session["custID"] = custID;
                            Response.Redirect("~/Guest/HomePage/Homepage.aspx");
                        }
                        else
                        {
                            // Passwords don't match, show error message
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "loginFailed", "alert('Invalid email or password!');", true);
                        }
                    }

                }
                conn.Close();

                //Check staff
                conn.Open();
                using (SqlCommand staffCommand = new SqlCommand("SELECT staffID, staffName, staffPosition, staffPassword FROM Staff WHERE staffEmail = @staffEmail", conn))
                {
                    staffCommand.Parameters.AddWithValue("@staffEmail", inputEmail);
                    SqlDataReader staffReader = staffCommand.ExecuteReader();

                    if (staffReader.HasRows)
                    {
                        staffReader.Read();
                        string staffID = staffReader["staffID"].ToString();
                        string staffPosition = staffReader["staffPosition"].ToString();
                        string hashedPasswordDB = staffReader["staffPassword"].ToString();
                        staffReader.Close();

                        // Encrypt the input password to hash value
                        string hashedInputPassword = HashPassword(inputPassword);
                        if (hashedInputPassword == hashedPasswordDB)
                        {
                            Session["Role"] = staffPosition;
                            Session["staffEmail"] = inputEmail;
                            Session["staffID"] = staffID;

                            if (staffPosition.Equals("admin", StringComparison.OrdinalIgnoreCase))
                            {
                                // Redirect to Admin page
                                Response.Redirect("~/Admin/AdminMain.aspx");
                            }
                            else
                            {
                                // Redirect to Staff page
                                Response.Redirect("~/Guest/HomePage/Homepage.aspx");
                            }
                        }
                        else
                        {
                            // Passwords don't match, show error message
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "loginFailed", "alert('Invalid email or password!');", true);
                        }
                    }
                    else
                    {
                        // No rows found, show error message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "loginFailed", "alert('Invalid email or password!');", true);
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sqlError", "alert('A database error occurred during registration. Please try again later.');", true);

                
                Response.Write("SQL Exception Number: " + sqlEx.Number);
                Response.Write("SQL Exception Message: " + sqlEx.Message);
                Response.Write("SQL Exception Class: " + sqlEx.Class);
                Response.Write("SQL Exception State: " + sqlEx.State);
            }
            finally
            {
                conn.Close();
            }

        }

        protected void PasswordRecovery_Click(object sender, EventArgs e)
        {
            try
            {
                //PR = Password Recovery
                string inputPREmail = CustomerEmailPR.Text.Trim();//if front or back got space remove it
                string inputPRSecurityAnswer = SecurityQuestion.Text.Trim();
                string newPassword = TextBox1.Text.Trim();
                string confirmNewPassword = confirmPassword.Text.Trim();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Check if the email is found and security question answer is correct
                    using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custEmail = @custEmail AND custSecurityQues = @securityAnswer", conn))
                    {
                        command.Parameters.AddWithValue("@custEmail", inputPREmail);
                        command.Parameters.AddWithValue("@securityAnswer", inputPRSecurityAnswer);

                        int userCount = (int)command.ExecuteScalar();

                        if (userCount > 0)
                        {
                            // Check new password and confirm password match
                            if (newPassword == confirmNewPassword)
                            {
                                // Hash the new password before updating it in the database
                                string hashedNewPassword = HashPassword(newPassword);

                                // Update the new password in the database
                                using (SqlCommand updateCommand = new SqlCommand("UPDATE Customer SET custPassword = @hashedNewPassword WHERE custEmail = @custEmail", conn))
                                {
                                    updateCommand.Parameters.AddWithValue("@custEmail", inputPREmail);
                                    updateCommand.Parameters.AddWithValue("@hashedNewPassword", hashedNewPassword);
                                    updateCommand.ExecuteNonQuery();

                                    //Response.Redirect("~/Guest/loginRegister/Login.aspx");
                                }
                            }
                            else
                            {
                                //Confirm password incorrect
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "passwordMismatch", "alert('New password and confirm password do not match!');", true);
                            }
                        }
                        else
                        {
                            // email not found or security question incorrect
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidInfo", "alert('Invalid email or security question answer!');", true);
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sqlError", "alert('A database error occurred during registration. Please try again later.');", true);

                //diplay the details of the SQL exception to the console or log file
                Response.Write("SQL Exception Number: " + sqlEx.Number);
                Response.Write("SQL Exception Message: " + sqlEx.Message);
                Response.Write("SQL Exception Class: " + sqlEx.Class);
                Response.Write("SQL Exception State: " + sqlEx.State);
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