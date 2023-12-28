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

namespace WAD_Assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;//CinemaDB is follow by Web Config
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomerName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomerPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SecurityQuestion_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomerEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomerName_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void CustomerPhoneNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ReenterPassword_TextChanged(object sender, EventArgs e)
        {
   
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string custName = CustomerName.Text;
            string custEmail = CustomerEmail.Text;
            string custPhoneNo = CustomerPhoneNo.Text;
            string custPassword = CustomerPassword.Text;
            string custSecurityQues = SecurityQuestion.Text;
            string reenterPassword = ReenterPassword.Text;

            // Check for matching passwords
            if (custPassword != reenterPassword)
            {
                // Passwords do not match
                ScriptManager.RegisterStartupScript(this, this.GetType(), "passwordMismatch", "alert('Passwords do not match!');", true);
                return;
            }

            string hashedPassword = HashPassword(custPassword);

            //Create a SQL connection
            try
            {
                //open the connnection
                conn.Open();

                //check the email duplicate using or not
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE custEmail = @custEmail", conn))
                {
                    //@ means if we didt put this it will put it as a variable but when we put a @ so that the variable will be hold until we add a velue for it
                    command.Parameters.AddWithValue("@custEmail", custEmail);
                    int existingUserCount = (int)command.ExecuteScalar();//to read the user of first list by one by one
                    if (existingUserCount > 0)
                    {
                        //more than 0 means exist
                        //ErrorMessageLabel.InnerText = "Email is already registered!";
                        //return;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "emailDuplicate", "alert('Email is already registered!');", true);
                    }
                }

                int custID;
                //after checking the email then can insert the new user into db
                using (SqlCommand command = new SqlCommand("INSERT INTO Customer (custName, custEmail, custPhoneNo, custPassword, custSecurityQues) OUTPUT INSERTED.custID VALUES (@custName, @custEmail, @custPhoneNo, @custPassword, @custSecurityQues)", conn))
                {
                    command.Parameters.AddWithValue("@custName", custName);
                    command.Parameters.AddWithValue("@custEmail", custEmail);
                    command.Parameters.AddWithValue("@custPhoneNo", custPhoneNo);
                    command.Parameters.AddWithValue("@custPassword", custPassword);
                    command.Parameters.AddWithValue("@custSecurityQues", custSecurityQues);

                    custID = command.ExecuteNonQuery();
                    if (custID > 0)
                    {
                        Response.Redirect("~/Guest/loginRegister/Login.aspx");
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "registrationFailed", "alert('Account registration unsuccessful!');", true);
                }

                Session["custEmail"] = custEmail;
                Session["custName"] = custName;
                Session["custID"] = custID;

            }
            catch (SqlException sqlEx)
            {
                // Display a user-friendly error message or redirect to an error page
                //ErrorMessageLabel.InnerText = "A database error occurred during registration. Please try again later.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sqlError", "alert('A database error occurred during registration. Please try again later.');", true);

                // You can also print the details of the SQL exception to the console or log file
                Console.WriteLine($"SQL Exception Number: {sqlEx.Number}");
                Console.WriteLine($"SQL Exception Message: {sqlEx.Message}");
                Console.WriteLine($"SQL Exception Class: {sqlEx.Class}");
                Console.WriteLine($"SQL Exception State: {sqlEx.State}");

            }
            finally
            {
                // close the connection
                conn.Close();
            }
        }


        //Hash function to protect the password convert it to hash value using SHA256 = 64 char fix
        //SHA-256 algorithm produces a fixed-size output of 256 bits or 64 hexadecimal characters. In terms of bytes, it is 32 bytes.
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