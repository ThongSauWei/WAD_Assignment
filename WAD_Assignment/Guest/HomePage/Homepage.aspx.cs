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

namespace WAD_Assignment.HomePage
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    string custID = (string)Session["custID"];

                    if (!string.IsNullOrEmpty(custID))
                    {
                        // Use the custID value
                        // For example, you can print it to the console, log it, or use it in your logic.
                        Console.WriteLine("Session custID: " + custID);
                    }
                    else
                    {
                        // Session["custID"] is either not set or is an empty string
                        Console.WriteLine("No");
                    }

                    cnn.Open();
                    //Response.Write("Connection Made");

                    DataTable dbMovieConnect = GetMovieDataFromDatabase(connectionString, "SELECT TOP 5 movieID, movieName, category, movieImage, movieTrailer FROM Movie WHERE releaseDate <= CAST(GETDATE() AS DATE) ORDER BY releaseDate ASC");
                    DataTable dbReleased = GetMovieDataFromDatabase(connectionString, "SELECT movieID, movieName, category, movieImage, duration, language FROM Movie WHERE releaseDate <= CAST(GETDATE() AS DATE) AND status = 'released' ORDER BY releaseDate ASC");
                    DataTable dbComing = GetMovieDataFromDatabase(connectionString, "SELECT movieID, movieName, movieImage FROM Movie WHERE status = 'pending'");

                    // Get top 10 movies with highest average ratings
                    string topMoviesQuery = @"
                        WITH MovieRatings AS (
                        SELECT
                            m.MovieID,
                            m.MovieName,
                            CEILING(AVG(CAST(r.rating AS FLOAT))) AS AverageRating,
                            ROW_NUMBER() OVER (ORDER BY AVG(CAST(r.rating AS FLOAT)) DESC) AS Rank
                        FROM
                            Movie m
                            INNER JOIN Review r ON m.MovieID = r.MovieID
                        WHERE 
                            releaseDate <= CAST(GETDATE() AS DATE)
                        GROUP BY
                            m.MovieID, m.MovieName
                        )
                        SELECT TOP 10
                            mr.movieID,
                            mr.movieName,
                            m.movieImage,
                            mr.AverageRating,
                            RIGHT('00' + CAST(mr.Rank AS VARCHAR(2)), 2) AS RankWithLeadingZeros,
                            m.category
                        FROM
                            MovieRatings mr
                            INNER JOIN Movie m ON mr.MovieID = m.MovieID
                        ORDER BY
                            mr.Rank;
                    ";

                    DataTable dbRank = GetMovieDataFromDatabase(connectionString, topMoviesQuery);

                    // Bind movie data to repeater
                    MovieRepeater.DataSource = dbMovieConnect;
                    thumbnailRepeater.DataSource = dbMovieConnect;
                    releasedRepeater.DataSource = dbReleased;
                    rankRepeater.DataSource = dbRank;
                    comingRepeater.DataSource = dbComing;

                    comingRepeater.DataBind();
                    rankRepeater.DataBind();
                    releasedRepeater.DataBind();
                    thumbnailRepeater.DataBind();
                    MovieRepeater.DataBind();

                }

                // Check if the success parameter is present in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["success"]))
                {
                    // Display a success message
                    divAlert.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        private DataTable GetMovieDataFromDatabase(string connectionString, string query)
        {
            DataTable movieDataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    // Execute 
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(movieDataTable);
                    }
                }
            }

            return movieDataTable;
        }

        protected string GetLanguageCode(string language)
        {
            switch (language.ToUpper())
            {
                case "ENGLISH":
                    return "ENG";
                case "CHINESE":
                    return "CN";
                case "MALAY":
                    return "BM";
                default:
                    return language; //if no, then return
            }
        }

        protected string GenerateStarRating(int averageRating)
        {
            StringBuilder stars = new StringBuilder();

            for (int i = 0; i < 5; i++)
            {
                if (i < averageRating)
                {
                    stars.Append("<li><i class='fas fa-star'></i></li>");
                }
                else
                {
                    stars.Append("<li><i class='far fa-star'></i></li>");
                }
            }

            return stars.ToString();
        }

    }
}