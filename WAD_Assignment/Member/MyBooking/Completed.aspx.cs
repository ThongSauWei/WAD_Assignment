using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment.MyBooking
{
    public partial class Completed : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                ContentPlaceHolder contentPlaceHolder = PreviousPage.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                DropDownList ddl = contentPlaceHolder.FindControl("ddlReason") as DropDownList;
                TextBox txt = contentPlaceHolder.FindControl("txtDesc") as TextBox;
                HiddenField id = contentPlaceHolder.FindControl("ticketIDField") as HiddenField;

                reason.Value = ddl.SelectedItem.Text;
                desc.Value = txt.Text;
                ticketIDField.Value = id.Value;

                Initialise_Data();
            }
            
        }

        protected void submitRefund_Click(object sender, EventArgs e)
        {
            string refundReason = reason.Value;
            string refundDesc = desc.Value;
            string ticketID = ticketIDField.Value;

            conn.Open();

            string queryStr = "INSERT INTO Refund VALUES(@refundID, @refundReason, @refundDesc, @refundDate, @ticketID)";
            SqlCommand cmdInsert = new SqlCommand(queryStr, conn);
            cmdInsert.Parameters.AddWithValue("@refundID", pRefundID.InnerText);
            cmdInsert.Parameters.AddWithValue("@refundReason", refundReason);
            cmdInsert.Parameters.AddWithValue("@refundDesc", refundDesc);
            cmdInsert.Parameters.AddWithValue("@refundDate", pRefundDate.InnerText);
            cmdInsert.Parameters.AddWithValue("@ticketID", ticketID);
            int n = cmdInsert.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Refund Request Made", "alert('Refund request submitted. We are processing your request. We will repond as soon as possible. Thank You.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Refund Request Failed", "alert('Failed to Request Refund.');", true);
            }

            conn.Close();

            Response.Redirect("~/Guest/HomePage/Homepage.aspx");
        }

        private void Initialise_Data()
        {
            ContentPlaceHolder contentPlaceHolder = PreviousPage.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            HiddenField amountField = contentPlaceHolder.FindControl("amountField") as HiddenField;

            string refundID = Get_Refund_ID();
            string refundDate = DateTime.Today.ToShortDateString();
            string amount = amountField.Value;

            pRefundID.InnerText = refundID;
            pRefundDate.InnerText = refundDate;
            pRefundAmount.InnerText = amount;
        }

        private string Get_Refund_ID()
        {
            conn.Open();

            // get the last movie id
            string lastRowQuery = "SELECT TOP 1 refundID FROM Refund ORDER BY refundID DESC";
            SqlCommand cmdSelect = new SqlCommand(lastRowQuery, conn);
            string lastRefundID = (string)cmdSelect.ExecuteScalar();

            string refundID;
            if (lastRefundID != null)
            {
                // advance the ticket ID
                int index = Convert.ToInt32(lastRefundID.Substring(1));
                index++;
                refundID = "F" + index.ToString("000");
            }
            else
            {
                refundID = "F001";
            }

            conn.Close();

            return refundID;
        }
    }
}