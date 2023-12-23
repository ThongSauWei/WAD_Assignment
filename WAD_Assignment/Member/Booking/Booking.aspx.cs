using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment.Member
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            //conn.Open();

            //string queryStr = "INSERT INTO Customer VALUES('C001', 'Benjamin', 'Benjamin@gmail.com', '0123456789', 'Password1', 'Avenger')";
            //SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            //int n = cmdInsert.ExecuteNonQuery();
            //if (n > 0)
            //{
            //    string script = "alert('Added successfully');";
            //    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            //}

            //conn.Close();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirmBooking.aspx");
        }

        protected void Seat_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton seatClicked = sender as ImageButton;

            if (seatClicked.ImageUrl.EndsWith("chair.png"))
            {
                if (lblSeats.Text == "")
                {
                    lblSeats.Text += seatClicked.ID;
                }
                else
                {
                    lblSeats.Text += "," + seatClicked.ID;
                }

                seatClicked.ImageUrl = seatClicked.ImageUrl.Replace("chair.png", "checked.png");
            }
            else
            {
                if (lblSeats.Text.EndsWith(seatClicked.ID))
                {
                    if (lblSeats.Text.Equals(seatClicked.ID))
                    {
                        lblSeats.Text = lblSeats.Text.Replace(seatClicked.ID, "");
                    }
                    else
                    {
                        lblSeats.Text = lblSeats.Text.Replace("," + seatClicked.ID, "");
                    }
                }
                else
                {
                    lblSeats.Text = lblSeats.Text.Replace(seatClicked.ID + ",", "");
                }

                seatClicked.ImageUrl = seatClicked.ImageUrl.Replace("checked.png", "chair.png");
            }
        }
    }
}