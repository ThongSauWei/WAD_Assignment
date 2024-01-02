using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace WAD_Assignment.MyBooking
{
    public partial class BookingDetail : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ticketID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                string ticketID = Request.QueryString["ticketID"];

                Get_Schedule_Detail(ticketID);
            }
        }

        private void Get_Schedule_Detail(string ticketID)
        {
            Image movieImg;
            HtmlGenericControl div;
            HtmlGenericControl p;
            LiteralControl text;
            HtmlGenericControl span;
            HtmlGenericControl innerDiv;
            Button btnPrint;
            HyperLink cancelRefund;

            string seats = Request.QueryString["seatNo"];

            conn.Open();

            string queryStr = "SELECT m.movieImage, t.ticketID, m.movieID, m.movieName, h.hallNo, s.date, m.classification, m.price, t.purchaseDate, s.time, p.paymentType FROM Payment p, " +
                "Ticket t, Schedule s, Movie m, Hall h WHERE p.ticketID = t.ticketID AND t.scheduleID = s.scheduleID AND s.movieID = m.movieID AND s.hallID = h.hallID " +
                "AND t.ticketID = @ticketID";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@ticketID", ticketID);
            SqlDataReader reader = cmdSelect.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    movieImg = new Image();
                    movieImg.ImageUrl = "~/image/" + reader["movieImage"].ToString();
                    movieImg.Width = 270;
                    movieImg.Height = 405;
                    movieImg.AlternateText = "INSERT_ALT";
                    movieDetail.Controls.Add(movieImg);

                    div = new HtmlGenericControl("div");
                    div.Attributes["class"] = "mov-content";

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Booking ID ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["ticketID"].ToString();
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Movie ID ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["movieID"].ToString();
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Movie Name ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["movieName"].ToString();
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Hall ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["hallNo"].ToString();
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    innerDiv = new HtmlGenericControl("div");
                    innerDiv.Attributes["class"] = "col";

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Movie Date ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = DateTime.Parse(reader["date"].ToString()).ToShortDateString();
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Movie Time ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["time"].ToString();
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    div.Controls.Add(innerDiv);

                    innerDiv = new HtmlGenericControl("div");
                    innerDiv.Attributes["class"] = "col";

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Classification ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["classification"].ToString();
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("No of Ticket ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = seats.Split(',').Length.ToString();
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    div.Controls.Add(innerDiv);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Seat No ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = seats;
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    innerDiv = new HtmlGenericControl("div");
                    innerDiv.Attributes["class"] = "col";

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Amount ");
                    p.Controls.Add(text);

                    double amount = Convert.ToDouble(reader["price"].ToString()) * seats.Split(',').Length;

                    span = new HtmlGenericControl("span");
                    span.InnerText = "RM " + amount.ToString("F2");
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Payment Type ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = reader["paymentType"].ToString();
                    p.Controls.Add(span);
                    innerDiv.Controls.Add(p);

                    div.Controls.Add(innerDiv);

                    p = new HtmlGenericControl("p");
                    text = new LiteralControl("Purchase Date ");
                    p.Controls.Add(text);

                    span = new HtmlGenericControl("span");
                    span.InnerText = DateTime.Parse(reader["purchaseDate"].ToString()).ToShortDateString();
                    p.Controls.Add(span);
                    div.Controls.Add(p);

                    innerDiv = new HtmlGenericControl("div");
                    innerDiv.Attributes["class"] = "btn-group";

                    btnPrint = new Button();
                    btnPrint.CssClass = "btn print";
                    btnPrint.Text = "Print";
                    innerDiv.Controls.Add(btnPrint);

                    cancelRefund = new HyperLink();
                    cancelRefund.Text = "Cancel & Refund";
                    cancelRefund.Attributes["class"] = "btn cancel";
                    if (DateTime.Parse(reader["date"].ToString()).CompareTo(DateTime.Today) < 0)
                    {
                        cancelRefund.NavigateUrl = "~/Member/MyBooking/Cancel.aspx?ticketID=" + ticketID + "&amount=" + amount;
                    }
                    innerDiv.Controls.Add(cancelRefund);

                    div.Controls.Add(innerDiv);

                    movieDetail.Controls.Add(div);
                }
            }
        }
    }
}