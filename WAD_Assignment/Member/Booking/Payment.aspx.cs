using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WAD_Assignment.Member
{
    public partial class Payment : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                ContentPlaceHolder contentPlaceHolder = PreviousPage.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                Image img = contentPlaceHolder.FindControl("movieImg") as Image;
                TextBox totalPrice = contentPlaceHolder.FindControl("txtTotal") as TextBox;
                Label seatsSelected = contentPlaceHolder.FindControl("lblSeat") as Label;

                // initialise the image
                movieImg.ImageUrl = img.ImageUrl;

                // initialise the movie detail from the previous page
                List<Control> controlList = (List<Control>)Session["controlList"];
                
                foreach (Control control in controlList)
                {
                    movieDesc.Controls.Add(control);
                }

                // initialise the price
                txtTotalPrice.Text = totalPrice.Text;

                // initialise the seats chosen
                seatsChosen.Value = seatsSelected.Text;
            }

            if (!IsPostBack)
            {
                int thisYear = DateTime.Today.Year;

                for (int year = 0; year <= 5; year++)
                {
                    ddlYear.Items.Add(new ListItem((thisYear + year).ToString()));
                }
            }     
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            int thisYear = DateTime.Today.Year;
            int thisMonth = DateTime.Today.Month;

            if (Convert.ToInt32(ddlYear.SelectedItem.Text) <= thisYear)
            {
                if (Convert.ToInt32(ddlMonth.SelectedValue) <= thisMonth)
                {
                    errorMsg.Text = "The card is expired if this is the expire date";
                }
                else
                {
                    errorMsg.Text = "";
                }
            }
            else
            {
                errorMsg.Text = "";
            }
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            if (paymentChoiceField.Value == "tng")
            {
                Page.Validate("tngValidation");
            }
            else if (paymentChoiceField.Value == "card")
            {
                Page.Validate("cardValidation");
            }

            string[] allSeats = seatsChosen.Value.Split(',');

            foreach (string seatNo in allSeats)
            {
                Create_Ticket(seatNo);
            }

            Response.Redirect("~/Guest/HomePage/Homepage.aspx");
        }

        private void Create_Ticket(string seatNo)
        {
            conn.Open();

            string queryStr = "INSERT INTO Ticket VALUES(@TicketID, @CustomerID, @ScheduleID, @SeatNo, @PurchaseDate, @Status)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@TicketID", "T001");
            cmdInsert.Parameters.AddWithValue("@CustomerID", "C001");
            cmdInsert.Parameters.AddWithValue("@ScheduleID", "S001");
            cmdInsert.Parameters.AddWithValue("@SeatNo", seatNo);
            cmdInsert.Parameters.AddWithValue("@PurchaseDate", DateTime.Today);
            cmdInsert.Parameters.AddWithValue("@Status", "Paid");

            int row = cmdInsert.ExecuteNonQuery();

            if (row > 0)
            {
                // successfully added
            }
            else
            {
                // failed to add
            }

            conn.Close();
        }

        private void Create_Payment(string ticketID)
        {
            conn.Open();

            string queryStr = "INSERT INTO Payment VALUES(@PaymentID, @TicketID, @PaymentAmount, @PaymentDate, @PaymentType)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@PaymentID", "P001");
            cmdInsert.Parameters.AddWithValue("@TicketID", "T001");
            cmdInsert.Parameters.AddWithValue("@PaymentAmount", "20");
            cmdInsert.Parameters.AddWithValue("@PaymentDate", DateTime.Today);
            cmdInsert.Parameters.AddWithValue("@PaymentType", "Card");

            int row = cmdInsert.ExecuteNonQuery();

            if (row > 0)
            {
                // successfully added
            }
            else
            {
                // failed to add
            }
        }

    }
}