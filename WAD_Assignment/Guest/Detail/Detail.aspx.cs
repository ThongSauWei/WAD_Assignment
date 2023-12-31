using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;

namespace WAD_Assignment.Detail
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["movieID"]))
                {
                    string movieID = Request.QueryString["movieID"];

                    DisplayMovieDetails(movieID);

                    DataTable dbDate = GetMovieDateFromDatabase(movieID);
                    dateRepeater.DataSource = dbDate;
                    dateRepeater.DataBind();

                    DataTable dbTime = GetMovieTimeFromDatabase(movieID);
                    timeRepeater.DataSource = dbTime;
                    timeRepeater.DataBind();

                    DataTable dbPopUp = GetMoviePopUpFromDatabase(movieID);
                    popRepeater.DataSource = dbPopUp;
                    popRepeater.DataBind();

                    DataTable dbReview = GetReviewFromDatabase(movieID);
                    reviewRepeater.DataSource = dbReview;
                    reviewRepeater.DataBind();

                    //DataTable dbMovieProgress = GetMovieRateProgressFromDatabase(movieID);
                    //progressRepeater.DataSource = dbMovieProgress;
                    //progressRepeater.DataBind();

                    //DataTable dbMovieProgress = GetMovieRateProgressFromDatabase(movieID);
                    //progressRepeater1.DataSource = dbMovieProgress;
                    //progressRepeater1.DataBind();



                    //DisplayMovieDate(movieID);
                }
                else
                {
                    lblMovieName.Text = "Movie not found";
                }
            }
        }

        //protected void progressRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        var percentage = DataBinder.Eval(e.Item.DataItem, "Percentage");
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "SetWidthScript", $"setRatingProgressWidth({percentage});", true);
        //    }
        //}


        //protected void progressRepeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        // Find the controls within the RepeaterItem
        //        var ratingProgressDiv = e.Item.FindControl("progressDiv") as HtmlGenericControl;
        //        var percentage = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Percentage"));

        //        // Set the width dynamically
        //        if (ratingProgressDiv != null)
        //        {
        //            ratingProgressDiv.Style["width"] = percentage + "%";
        //        }
        //    }
        //}


        private void DisplayMovieDetails(string movieID)
        {
            DataTable movieDetails = GetMovieDetailsFromDatabase(movieID);
            DataTable movieIDs = GetAverageRateFromDatabase(movieID);
            DataTable movieAvgRate = GetNumRateFromDatabase(movieID);

            if (movieAvgRate.Rows.Count > 0)
            {
                lblAvgRate.Text = movieAvgRate.Rows[0]["ReviewCount"].ToString();
            }

            if (movieIDs.Rows.Count > 0)
            {
                lblAvg.Text = movieIDs.Rows[0]["AverageRating"].ToString();
            }

            // Check if available or not
            if (movieDetails.Rows.Count > 0)
            {
                lblMovieName.Text = movieDetails.Rows[0]["movieName"].ToString();
                lblCategory.Text = movieDetails.Rows[0]["category"].ToString();
                lblDescription.Text = movieDetails.Rows[0]["movieDesc"].ToString();
                lblDirector.Text = movieDetails.Rows[0]["director"].ToString();
                lblCast.Text = movieDetails.Rows[0]["cast"].ToString();
                //lblReleaseDate.Text = movieDetails.Rows[0]["releaseDate"].ToString();

                DateTime releaseDate = Convert.ToDateTime(movieDetails.Rows[0]["releaseDate"]);
                lblReleaseDate.Text = releaseDate.ToString("dd MMM yyyy").ToUpper();


                lblDuration.Text = movieDetails.Rows[0]["duration"].ToString();
                lblLanguage.Text = movieDetails.Rows[0]["language"].ToString();
                lblSubtitle.Text = movieDetails.Rows[0]["subtitle"].ToString();
                lblClassification.Text = movieDetails.Rows[0]["classification"].ToString();

                hiddenMovieImage.Value = movieDetails.Rows[0]["movieImage"].ToString();

                string movieTrailerUrl = movieDetails.Rows[0]["movieTrailer"].ToString();
                movieTrailerLink.HRef = movieTrailerUrl;
            }
            else //not available
            {
                // if no movie found
                lblMovieName.Text = "Movie not found";
            }
        }

        private DataTable GetMovieDetailsFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Movie WHERE movieID = @movieID", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        //private DataTable GetMovieRateProgressFromDatabase(string movieID)
        //{
        //    DataTable resultTable = new DataTable();

        //    string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        using (SqlCommand command = new SqlCommand("SELECT RatingValues.rating, COALESCE(COUNT(Review.rating), 0) AS NumberOfRatings, COALESCE(CAST(ROUND(COUNT(Review.rating) * 100.0 / NULLIF((SELECT COUNT(*) FROM Review WHERE movieID = @movieID), 0), 0) AS INT), 0) AS Percentage FROM ( SELECT '1' AS rating UNION SELECT '2' UNION SELECT '3' UNION SELECT '4' UNION SELECT '5' ) AS RatingValues LEFT JOIN Review ON RatingValues.rating = Review.rating AND Review.movieID = @movieID GROUP BY RatingValues.rating", connection))
        //        {
        //            command.Parameters.AddWithValue("@movieID", movieID);

        //            using (SqlDataReader reader = command.ExecuteReader())
        //            {
        //                resultTable.Load(reader);
        //            }
        //        }
        //    }

        //    return resultTable;
        //}

        private DataTable GetNumRateFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) AS ReviewCount FROM Review WHERE movieID = @movieID", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        private DataTable GetAverageRateFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT ROUND(AVG(CAST(rating AS FLOAT)), 1) AS AverageRating FROM Review WHERE movieID = @movieID", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        private DataTable GetMovieDateFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT DENSE_RANK() OVER (ORDER BY date) AS identifier, date FROM ( SELECT DISTINCT date FROM Schedule WHERE movieID = @movieID AND date >= GETDATE() ) AS distinct_dates", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        private DataTable GetMovieTimeFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT DENSE_RANK() OVER (ORDER BY date) AS identifier, date, time FROM Schedule WHERE movieID = @movieID AND date >= GETDATE()", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        private DataTable GetMoviePopUpFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT movie.movieID, movie.movieName, movie.movieImage, movie.category, movie.classification, movie.language, movie.subtitle, movie.duration, schedule.scheduleID, schedule.hallID, schedule.date, schedule.time, hall.hallNo FROM movie JOIN schedule ON movie.movieID = schedule.movieID JOIN hall ON schedule.hallID = hall.hallID WHERE movie.movieID = @movieID", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        private DataTable GetReviewFromDatabase(string movieID)
        {
            DataTable resultTable = new DataTable();

            string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT review.reviewID, review.custID, review.movieID, review.rating, review.comment, review.date, customer.custID, customer.custName FROM  review JOIN customer ON review.custID = customer.custID WHERE review.movieID = @movieID", connection))
                {
                    command.Parameters.AddWithValue("@movieID", movieID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        resultTable.Load(reader);
                    }
                }
            }

            return resultTable;
        }

        protected string GenerateStarRating(int averageRating)
        {
            StringBuilder stars = new StringBuilder();

            for (int i = 0; i < 5; i++)
            {
                if (i < averageRating)
                {
                    stars.Append("<li><span class='fa fa-star checked'></span></li>");
                }
                else
                {
                    stars.Append("<li><span class='fa fa-star'></span></li>");
                }
            }

            return stars.ToString();
        }
    }
}