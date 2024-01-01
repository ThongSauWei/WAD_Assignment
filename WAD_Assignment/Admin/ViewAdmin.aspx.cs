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
    public partial class ViewAdmin : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string staffID = Request.QueryString["staffID"];

                DataTable staffDetailsDataTable = GetStaffDetailsFromDatabase(staffID);

                DataRow row = staffDetailsDataTable.Rows[0];

                lblStaffID.Text = row["staffID"].ToString();
                lblStaffName.Text = row["staffName"].ToString();
                lblStaffEmail.Text = row["staffEmail"].ToString();
                lblStaffPhoneNo.Text = row["staffPhoneNo"].ToString();
                lblStaffPassword.Text = row["staffPassword"].ToString();
                lblStaffPosition.Text = row["staffPosition"].ToString();
                lblStaffSalary.Text = row["salary"].ToString();
            }
        }

        private DataTable GetStaffDetailsFromDatabase(string staffID)
        {
            DataTable staffDetailsDataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    string query = "SELECT * FROM Staff WHERE staffID = @staffID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        command.Parameters.AddWithValue("@staffID", staffID);
                        adapter.SelectCommand = command;
                        adapter.Fill(staffDetailsDataTable);
                    }
                }
            }

            return staffDetailsDataTable;
        }

    }
}