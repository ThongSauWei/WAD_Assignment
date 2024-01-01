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
    public partial class AdminCRUD : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetAdminDetailsFromDatabase();
            }
        }

        private DataTable GetAdminDetailsFromDatabase()
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT staffID, staffName FROM Staff";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    repeaterAdmin.DataSource = dataTable;
                    repeaterAdmin.DataBind();

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
            GetAdminDetailsFromDatabase();

        }

        private void DeleteRecordFromDatabase(string staffID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("DELETE FROM Staff WHERE staffID = @staffID", connection);
                command.Parameters.AddWithValue("@staffID", staffID);
                command.ExecuteNonQuery();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin/Update.aspx");
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AddAdmin.aspx");
        }
    }
}