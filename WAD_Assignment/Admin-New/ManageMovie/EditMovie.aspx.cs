using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment.Admin_New
{
    public partial class EditMovie : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["MovieID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                Set_Category_List();
                
                string movieID = Request.QueryString["MovieID"];
                movieIDField.Value = movieID;

                Get_Movie_Detail(movieID);

                hiddenPanel.Visible = false;
            } 
        }

        protected void UpdateMovie_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = true;
            contentDiv.Style["filter"] = "brightness(50%)";
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string movieName = txtMovieName.Text;
            string category = ddlCategory.SelectedValue;
            string movieDesc = txtMovieDesc.Text;
            string releaseDate = calReleaseDate.SelectedDate.ToString("M/d/yyyy");
            string language = rblLanguage.SelectedValue;
            string subtitle = "";

            foreach (ListItem item in cblSubtitle.Items)
            {
                if (item.Selected)
                {
                    if (subtitle == "")
                    {
                        subtitle += item.Value;
                    }
                    else
                    {
                        subtitle += "," + item.Value;
                    }     
                }
            }

            string status;

            if (ended.Checked)
            {
                status = "Ended";
            }
            else
            {
                if (releaseDate.CompareTo(DateTime.Today) > 0)
                {
                    status = "ComingSoon";
                }
                else
                {
                    status = "Released";
                }
            }

            string duration = txtDuration.Text;
            string classification = ddlClassification.SelectedValue;
            string director = txtDirector.Text;
            string cast = txtCast.Text;
            string movieImg = imgUpload.FileName;
            string trailer = txtTrailer.Text;
            string price = txtPrice.Text;
            string movieID = movieIDField.Value;

            conn.Open();

            string queryStr = "UPDATE Movie SET movieName = @movieName, movieDesc = @movieDesc, category = @category, releaseDate = @releaseDate, " +
                "status = @status, duration = @duration, language = @language, subtitle = @subtitle, classification = @classification, director = @director, " +
                "cast = @cast, movieImage = @movieImage, price = @price, movieTrailer = @movieTrailer WHERE movieID = @movieID";
            SqlCommand cmdUpdate = new SqlCommand(queryStr, conn);
            cmdUpdate.Parameters.AddWithValue("@movieName", movieName);
            cmdUpdate.Parameters.AddWithValue("@movieDesc", movieDesc);
            cmdUpdate.Parameters.AddWithValue("@category", category);
            cmdUpdate.Parameters.AddWithValue("@releaseDate", releaseDate);
            cmdUpdate.Parameters.AddWithValue("@status", status);
            cmdUpdate.Parameters.AddWithValue("@duration", duration);
            cmdUpdate.Parameters.AddWithValue("@language", language);
            cmdUpdate.Parameters.AddWithValue("@subtitle", subtitle);
            cmdUpdate.Parameters.AddWithValue("@classification", classification);
            cmdUpdate.Parameters.AddWithValue("@director", director);
            cmdUpdate.Parameters.AddWithValue("@cast", cast);
            cmdUpdate.Parameters.AddWithValue("@movieImage", movieImg);
            cmdUpdate.Parameters.AddWithValue("@price", price);
            cmdUpdate.Parameters.AddWithValue("@movieTrailer", trailer);
            cmdUpdate.Parameters.AddWithValue("@movieID", movieID);
            int n = cmdUpdate.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UpdateSuccess", "alert('Movie Updated Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UpdateUnsuccess", "alert('Movie Updated Failed.');", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            contentDiv.Style["filter"] = "brightness(100%)";
        }

        private void Get_Movie_Detail(string movieID)
        {
            conn.Open();

            string queryStr = "SELECT * FROM Movie WHERE MovieID = @MovieID";
            SqlCommand cmdSelect = new SqlCommand(queryStr, conn);
            cmdSelect.Parameters.AddWithValue("@MovieID", movieID);
            SqlDataReader reader = cmdSelect.ExecuteReader();
            
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    movieImg.ImageUrl = "~/image/" + reader["movieImage"].ToString();
                    txtMovieName.Text = reader["movieName"].ToString();
                    ddlCategory.SelectedValue = reader["category"].ToString();
                    txtMovieDesc.Text = reader["movieDesc"].ToString();
                    calReleaseDate.SelectedDate = DateTime.Parse(reader["releaseDate"].ToString());
                    rblLanguage.SelectedValue = reader["language"].ToString();

                    string[] subtitles = reader["subtitle"].ToString().Split(',');

                    foreach (string subtitle in subtitles)
                    {
                        cblSubtitle.SelectedValue = subtitle;
                    }

                    string status = reader["status"].ToString();

                    if (status == "Ended")
                    {
                        ended.Checked = true;
                    }

                    txtDuration.Text = reader["duration"].ToString();
                    ddlClassification.SelectedValue = reader["classification"].ToString();
                    txtDirector.Text = reader["director"].ToString();
                    txtCast.Text = reader["cast"].ToString();
                    txtTrailer.Text = reader["movieTrailer"].ToString();
                    txtPrice.Text = Convert.ToDouble(reader["price"]).ToString("F2");
                }
            }
        }

        private void Set_Category_List()
        {
            string[] categoryList =
            {
                "Horror",
                "Action",
                "Musical",
                "Animation",
                "War",
                "Adventure"
            };

            foreach (string category in categoryList)
            {
                ddlCategory.Items.Add(new ListItem(category, category));
            }
        }
    }
}