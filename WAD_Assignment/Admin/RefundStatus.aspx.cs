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
    public partial class RefundStatus : System.Web.UI.Page
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
                string query = "SELECT refundDate, refundID from Refund";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    repeaterRefund.DataSource = dataTable;
                    repeaterRefund.DataBind();

                    reader.Close();
                }
            }
            return dataTable;
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string refundIDToDelete = btnDelete.CommandArgument;

            DeleteRecordFromDatabase(refundIDToDelete);
            GetMovieDetailsFromDatabase();

        }

        private void DeleteRecordFromDatabase(string refundID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("DELETE FROM Refund WHERE refundID= @refundID", connection);
                command.Parameters.AddWithValue("@refundID", refundID);
                command.ExecuteNonQuery();
            }
        }
    }
}