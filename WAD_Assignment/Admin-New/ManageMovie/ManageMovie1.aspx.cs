using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace WAD_Assignment.Admin_New
{
    public partial class ManageMovie1 : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["StaffID"] == null)
            //{
            //    Response.Redirect("~/error/GeneralError.aspx");
            //}

            Initialise_Movie();
            removePanel.Visible = false;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnClick = (Button)sender;

            selectedMovie.Value = btnClick.Parent.ID;

            removePanel.Visible = true;
            allMovieContent.Style["filter"] = "brightness(50%)";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            removePanel.Visible = false;
            allMovieContent.Style["filter"] = "brightness(100%)";
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string movieID = selectedMovie.Value;

            string queryStr = "UPDATE Movie SET Status = 'Ended' WHERE MovieID = @MovieID";
            SqlCommand cmdDelete = new SqlCommand(queryStr, conn);
            cmdDelete.Parameters.AddWithValue("@MovieID", movieID);
            int n = cmdDelete.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessDelete", "alert('You have deleted this movie');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UnsuccessDelete", "alert('Unknown error occurs when deleting the movie. Please try again later.');", true);
            }
        }

        private void Initialise_Movie()
        {
            ContentPlaceHolder contentPlaceHolder = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            HtmlGenericControl allMovieContent = contentPlaceHolder.FindControl("allMovieContent") as HtmlGenericControl;
            HtmlGenericControl movieContentDiv;
            HtmlGenericControl h2;
            HtmlGenericControl movieDiv;
            HtmlGenericControl movieImgDiv;
            Image movieImg;
            HtmlGenericControl h3;
            HtmlGenericControl span;
            Button btnEdit;
            Button btnRemove;

            int movieDuration;
            int hours;
            int minutes;

            conn.Open();

            string getOngoingMovie = "SELECT * FROM Movie WHERE NOT Status = 'Ended'";
            SqlCommand cmdOngoingMovie = new SqlCommand(getOngoingMovie, conn);
            SqlDataReader reader = cmdOngoingMovie.ExecuteReader();

            if (reader.HasRows)
            {
                movieContentDiv = new HtmlGenericControl("div");
                movieContentDiv.Attributes["class"] = "movie-content";

                h2 = new HtmlGenericControl("h2");
                h2.Attributes["class"] = "movie-status";
                h2.InnerText = "Ongoing Movie";
                allMovieContent.Controls.Add(h2);

                while (reader.Read())
                {
                    movieDiv = new HtmlGenericControl("div");
                    movieDiv.ID = reader["movieID"].ToString();
                    movieDiv.Attributes["class"] = "movie";

                    movieImgDiv = new HtmlGenericControl("div");
                    movieImgDiv.Attributes["class"] = "movie-img";

                    movieImg = new Image();
                    movieImg.ImageUrl = "~/image/" + reader["movieImage"].ToString();
                    movieImg.Attributes["width"] = "100%";
                    movieImg.Attributes["height"] = "100%";
                    movieImgDiv.Controls.Add(movieImg);

                    movieDiv.Controls.Add(movieImgDiv);

                    h3 = new HtmlGenericControl("h3");
                    h3.InnerText = reader["movieName"].ToString();
                    movieDiv.Controls.Add(h3);

                    span = new HtmlGenericControl("span");
                    movieDuration = Convert.ToInt32(reader["duration"].ToString());
                    hours = movieDuration / 60;
                    minutes = movieDuration % 60;
                    string hourStr;
                    string minuteStr;

                    if (hours > 0)
                    {
                        hourStr = hours + "h";
                    }
                    else
                    {
                        hourStr = "";
                    }

                    if (minutes > 0)
                    {
                        minuteStr = minutes + "min";
                    }
                    else
                    {
                        minuteStr = "";
                    }

                    span.InnerText = hourStr + " " + minuteStr + " | " + reader["category"].ToString();
                    movieDiv.Controls.Add(span);

                    btnEdit = new Button();
                    btnEdit.CssClass = "btnEdit";
                    btnEdit.Text = "Edit";
                    btnEdit.PostBackUrl = "~/Admin-New/ManageMovie/EditMovie.aspx?MovieID=" + reader["movieID"].ToString();
                    movieDiv.Controls.Add(btnEdit);

                    btnRemove = new Button();
                    btnRemove.CssClass = "btnRemove";
                    btnRemove.Text = "Remove";
                    btnRemove.Click += btnRemove_Click;
                    movieDiv.Controls.Add(btnRemove);

                    movieContentDiv.Controls.Add(movieDiv);
                }

                allMovieContent.Controls.Add(movieContentDiv);
            }

            conn.Close();

            conn.Open();

            string getEndedMovie = "SELECT * FROM Movie WHERE Status = 'Ended'";
            SqlCommand cmdEndedMovie = new SqlCommand(getEndedMovie, conn);
            SqlDataReader reader2 = cmdEndedMovie.ExecuteReader();

            if (reader2.HasRows)
            {
                movieContentDiv = new HtmlGenericControl("div");
                movieContentDiv.Attributes["class"] = "ended-movie-content";

                h2 = new HtmlGenericControl("h2");
                h2.Attributes["class"] = "movie-status";
                h2.InnerText = "Ended Movie";
                allMovieContent.Controls.Add(h2);

                while (reader2.Read())
                {
                    movieDiv = new HtmlGenericControl("div");
                    movieDiv.ID = reader2["movieID"].ToString();
                    movieDiv.Attributes["class"] = "movie";

                    movieImgDiv = new HtmlGenericControl("div");
                    movieImgDiv.Attributes["class"] = "movie-img";

                    movieImg = new Image();
                    movieImg.ImageUrl = "~/image/" + reader2["movieImage"].ToString();
                    movieImg.Attributes["width"] = "100%";
                    movieImg.Attributes["height"] = "100%";
                    movieImgDiv.Controls.Add(movieImg);

                    movieDiv.Controls.Add(movieImgDiv);

                    h3 = new HtmlGenericControl("h3");
                    h3.InnerText = reader2["movieName"].ToString();
                    movieDiv.Controls.Add(h3);

                    span = new HtmlGenericControl("span");
                    movieDuration = Convert.ToInt32(reader2["duration"].ToString());
                    hours = movieDuration / 60;
                    minutes = movieDuration % 60;
                    string hourStr;
                    string minuteStr;

                    if (hours > 0)
                    {
                        hourStr = hours + "h";
                    }
                    else
                    {
                        hourStr = "";
                    }

                    if (minutes > 0)
                    {
                        minuteStr = minutes + "min";
                    }
                    else
                    {
                        minuteStr = "";
                    }

                    span.InnerText = hourStr + " " + minuteStr + " | " + reader2["category"].ToString();
                    movieDiv.Controls.Add(span);

                    btnEdit = new Button();
                    btnEdit.CssClass = "btnEdit";
                    btnEdit.Text = "Edit";
                    btnEdit.PostBackUrl = "~/Admin-New/ManageMovie/EditMovie.aspx?MovieID=" + reader2["movieID"].ToString();
                    movieDiv.Controls.Add(btnEdit);

                    movieContentDiv.Controls.Add(movieDiv);
                }

                allMovieContent.Controls.Add(movieContentDiv);
            }

            conn.Close();
        }
    }
}