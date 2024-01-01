using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testing
{
    public partial class MovieCRUD : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetMovieDetailsFromDatabase();
            }
        }

        private DataTable GetMovieDetailsFromDatabase()
        {
            DataTable dataTable = new DataTable();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT movieID, movieName FROM MOVIE";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    repeaterMovie.DataSource = dataTable;
                    repeaterMovie.DataBind();

                    reader.Close();
                }
            }
            return dataTable;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string staffIDToDelete = btnDelete.CommandArgument;

            DeleteRecordFromDatabase(staffIDToDelete);
            GetMovieDetailsFromDatabase();

        }

        private void DeleteRecordFromDatabase(string movieID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("DELETE FROM Movie WHERE movieID= @movieID", connection);
                command.Parameters.AddWithValue("@movieID", movieID);
                command.ExecuteNonQuery();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update.aspx");
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAdmin.aspx");
        }
    }
}