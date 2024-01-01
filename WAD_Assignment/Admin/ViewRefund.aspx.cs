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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string refundID = Request.QueryString["refundID"];

                DataTable refundDetailsDataTable = GetRefundDetailsFromDatabase(refundID);

                DataRow row = refundDetailsDataTable.Rows[0];

                lblRefundId.Text = row["refundID"].ToString();
                lblRefundReason.Text = row["refundReason"].ToString();
                lblRefundDesc.Text = row["refundDesc"].ToString();
                lblRefundDate.Text = row["refundDate"].ToString();
                lblTicketId.Text = row["ticketId"].ToString();
            }
        }

        private DataTable GetRefundDetailsFromDatabase(string refundID)
        {

            DataTable staffDetailsDataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {

                    using (SqlCommand command = new SqlCommand("SELECT * FROM Refund WHERE refundID = @refundID", connection))
                    {
                        command.Parameters.AddWithValue("@refundID", refundID);

                        adapter.SelectCommand = command;

                        DataTable refundDetailsDataTable = new DataTable();
                        adapter.Fill(refundDetailsDataTable);
                    }
                }
            }

            return staffDetailsDataTable;
        }
    }
}