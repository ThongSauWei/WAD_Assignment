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
                }
                else
                {
                    lblMovieName.Text = "Movie not found";
                }
            }
        }

        private void DisplayMovieDetails(string movieID)
        {
            DataTable movieDetails = GetMovieDetailsFromDatabase(movieID);

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
    }
}