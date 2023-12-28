using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;

namespace WAD_Assignment.Member
{
    public partial class ConfirmBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                ContentPlaceHolder contentPlaceHolder = PreviousPage.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                Image img = contentPlaceHolder.FindControl("movieImg") as Image;
                HtmlGenericControl movieDiv = contentPlaceHolder.FindControl("movieDetail") as HtmlGenericControl;
                UpdatePanel updatePanel = contentPlaceHolder.FindControl("UpdatePanel1") as UpdatePanel;
                Label seatSelected = updatePanel.FindControl("lblSeats") as Label;
                HiddenField ticketPrice = updatePanel.FindControl("ticketPrice") as HiddenField;

                string[] allSeats = seatSelected.Text.Split(',');

                // initialise the image
                movieImg.ImageUrl = img.ImageUrl;

                // initialise the movie detail from the previous page
                List<Control> controlList = new List<Control>();
                foreach (Control childControl in movieDiv.Controls)
                {
                    controlList.Add(childControl);
                }

                foreach (Control control in controlList)
                {
                    movieDetail.Controls.Add(control);
                }

                // initialise the labels and texts
                lblSeat.Text = seatSelected.Text;
                txtPrice.Text = "RM " + ticketPrice.Value;
                txtQty.Text = "x " + allSeats.Length.ToString();
                txtTotal.Text = "RM " + (Convert.ToDouble(ticketPrice.Value) * allSeats.Length).ToString("F2");
                Session["controlList"] = controlList;
            }
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {

        }
    }
}