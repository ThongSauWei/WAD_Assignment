using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using WAD_Assignment.Entity;

namespace WAD_Assignment.Member
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["scheduleID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }

            // save the schedule id, date and time in a hidden field
            if (Request.QueryString["scheduleID"] != null)
            {
                scheduleID.Value = Request.QueryString["scheduleID"];
                dateField.Value = Request.QueryString["date"];
                timeField.Value = Request.QueryString["time"];
            }

            Initialise_Movie();
            Initialise_Table();

            
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

            if (lblSeats.Text == "")
            {
                btnConfirm.PostBackUrl = "";
            }
            else
            {
                proceedDiv.Style["height"] = "65px";
                errorMsg.Text = "";
                btnConfirm.PostBackUrl = "~/Member/Booking/ConfirmBooking.aspx";
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (lblSeats.Text == "")
            {
                proceedDiv.Style["height"] = "90px";
                errorMsg.Text = "Please choose a seat before proceeding";
            }
        }

        private void Initialise_Movie()
        {
            // get schedule id
            string scheduleId = scheduleID.Value;

            // get schedule date and time
            DateTime date = DateTime.Parse(dateField.Value);
            DateTime time = DateTime.Parse(timeField.Value);

            Movie movie = Get_Movie_Info(scheduleId);

            movieImg.ImageUrl = "~/image/" + movie.MovieImgUrl;

            ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
            HtmlGenericControl movieDiv = (HtmlGenericControl)contentPlaceHolder.FindControl("movieDetail");
            HtmlGenericControl h1 = new HtmlGenericControl("h1");
            HtmlGenericControl h3 = new HtmlGenericControl("h3");
            HtmlGenericControl span;
            LiteralControl br;
            LiteralControl text;

            // add a <h1> with movie title into the div
            h1.InnerText = movie.MovieName;
            movieDiv.Controls.Add(h1);

            // add a <h3> with movie classification, category and duration into the div
            int hours = movie.Duration / 60;
            int minutes = movie.Duration % 60;
            h3.InnerText = movie.Classification + " | " + movie.Category + " | " + hours + " hour " + minutes + " minutes";
            movieDiv.Controls.Add(h3);

            // add line break
            br = new LiteralControl("<br />");
            movieDiv.Controls.Add(br);

            // create a new image for language
            Image languageImg = new Image();
            languageImg.ID = "languageImg";
            languageImg.ImageUrl = "~/image/language.png";

            // add the language image and also the text to the div
            span = new HtmlGenericControl("span");
            text = new LiteralControl(movie.Language);
            span.Controls.Add(languageImg);
            span.Controls.Add(text);
            movieDiv.Controls.Add(span);

            // create a new image for subtitle
            Image subtitleImg = new Image();
            subtitleImg.ID = "subtitleImg";
            subtitleImg.ImageUrl = "~/image/subtitle.png";

            // add the subtitle image and also the text to the div
            span = new HtmlGenericControl("span");
            text = new LiteralControl(movie.Subtitle);
            span.Controls.Add(subtitleImg);
            span.Controls.Add(text);
            movieDiv.Controls.Add(span);

            // add line break
            br = new LiteralControl("<br />");
            movieDiv.Controls.Add(br);

            // create a new image for director
            Image directorImg = new Image();
            directorImg.ID = "directorImg";
            directorImg.ImageUrl = "~/image/director.png";

            // add the director image and also the text to the div
            span = new HtmlGenericControl("span");
            text = new LiteralControl(movie.Director);
            span.Controls.Add(directorImg);
            span.Controls.Add(text);
            movieDiv.Controls.Add(span);

            // create a new image for cast
            Image actorImg = new Image();
            actorImg.ID = "actorImg";
            actorImg.ImageUrl = "~/image/actor.png";

            // add the cast image and also the text to the div
            span = new HtmlGenericControl("span");
            text = new LiteralControl(movie.Cast);
            span.Controls.Add(actorImg);
            span.Controls.Add(text);
            movieDiv.Controls.Add(span);

            // add line break
            br = new LiteralControl("<br />");
            movieDiv.Controls.Add(br);

            // create a new image for time
            Image timeImg = new Image();
            timeImg.ID = "timeImg";
            timeImg.ImageUrl = "~/image/time.png";

            // add the time image and also the text to the div
            span = new HtmlGenericControl("span");
            text = new LiteralControl(date.ToString("yyyy-MM-dd") + " " + time.ToString("hh:mm tt"));
            span.Controls.Add(timeImg);
            span.Controls.Add(text);
            movieDiv.Controls.Add(span);

            // save the ticket price into the hidden field
            ticketPrice.Value = movie.Price.ToString("F2");
        }

        private Movie Get_Movie_Info(string scheduleId)
        {
            Movie movie = null;

            conn.Open();

            string queryStr = "SELECT * FROM Movie m, Schedule s WHERE m.MovieID = s.MovieID AND s.ScheduleID = @ScheduleID";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@ScheduleID", scheduleId);
            SqlDataReader reader = cmdSelect.ExecuteReader();
            
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    movie = new Movie(reader["movieID"].ToString(), reader["movieName"].ToString(), reader["movieDesc"].ToString(),
                        reader["movieImage"].ToString(), Convert.ToInt32(reader["duration"]), reader["category"].ToString(),
                        DateTime.Parse(reader["releaseDate"].ToString()), reader["status"].ToString(),
                        reader["language"].ToString(), reader["subtitle"].ToString(), reader["classification"].ToString(),
                        reader["director"].ToString(), reader["cast"].ToString(), Convert.ToDouble(reader["price"]));
                }
            }

            conn.Close();

            return movie;
        }

        private void Initialise_Table()
        {
            // get the schedule id 
            string scheduleId = scheduleID.Value;

            // get the capacity of the hall
            int capacity = Get_Hall_Capacity(scheduleId);

            // get booked seats list
            List<string> occupiedList = Get_Occupied_Seats(scheduleId);

            // initialize all elements that will be added to the table       
            HtmlTable seatTable = (HtmlTable)UpdatePanel1.FindControl("seatTable");
            HtmlTableRow tr = new HtmlTableRow();
            HtmlTableCell td;

            // loop through all the cell in the table
            for (int i = 1; i <= capacity; i++)
            {
                // add a cell (seat) into the tableRow
                td = Seat(i, occupiedList);

                tr.Controls.Add(td);

                // add the tableRow to the table every 10 cells added or when the last cell is added
                if (i % 10 == 0 || i == capacity)
                {
                    seatTable.Controls.Add(tr);

                    // create a new tableRow if there are cells left
                    if (i < capacity)
                    {
                        tr = Gap_Between_Row();

                        // add the gap row into the table
                        seatTable.Controls.Add(tr);

                        // create a new tableRow for the seats
                        tr = new HtmlTableRow();
                    }
                }
                else if (i % 10 == 5) // add the pathway cell after the fifth column (for the first row only)
                {
                    if (i / 10 == 0) // check if it is the first row
                    {
                        td = Pathway(capacity);

                        // add the pathway into the tableRow
                        tr.Controls.Add(td);
                    }
                }
                else // add a gap between each seat cell (except for the fifth and tenth cell)
                {
                    td = Seat_Gap();

                    // add the seat gap into the tableRow
                    tr.Controls.Add(td);
                }
            }
        }

        private int Get_Hall_Capacity(string scheduleId)
        {
            conn.Open();

            string queryStr = "SELECT h.MaxPax FROM Schedule s, Hall h WHERE s.ScheduleId = @ScheduleId AND s.HallId = h.HallId";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@scheduleId", scheduleId);
            int capacity = (int) cmdSelect.ExecuteScalar();

            conn.Close();

            return capacity;
        }

        private List<string> Get_Occupied_Seats(string scheduleId)
        {
            List<string> occupiedList = new List<string>();

            conn.Open();

            // get the occupied list from database
            string queryStr = "SELECT * FROM Ticket WHERE ScheduleID = @ScheduleID";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@ScheduleID", scheduleId);
            SqlDataReader reader = cmdSelect.ExecuteReader();

            while (reader.Read())
            {
                occupiedList.Add((string)reader["seatNo"]);
            }

            conn.Close();

            return occupiedList;
        }

        private HtmlTableCell Seat(int seatCount, List<string> occupiedList)
        {
            char seatChar;
            int seatNumber;

            // convert 1 to A, 2 to B, 3 to C, ...
            if (seatCount % 10 == 0) // since there are 10 seats in one row, hence need some correction in the case of 10th seat
            {
                seatChar = (char)('A' + (seatCount / 10) - 1);
                seatNumber = 10;
            }
            else
            {
                seatChar = (char)('A' + (seatCount / 10));
                seatNumber = seatCount % 10;
            }

            string seatNo = seatChar + seatNumber.ToString();

            Boolean occupied = false;

            // check whether the seat is occupied
            foreach (string occupiedSeat in occupiedList) {
                if (seatNo.Equals(occupiedSeat))
                {
                    occupied = true;
                    break;
                }
            }

            // initialise the image button
            ImageButton imgBtn = new ImageButton();
            imgBtn.ID = seatNo;
            imgBtn.CssClass = "seat-button";
            imgBtn.Click += Seat_Click;

            if (occupied)
            {
                imgBtn.Attributes["disabled"] = "true";
                imgBtn.ImageUrl = "~/image/booked.png";
            }
            else
            {
                imgBtn.ImageUrl = "~/image/chair.png";
            }

            // initialise the seat cell
            HtmlTableCell td = new HtmlTableCell();
            td.Attributes["class"] = "seat";

            // add the image button into the seat cell
            td.Controls.Add(imgBtn);

            return td;
        }

        private HtmlTableRow Gap_Between_Row()
        {
            // initialise the elements (tableRow and gaps)
            HtmlTableRow tr = new HtmlTableRow();
            HtmlTableCell td = new HtmlTableCell();

            // set attributes for the gaps
            td.ColSpan = 9; // each part has 9 cells (5 seats and 4 gaps)
            td.Attributes["class"] = "row-gap";

            // add the gaps in both left part and right part
            tr.Controls.Add(td);
            tr.Controls.Add(td);

            return tr;
        }

        private HtmlTableCell Pathway(int capacity)
        {
            int rowNum = (int) Math.Ceiling(capacity / 10.0);

            // initialise the pathway
            HtmlTableCell td = new HtmlTableCell();
            td.RowSpan = 2 * rowNum - 1; // rowspan = 2n - 1 where n = number of rows (seat = n, gap = n - 1)
            td.Attributes["class"] = "pathway";

            return td;
        }

        private HtmlTableCell Seat_Gap()
        {
            // initialise the seat gap
            HtmlTableCell td = new HtmlTableCell();
            td.Attributes["class"] = "seat-gap";

            return td;
        }
    }
}