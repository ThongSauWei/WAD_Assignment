using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.Member
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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
                lblSeats.Text = lblSeats.Text.Replace(seatClicked.ID, "");

                seatClicked.ImageUrl = seatClicked.ImageUrl.Replace("checked.png", "chair.png");
            }
        }
    }
}