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
    public partial class AddMovie : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                Set_Category_List();
                hiddenPanel.Visible = false;
            }
        }

        protected void ValidateReleaseDate(object source, ServerValidateEventArgs e)
        {
            if (string.IsNullOrEmpty(calReleaseDate.SelectedDate.ToShortDateString()))
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }

        protected void AddMovie_Click(object sender, EventArgs e)
        {
            if (calReleaseDate.SelectedDate.ToShortDateString() == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Date Not Selected", "alert('Please select a date.');", true);
                return;
            }

            Boolean selected = false;

            foreach (ListItem item in cblSubtitle.Items)
            {
                if (item.Selected)
                {
                    selected = true;
                    break;
                }
            }

            if (!selected)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Subtitle Not Selected", "alert('Please select at least one subtitle.');", true);
                return;
            }

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

            conn.Open();

            // get the last movie id
            string lastRowQuery = "SELECT TOP 1 movieID FROM Movie ORDER BY movieID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastMovieID = (string)cmdSelect.ExecuteScalar();

            string movieID;
            if (lastMovieID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastMovieID.Substring(1));
                index++;
                movieID = "M" + index.ToString("000");
            }
            else
            {
                movieID = "M001";
            }

            conn.Close();

            conn.Open();

            string queryStr = "INSERT INTO Movie VALUES(@movieID, @movieName, @movieDesc, @category, @releaseDate, @status, @duration, @language, @subtitle, " +
                "@classification, @director, @cast, @movieImage, @price, @movieTrailer)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@movieID", movieID);
            cmdInsert.Parameters.AddWithValue("@movieName", movieName);
            cmdInsert.Parameters.AddWithValue("@movieDesc", movieDesc);
            cmdInsert.Parameters.AddWithValue("@category", category);
            cmdInsert.Parameters.AddWithValue("@releaseDate", releaseDate);
            cmdInsert.Parameters.AddWithValue("@status", status);
            cmdInsert.Parameters.AddWithValue("@duration", duration);
            cmdInsert.Parameters.AddWithValue("@language", language);
            cmdInsert.Parameters.AddWithValue("@subtitle", subtitle);
            cmdInsert.Parameters.AddWithValue("@classification", classification);
            cmdInsert.Parameters.AddWithValue("@director", director);
            cmdInsert.Parameters.AddWithValue("@cast", cast);
            cmdInsert.Parameters.AddWithValue("@movieImage", movieImg);
            cmdInsert.Parameters.AddWithValue("@price", price);
            cmdInsert.Parameters.AddWithValue("@movieTrailer", trailer);
            int n = cmdInsert.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddSuccess", "alert('Movie Added Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddUnsuccess", "alert('Movie Added Failed.');", true);
            }

            conn.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            contentDiv.Style["filter"] = "brightness(100%)";
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