using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.loginRegister
{
    public partial class Login1 : System.Web.UI.Page
    {
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
            // Check if the email and password match the admin credentials
            string adminEmail = "admin@gmail.com";
            string adminPassword = "Admin@123";

            string enteredEmail = CustomerEmail.Text;
            string enteredPassword = CustomerPassword.Text;

            if (enteredEmail.Equals(adminEmail, StringComparison.OrdinalIgnoreCase) &&
                enteredPassword.Equals(adminPassword))
            {
                // Redirect to the admin page
                Response.Redirect("~/Admin/AdminMain.aspx;");
            }
            else
            {
                // Redirect to the home page
                Response.Redirect("~/Guest/HomePage/Homepage.aspx");
            }
        }
    }
}