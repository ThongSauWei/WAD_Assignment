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
                HiddenField scheduleId = contentPlaceHolder.FindControl("scheduleID") as HiddenField;

                // initialise the image
                movieImg.ImageUrl = img.ImageUrl;

                // initialise the movie detail from the previous page
                // List<Control> controlList = (List<Control>)Session["controlList"];
                List<Control> controlList = HttpContext.Current.Cache["controlList"] as List<Control>;

                foreach (Control control in controlList)
                {
                    movieDesc.Controls.Add(control);
                }

                // initialise the drop down list for years
                int thisYear = DateTime.Today.Year;

                for (int year = 0; year <= 5; year++)
                {
                    ddlYear.Items.Add(new ListItem((thisYear + year).ToString()));
                }

                // initialise the price
                txtTotalPrice.Text = totalPrice.Text;

                // initialise the seats chosen
                seatsChosen.Value = seatsSelected.Text;

                // initialise the schedule id
                scheduleID.Value = scheduleId.Value;

                // initialise the timer value
                timerValue.Value = "299";
            }
            else if (!IsPostBack)
            {
                Response.Redirect("~/error/GeneralError.aspx");
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

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessfulPurchase", "alert('Ticket has been " +
                    "successfully purchased. Subsequent actions can be made in My Booking page.');", true);
            Response.Redirect("~/Guest/HomePage/Homepage.aspx");
        }

        protected void CountDownTimer_Tick(object sender, EventArgs e)
        {
            int timeLeft = Convert.ToInt32(timerValue.Value);
            int minutes;
            int seconds;
            if (timeLeft > 0)
            {
                minutes = timeLeft / 60;
                seconds = timeLeft % 60;
                lblCountDown.Text = "Time Left: " + minutes.ToString("00") + ":" + seconds.ToString("00");
                timerValue.Value = (--timeLeft).ToString();
            }
            else
            {
                string script = "alert('The session is expired. Redirecting to homepage...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SessionExpired", script, true);
                Response.Redirect("~/Guest/HomePage/Homepage.aspx");
            }
        }

        private void Create_Ticket(string seatNo)
        {
            conn.Open();

            // get the last ticket id
            string lastRowQuery = "SELECT TOP 1 TicketID FROM Ticket ORDER BY TicketID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastTicketID = (string)cmdSelect.ExecuteScalar();

            string ticketID;
            if (lastTicketID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastTicketID.Substring(1));
                index++;
                ticketID = "T" + index.ToString("000");
            }
            else
            {
                ticketID = "T001";
            }

            conn.Close();

            conn.Open();

            // get the schedule ID
            string scheduleId = scheduleID.Value;

            string queryStr = "INSERT INTO Ticket VALUES(@TicketID, @CustomerID, @ScheduleID, @SeatNo, @PurchaseDate, @Status)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@TicketID", ticketID);
            cmdInsert.Parameters.AddWithValue("@CustomerID", "C001");
            cmdInsert.Parameters.AddWithValue("@ScheduleID", scheduleId);
            cmdInsert.Parameters.AddWithValue("@SeatNo", seatNo);
            cmdInsert.Parameters.AddWithValue("@PurchaseDate", DateTime.Today);
            cmdInsert.Parameters.AddWithValue("@Status", "Paid");

            int row = cmdInsert.ExecuteNonQuery();

            conn.Close();

            if (row > 0)
            {
                Create_Payment(ticketID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UnsuccessfulPurchase", "alert('Some errors has " +
                    "encountered during ticket purchase.');", true);
                Response.Redirect("~/Member/Booking/Booking.aspx");
            }
        }

        private void Create_Payment(string ticketID)
        {
            conn.Open();

            // get the last payment id
            string lastRowQuery = "SELECT TOP 1 PaymentID FROM Payment ORDER BY PaymentID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastPaymentID = (string)cmdSelect.ExecuteScalar();

            string paymentID;
            if (lastPaymentID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastPaymentID.Substring(1));
                index++;
                paymentID = "P" + index.ToString("000");
            }
            else
            {
                paymentID = "P001";
            }

            // get the payment amount for each ticket
            double totalPrice = Convert.ToDouble(txtTotalPrice.Text.Substring(3));
            int numOfTickets = seatsChosen.Value.Split(',').Length;
            double unitPrice = totalPrice / numOfTickets;

            string queryStr = "INSERT INTO Payment VALUES(@PaymentID, @TicketID, @PaymentAmount, @PaymentDate, @PaymentType)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@PaymentID", paymentID);
            cmdInsert.Parameters.AddWithValue("@TicketID", ticketID);
            cmdInsert.Parameters.AddWithValue("@PaymentAmount", unitPrice);
            cmdInsert.Parameters.AddWithValue("@PaymentDate", DateTime.Today);
            cmdInsert.Parameters.AddWithValue("@PaymentType", paymentChoiceField.Value);

            int row = cmdInsert.ExecuteNonQuery();

            conn.Close();

            if (row > 0)
            {

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UnsuccessfulPurchase", "alert('Some errors has " +
                    "encountered during payment making.');", true);
                Response.Redirect("~/Member/Booking/Booking.aspx");
            }
        }
    }
}