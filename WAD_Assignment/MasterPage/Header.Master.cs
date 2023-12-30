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
using System.Web.Script.Serialization;

namespace WAD_Assignment
{
    public partial class Header : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string logoPath = "~/image/cinemaLogo.png";

            cinemaLogo.Src = ResolveUrl(logoPath);

            string movieImgPath = "~/image/movie1.jpg";

            //Img1.Src = ResolveUrl(movieImgPath);
            //Img2.Src = ResolveUrl(movieImgPath);
            //Img3.Src = ResolveUrl(movieImgPath);

            //Img4.Src = ResolveUrl(logoPath);
            footerImg.Src = ResolveUrl(logoPath);

            //database link
            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            //notification
            Session["custID"] = "C001"; //testing
            string customerID = Session["custID"].ToString();
            DataTable dbNotice = GetNoticeDatabase(customerID, connectionString);
            noticeRepeater.DataSource = dbNotice;
            noticeRepeater.DataBind();

            //show notification when user after see dia punya movie eiheiiiiiii
            //DataTable dbAfter = GetAfterMovieDatabase(customerID);
            //afterMovieRepeater.DataSource = dbAfter;
            //afterMovieRepeater.DataBind();
            ShowAfterMovieNotifications(customerID, connectionString);


            //ttlNotification
            // Get the total notification count
            int totalNotificationCount = SumNotificationCounts(customerID, connectionString);

