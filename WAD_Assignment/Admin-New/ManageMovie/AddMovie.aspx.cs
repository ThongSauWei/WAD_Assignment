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
                contentDiv.Style["filter"] = "brightness(100%)";
            }
            else if (!IsPostBack)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
        }

        protected void AddMovie_Click(object sender, EventArgs e)
        {
            if (calReleaseDate.SelectedDate.ToShortDateString() == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Date Not Selected", "alert('Please select a date.');", true);
                return;
            }
            else if (calReleaseDate.SelectedDate.CompareTo(DateTime.Today) < 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Invalid Date", "alert('Date selected cannot earlier than today.');", true);
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

        protected void cancelAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin-New/ManageMovie/ManageMovie.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Add_Movie();
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

        private void Add_Movie()
        {
            string movieID = Get_Movie_ID();
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

            string status = "ComingSoon";
            string duration = txtDuration.Text;
            string classification = ddlClassification.SelectedValue;
            string director = txtDirector.Text;
            string cast = txtCast.Text;
            string movieImg = imgUpload.FileName;
            string trailer = txtTrailer.Text;
            string price = txtPrice.Text;

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

            conn.Close();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddSuccess", "alert('Movie Added Successfully.');", true);
                Add_Notification(movieID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddUnsuccess", "alert('Movie Added Failed.');", true);
            }
        }

        private void Add_Notification(string movieID)
        {
            string notiID = Get_Noti_ID();

            conn.Open();

            string queryStr = "INSERT INTO Notification VALUES(@notiID, @movieID, @notiTitle, @notiDesc, @notiDate, @notiStatus)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@notiID", notiID);
            cmdInsert.Parameters.AddWithValue("@movieID", movieID);
            cmdInsert.Parameters.AddWithValue("@notiTitle", "Coming Soon!");
            cmdInsert.Parameters.AddWithValue("@notiDesc", "Check out our latest movie releasing soon.");
            cmdInsert.Parameters.AddWithValue("@notiDate", DateTime.Today);
            cmdInsert.Parameters.AddWithValue("@notiStatus", "Active");
            int n = cmdInsert.ExecuteNonQuery();

            conn.Close();

            if (n > 0)
            {
                Add_Customer_Notification(notiID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Noti Add Unsuccessful", "alert('Notification Added Unsuccessfully.');", true);
            }
        }

        private void Add_Customer_Notification(string notiID)
        {
            List<string> custIDs = Get_All_Customers();
            string custNotiID = Get_CustNoti_ID();

            foreach (string custID in custIDs)
            {
                conn.Open();

                string queryStr = "INSERT INTO CustomerNotification VALUES(@customerNotiID, @custID, @notiID)";
                SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
                cmdInsert.Parameters.AddWithValue("@customerNotiID", custNotiID);
                cmdInsert.Parameters.AddWithValue("@custID", custID);
                cmdInsert.Parameters.AddWithValue("@notiID", notiID);
                int n = cmdInsert.ExecuteNonQuery();

                if (n > 0)
                {

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Notification Failed to Add.", "alert('Unknown error occurs" +
                        "during the process of adding customer notification.');", true);
                    break;
                }

                conn.Close();

                int index = Convert.ToInt32(custNotiID.Substring(1));
                index++;
                custNotiID = "U" + index.ToString("000");
            }
        }

        private string Get_Movie_ID()
        {
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

            return movieID;
        }

        private string Get_Noti_ID()
        {
            conn.Open();

            // get the last noti id
            string lastRowQuery = "SELECT TOP 1 notiID FROM Notification ORDER BY notiID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastNotiID = (string)cmdSelect.ExecuteScalar();

            string notiID;
            if (lastNotiID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastNotiID.Substring(1));
                index++;
                notiID = "N" + index.ToString("000");
            }
            else
            {
                notiID = "N001";
            }

            conn.Close();

            return notiID;
        }

        private List<string> Get_All_Customers()
        {
            List<string> custIDs = new List<string>();

            conn.Open();

            string queryGetCustomerCount = "SELECT * FROM Customer";
            SqlCommand cmdSelectCustomerCount = new SqlCommand(queryGetCustomerCount, conn);
            SqlDataReader custReader = cmdSelectCustomerCount.ExecuteReader();

            if (custReader.HasRows)
            {
                while (custReader.Read())
                {
                    custIDs.Add(custReader["custID"].ToString());
                }
            }

            conn.Close();

            return custIDs;
        }

        private string Get_CustNoti_ID()
        {
            conn.Open();

            // get the last custNoti id
            string lastRowQuery = "SELECT TOP 1 customerNotiID FROM CustomerNotification ORDER BY customerNotiID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastCustNotiID = (string)cmdSelect.ExecuteScalar();

            string custNotiID;
            if (lastCustNotiID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastCustNotiID.Substring(1));
                index++;
                custNotiID = "U" + index.ToString("000");
            }
            else
            {
                custNotiID = "U001";
            }

            conn.Close();

            return custNotiID;
        }
    }
}