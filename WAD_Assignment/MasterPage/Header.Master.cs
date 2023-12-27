using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace WAD_Assignment
{
    public partial class Header : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string logoPath = "~/image/cinemaLogo.png";

            cinemaLogo.Src = ResolveUrl(logoPath);

            string movieImgPath = "~/image/movie1.jpg";

            Img1.Src = ResolveUrl(movieImgPath);
            Img2.Src = ResolveUrl(movieImgPath);
            Img3.Src = ResolveUrl(movieImgPath);

            Img4.Src = ResolveUrl(logoPath);
            footerImg.Src = ResolveUrl(logoPath);
        }

        protected void Button2_ServerClick(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginUrl = "~/Guest/loginRegister/Login.aspx";

            Response.Redirect(ResolveUrl(loginUrl));
        }

        public static string GetCustNameFromDatabase(string custID)
        {
            string custName = null;

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT custName FROM Customer WHERE custID = @custID", connection))
                {
                    command.Parameters.AddWithValue("@custID", custID);

                    // Use ExecuteScalar to get a single value
                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        custName = result.ToString();
                    }
                }
            }

            return custName;
        }

        //protected void Logout()
        //{
        //    // Perform any additional actions before logout if needed

        //    // Terminate the session
        //    Session.Clear();
        //    Session.Abandon();

        //    // Redirect to the sign-in page
        //    Response.Redirect("~/Guest/loginRegister/Login.aspx");
        //}

    }
}