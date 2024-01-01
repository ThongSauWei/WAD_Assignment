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
    public partial class MemberCRUD : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCustomerDetailsFromDatabase();
            }
        }

        private DataTable GetCustomerDetailsFromDatabase()
        {
            DataTable dataTable = new DataTable();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT custID, custName FROM Customer";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    repeaterMember.DataSource = dataTable;
                    repeaterMember.DataBind();

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
            GetMemberDetailsFromDatabase();
        }

        private DataTable GetMemberDetailsFromDatabase()
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT custID, custName FROM Customer";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTable.Load(reader);

                    repeaterMember.DataSource = dataTable;
                    repeaterMember.DataBind();

                    reader.Close();
                }
            }
            return dataTable;
        }

        private void DeleteRecordFromDatabase(string staffID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("DELETE FROM Customer WHERE custID = @custID", connection);
                command.Parameters.AddWithValue("@staffID", staffID);
                command.ExecuteNonQuery();
            }
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMember.aspx");
        }
    }
}