            // Set the value to the numberReminder div(aspx)
            numberReminder.InnerText = totalNotificationCount.ToString();
        }

        protected void Button2_ServerClick(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginUrl = "~/Guest/loginRegister/Login.aspx";

            Response.Redirect(ResolveUrl(loginUrl));
        }

        //welcome der
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

        private string[] GetAllMovieNamesFromDatabase()
        {
            List<string> movieNames = new List<string>();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT movieName, movieID FROM Movie", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string movieName = reader["movieName"].ToString();
                            
                            movieNames.Add(movieName);
                            
                        }
                    }
                }
            }

            return movieNames.ToArray();
        }

        protected string GetMovieNamesArray()
        {
            string[] movieNames = GetAllMovieNamesFromDatabase();
            return new JavaScriptSerializer().Serialize(movieNames);
        }




        //select the notification table one
        private DataTable GetNoticeDatabase(string custID, string connectionString)
        {
            DataTable resultTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT CN.*, N.notiID, N.movieID, N.notiDate, N.notiDesc, N.notiStatus, N.notiTitle, M.movieImage, M.movieName FROM CustomerNotification CN JOIN  Notification N ON CN.notiID = N.notiID JOIN  Movie M ON N.movieID = M.movieID WHERE  CN.custID = @custID AND N.notiStatus = 'Active' AND N.notiDate <= CAST(GETDATE() AS DATE)", connection))
                {
                    command.Parameters.AddWithValue("@custID", custID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        //show which when user watch the movie after 4h then will display the repeater 
        private void ShowAfterMovieNotifications(string customerID, string connectionString)
        {
            DataTable afterMovieData = GetAfterMovieDatabase(customerID, connectionString);

            foreach (DataRow row in afterMovieData.Rows)
            {
                TimeSpan scheduleTime = (TimeSpan)row["time"];

                // Use the IsAfterFourHours method as before
                if (IsAfterFourHours(scheduleTime))
                {
                    // Bind the data to the repeater
                    afterMovieRepeater.DataSource = afterMovieData;
                    afterMovieRepeater.DataBind();
                }
            }
        }


        //get which the movie user see that day
        private DataTable GetAfterMovieDatabase(string customerID, string connectionString)
        {
            DataTable resultTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT payment.paymentID, payment.ticketID, ticket.custID, ticket.scheduleID, schedule.movieID, schedule.date, schedule.time, M.movieImage, M.movieID, M.movieName, M.duration FROM payment JOIN  ticket ON payment.ticketID = ticket.ticketID JOIN  schedule ON ticket.scheduleID = schedule.scheduleID JOIN Movie M ON schedule.movieID = M.movieID WHERE  ticket.custID = @customerID AND schedule.date = CAST(GETDATE() AS DATE)", connection))
                {
                    command.Parameters.AddWithValue("@customerID", customerID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        //check whether after 4h or not
        private bool IsAfterFourHours(TimeSpan scheduleTime)
        {
            //TimeSpan fourHoursLater = scheduleTime.Add(new TimeSpan(4, 0, 0)); // Add 4 hours
            //return DateTime.Now.TimeOfDay >= fourHoursLater;
            TimeSpan fiveMinutesLater = scheduleTime.Add(new TimeSpan(0, 5, 0)); // Add 5 minutes //testing purpose
            return DateTime.Now.TimeOfDay >= fiveMinutesLater; //testing only
        }

        //count the ttl after movie
        private int CountTotalNotifications(string customerID, string connectionString)
        {
            DataTable afterMovieData = GetAfterMovieDatabase(customerID, connectionString);
            int count = 0;

            foreach (DataRow row in afterMovieData.Rows)
            {
                TimeSpan scheduleTime = (TimeSpan)row["time"];

                // Use the IsAfterFourHours method as before
                if (IsAfterFourHours(scheduleTime))
                {
                    count++;
                }
            }

            //// Bind the data to the repeater
            //afterMovieRepeater.DataSource = afterMovieData;
            //afterMovieRepeater.DataBind();

            return count;
        }

        // count the notification table got one
        private int GetTotalNoticeCount(string custID, string connectionString)
        {
            DataTable resultTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) AS NotificationCount FROM CustomerNotification CN JOIN Notification N ON CN.notiID = N.notiID JOIN Movie M ON N.movieID = M.movieID WHERE CN.custID = @custID AND N.notiStatus = 'Active' AND N.notiDate <= CAST(GETDATE() AS DATE)", connection))
                {
                    command.Parameters.AddWithValue("@custID", custID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            if (resultTable.Rows.Count > 0)
            {
                return Convert.ToInt32(resultTable.Rows[0]["NotificationCount"]);
            }

            return 0;
        }

        //sum the both 
        private int SumNotificationCounts(string customerID, string connectionString)
        {
            // Get counts from the two functions
            int countFromAfterMovie = CountTotalNotifications(customerID, connectionString);
            int countFromTotalNotice = GetTotalNoticeCount(customerID, connectionString);

            // Sum the counts
            int totalCount = countFromAfterMovie + countFromTotalNotice;

            return totalCount;
        }

        //protected HtmlTextArea opinion;


        protected void submitReview(object sender, EventArgs e)
        {
            // Retrieve data from the repeater item
            //RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            //string custID = (item.FindControl("custIDPass") as Label).Text;
            //string movieID = (item.FindControl("movieIDPass") as Label).Text;

            //get the value
            string custID = Request.Form["custIDHidden"];
            string movieID = Request.Form["movieIDHidden"];
            string selectedRating = Request.Form["feedback"];
            string commentGet = Request.Form["txtTextReview"];

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
            // insert data
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Review (reviewID, custID, movieID, rating, comment, date) VALUES (@reviewID, @custID, @movieID, @rating, @comment, GETDATE())";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Assuming you have a method to generate a unique reviewID
                    command.Parameters.AddWithValue("@reviewID", "R013");
                    command.Parameters.AddWithValue("@custID", custID);
                    command.Parameters.AddWithValue("@movieID", movieID);
                    command.Parameters.AddWithValue("@rating", selectedRating);
                    command.Parameters.AddWithValue("@comment", commentGet);

                    command.ExecuteNonQuery();

                    Response.Redirect("Homepage.aspx?success=1", false);


                }
            }
        }



        protected void submitSearch(object sender, EventArgs e)
        {
            string movieName = myInput2.Value;
            //string movieName = myInput21.Value;

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT movieID FROM Movie WHERE movieName = @movieName";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@movieName", movieName);

                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        string movieID = result.ToString();

                        // Check if movieID is valid
                        if (!string.IsNullOrEmpty(movieID))
                        {
                            // Redirect to the Detail page with the movieID parameter
                            Response.Redirect($"../Detail/Detail.aspx?movieID={movieID}", false);
                        }
                    }
                }
            }
        }


        //protected void delBtnReview_Command(object sender, CommandEventArgs e)
        //{
        //    if (e.CommandName == "Delete")
        //    {
        //        string notiID = e.CommandArgument.ToString();

        //        string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        //        // Update data
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();
        //            string query = "UPDATE notification SET notiStatus = 'Inactive' WHERE notiID = @notiID";
        //            using (SqlCommand command = new SqlCommand(query, connection))
        //            {
        //                command.Parameters.AddWithValue("@notiID", notiID);
        //                command.ExecuteNonQuery();
        //            }
        //        }

        //        // Rebind your data or perform any other necessary actions.
        //        // Example: BindData();
        //    }
        //}

        //protected void AfterMovie_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "RateTicket" && e.CommandArgument.ToString() != "")
        //    {
        //        //get the value
        //        string ticketID = Request.Form["ticIDHidden"];
        //        string custID = Request.Form["custHidden"];

        //        string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        //        DataTable resultTable = new DataTable();

        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();
        //            using (SqlCommand command = new SqlCommand("SELECT payment.paymentID, payment.ticketID, ticket.custID, ticket.scheduleID, schedule.movieID, schedule.date, schedule.time, M.movieImage, M.movieID, M.movieName, M.duration FROM payment JOIN  ticket ON payment.ticketID = ticket.ticketID JOIN  schedule ON ticket.scheduleID = schedule.scheduleID JOIN Movie M ON schedule.movieID = M.movieID WHERE  ticket.custID = @custID AND ticket.ticketID = @ticketID AND schedule.date = CAST(GETDATE() AS DATE)", connection))
        //            {
        //                command.Parameters.AddWithValue("@custID", custID);
        //                command.Parameters.AddWithValue("@ticketID", ticketID);

        //                using (SqlDataReader reader = command.ExecuteReader())
        //                {
        //                    resultTable.Load(reader);
        //                }
        //            }
        //        }



        //        DataTable dbRateTicket = resultTable;
        //        rateTicketRepeater.DataSource = dbRateTicket;
        //        rateTicketRepeater.DataBind();
        //    }
        //}

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete" && e.CommandArgument.ToString() != "")
            {
                // DoDelete then rebind
                string notiID = e.CommandArgument.ToString();

                string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

                // Update data
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE notification SET notiStatus = 'Inactive' WHERE notiID = @notiID";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@notiID", notiID);
                        command.ExecuteNonQuery();

                    }
                }

                Session["custID"] = "C001"; //testing
                string customerID = Session["custID"].ToString();
                DataTable dbNotice = GetNoticeDatabase(customerID, connectionString);
                noticeRepeater.DataSource = dbNotice;
                noticeRepeater.DataBind();

                int totalNotificationCount = SumNotificationCounts(customerID, connectionString);
                numberReminder.InnerText = totalNotificationCount.ToString();
            }
        }






        //protected void submitReview(object sender, EventArgs e)
        //{
        //    foreach (RepeaterItem item in afterMovieRepeater.Items)
        //    {
        //        // Access data directly using the DataItem property
        //        DataRowView dataRow = item.DataItem as DataRowView;

        //        if (dataRow != null)
        //        {
        //            string custID = dataRow["custID"].ToString();
        //            string movieID = dataRow["movieID"].ToString();

        //            // Assuming you have a property named "Rating" in your data source
        //            string rating = dataRow["Rating"].ToString();

        //            var opinionTextarea = item.FindControl("Textarea1") as HtmlTextArea;

        //            if (opinionTextarea != null)
        //            {
        //                string comment = opinionTextarea.Value;

        //                // Insert the data into the Review table
        //                InsertReview(custID, movieID, rating, comment);
        //            }
        //            else
        //            {
        //                // Handle the case where opinionTextarea is null
        //            }
        //        }
        //        else
        //        {
        //            // Handle the case where dataRow is null
        //        }
        //    }
        //}



        //private HtmlGenericControl FindSelectedRating(Control container)
        //{
        //    for (int i = 1; i <= 5; i++)
        //    {
        //        // Use FindControl with the specific naming container (container)
        //        var label = container.FindControl("label" + i) as HtmlGenericControl;
        //        var rating = label.FindControl("feedback") as HtmlInputRadioButton;

        //        if (rating != null && rating.Checked)
        //        {
        //            return label;  // Return the label, not the radio button
        //        }
        //    }
        //    return null; // No rating selected
        //}




        //protected void InsertReview(string custID, string movieID, string rating, string comment)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        //    // SQL query to insert data into the Reviews table
        //    string query = "INSERT INTO Review (reviewID, custID, movieID, rating, comment, date) " +
        //           "VALUES (@ReviewID, @CustID, @MovieID, @Rating, @Comment, @ReviewDate)";


        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            command.Parameters.AddWithValue("@ReviewID", "R013");
        //            command.Parameters.AddWithValue("@CustID", custID);
        //            command.Parameters.AddWithValue("@MovieID", movieID);
        //            command.Parameters.AddWithValue("@Rating", rating);
        //            command.Parameters.AddWithValue("@Comment", comment);
        //            command.Parameters.AddWithValue("@ReviewDate", DateTime.Now);

        //            command.ExecuteNonQuery();
        //        }
        //    }
        //}


        //private void InsertReview(string custID, string movieID, string rating, string comment, DateTime date)
        //{
        //    //string connectionString = "yourConnectionString"; // Replace with actual connection string
        //    string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();

        //        using (SqlCommand command = new SqlCommand("INSERT INTO Review (reviewID, custID, movieID, rating, comment, date) VALUES (@reviewID, @custID, @movieID, @rating, @comment, @date)", connection))
        //        {
        //            // Generate a unique reviewID (you can use GUID or any other method)
        //            string reviewID = Guid.NewGuid().ToString("N");

        //            command.Parameters.AddWithValue("@reviewID", reviewID);
        //            command.Parameters.AddWithValue("@custID", custID);
        //            command.Parameters.AddWithValue("@movieID", movieID);
        //            command.Parameters.AddWithValue("@rating", rating);
        //            command.Parameters.AddWithValue("@comment", comment);
        //            command.Parameters.AddWithValue("@date", date);

        //            command.ExecuteNonQuery();
        //        }
        //    }
        //}




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