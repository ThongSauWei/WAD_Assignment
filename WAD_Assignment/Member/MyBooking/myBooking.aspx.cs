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
    public partial class booking : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["custID"] == null)
            //{
            //    Response.Redirect("~/error/GeneralError.aspx");
            //}
            //else
            //{
            //string custID = Session["custID"].ToString();
            string custID = "C001";

                Get_Ticket(custID);
                Get_Expired_Ticket(custID);
            //}
        }

        private void Get_Ticket(string custID)
        {
            HtmlGenericControl article;
            Image movieImg;
            HtmlGenericControl div;
            HtmlGenericControl h3;
            HtmlGenericControl p;
            HyperLink viewMore;

            conn.Open();

            string getTicket = "SELECT s.scheduleID, h.hallNo, m.movieImage, m.movieName, s.date, s.time, t.seatNo FROM Ticket t, Schedule s, Movie m, Hall h WHERE m.movieID = s.movieID " +
            "AND s.scheduleID = t.scheduleID AND s.hallID = h.hallID AND t.custID = @custID AND s.date > GETDATE() ORDER BY s.date, s.time DESC";
            SqlCommand cmdSelectTicket = new SqlCommand(getTicket, conn);
            cmdSelectTicket.Parameters.AddWithValue("@custID", custID);
            SqlDataReader ticketReader = cmdSelectTicket.ExecuteReader();

            if (ticketReader.HasRows)
            {
                Boolean hasRow = ticketReader.Read();

                while (hasRow)
                {
                    article = new HtmlGenericControl("article");
                    article.Attributes["class"] = "card";

                    movieImg = new Image();
                    movieImg.ImageUrl = "~/image/" + ticketReader["movieImage"].ToString();
                    movieImg.Width = 180;
                    movieImg.Height = 270;
                    article.Controls.Add(movieImg);

                    div = new HtmlGenericControl("div");
                    div.Attributes["class"] = "card_content";

                    h3 = new HtmlGenericControl("h3");
                    h3.InnerText = ticketReader["movieName"].ToString();
                    div.Controls.Add(h3);

                    p = new HtmlGenericControl("p");
                    p.InnerText = "HallNo : " + ticketReader["hallNo"].ToString();
                    div.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    p.InnerText = "Date & Time : " + DateTime.Parse(ticketReader["date"].ToString()).ToShortDateString() + " " + ticketReader["time"].ToString();
                    div.Controls.Add(p);

                    // get all the seats in the same schedule purchased by the same customer              
                    List<string> seats = new List<string>();
                    string scheduleID = ticketReader["scheduleID"].ToString();
                    seats.Add(ticketReader["seatNo"].ToString());

                    while ((hasRow = ticketReader.Read()) && scheduleID == ticketReader["scheduleID"].ToString())
                    {
                        seats.Add(ticketReader["seatNo"].ToString());
                    }

                    p = new HtmlGenericControl("p");
                    p.InnerText = "SeatNo : " + string.Join(",", seats);
                    div.Controls.Add(p);

                    viewMore = new HyperLink();
                    viewMore.Text = "View More";
                    viewMore.CssClass = "refund-btn";
                    viewMore.NavigateUrl = "~/Member/MyBooking/BookingDetail.aspx?scheduleID=" + scheduleID;
                    div.Controls.Add(viewMore);

                    article.Controls.Add(div);
                    activeBooking.Controls.Add(article);
                }
            }

            conn.Close();
        }

        private void Get_Expired_Ticket(string custID)
        {
            HtmlGenericControl article;
            Image movieImg;
            HtmlGenericControl div;
            HtmlGenericControl h3;
            HtmlGenericControl p;
            HyperLink viewMore;

            conn.Open();

            string getExpiredTicket = "SELECT t.ticketID, s.scheduleID, h.hallNo, m.movieImage, m.movieName, s.date, s.time, t.seatNo FROM Ticket t, Schedule s, Movie m, Hall h WHERE m.movieID = s.movieID " +
            "AND s.scheduleID = t.scheduleID AND s.hallID = h.hallID AND t.custID = @custID AND s.date < GETDATE() ORDER BY s.date, s.time DESC";
            SqlCommand cmdSelectExpiredTicket = new SqlCommand(getExpiredTicket, conn);
            cmdSelectExpiredTicket.Parameters.AddWithValue("@custID", custID);
            SqlDataReader expiredTicketReader = cmdSelectExpiredTicket.ExecuteReader();

            if (expiredTicketReader.HasRows)
            {
                Boolean hasRow = expiredTicketReader.Read();

                while (hasRow)
                {
                    string ticketID = expiredTicketReader["ticketID"].ToString();

                    article = new HtmlGenericControl("article");
                    article.Attributes["class"] = "card card-old";

                    movieImg = new Image();
                    movieImg.ImageUrl = "~/image/" + expiredTicketReader["movieImage"].ToString();
                    movieImg.Width = 180;
                    movieImg.Height = 270;
                    article.Controls.Add(movieImg);

                    div = new HtmlGenericControl("div");
                    div.Attributes["class"] = "card_content";

                    h3 = new HtmlGenericControl("h3");
                    h3.InnerText = expiredTicketReader["movieName"].ToString();
                    div.Controls.Add(h3);

                    p = new HtmlGenericControl("p");
                    p.InnerText = "HallNo : " + expiredTicketReader["hallNo"].ToString();
                    div.Controls.Add(p);

                    p = new HtmlGenericControl("p");
                    p.InnerText = "Date & Time : " + DateTime.Parse(expiredTicketReader["date"].ToString()).ToShortDateString() + " " + expiredTicketReader["time"].ToString();
                    div.Controls.Add(p);

                    // get all the seats in the same schedule purchased by the same customer              
                    List<string> seats = new List<string>();
                    string scheduleID = expiredTicketReader["scheduleID"].ToString();
                    seats.Add(expiredTicketReader["seatNo"].ToString());

                    while ((hasRow = expiredTicketReader.Read()) && scheduleID == expiredTicketReader["scheduleID"].ToString())
                    {
                        seats.Add(expiredTicketReader["seatNo"].ToString());
                    }

                    p = new HtmlGenericControl("p");
                    p.InnerText = "SeatNo : " + string.Join(",", seats);
                    div.Controls.Add(p);

                    viewMore = new HyperLink();
                    viewMore.Text = "View More";
                    viewMore.CssClass = "refund-btn";
                    viewMore.NavigateUrl = "~/Member/MyBooking/BookingDetail.aspx?ticketID=" + ticketID + "&seatNo=" + string.Join(",", seats);
                    div.Controls.Add(viewMore);

                    article.Controls.Add(div);
                    passiveBooking.Controls.Add(article);
                }
            }

            conn.Close();
        }

    }
}