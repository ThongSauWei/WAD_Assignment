using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAD_Assignment.Admin_New.ManageCustomer
{
    public partial class ManageCustomer : System.Web.UI.Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["CinemaDB"].ConnectionString;
        private SqlConnection conn = new SqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staffID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                hiddenPanel.Visible = false;
                allContent.Style["filter"] = "brightness(100%)";
            } 
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btnView = (Button)sender;
            string custID = btnView.CommandArgument;
            custIDField.Value = custID;

            Initialise_Hidden_Panel(custID);

            hiddenPanel.Visible = true;
            allContent.Style["filter"] = "brightness(50%)";
        }

        protected void closeView_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            allContent.Style["filter"] = "brightness(100%)";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string custID = custIDField.Value;

            Delete_Customer(custID);
        }

        private void Initialise_Hidden_Panel(string custID)
        {
            string custName = "";
            string custEmail = "";
            string custPhoneNum = "";

            conn.Open();

            string getCustInfo = "SELECT * FROM Customer WHERE custID = @custID";
            SqlCommand cmdSelectCust = new SqlCommand(getCustInfo, conn);
            cmdSelectCust.Parameters.AddWithValue("@custID", custID);
            SqlDataReader custReader = cmdSelectCust.ExecuteReader();

            if (custReader.HasRows)
            {
                while (custReader.Read())
                {
                    custName = custReader["custName"].ToString();
                    custEmail = custReader["custEmail"].ToString();
                    custPhoneNum = custReader["custPhoneNo"].ToString();
                }
            }

            conn.Close();

            HtmlGenericControl groupDiv;
            HtmlGenericControl innerDiv;
            HtmlGenericControl h3;
            HtmlGenericControl span;
            HtmlGenericControl contentDiv;
            HtmlGenericControl innerSpan;
            LiteralControl text;

            groupDiv = new HtmlGenericControl("div");
            groupDiv.Attributes["class"] = "group";

            innerDiv = new HtmlGenericControl("div");
            innerDiv.Attributes["class"] = "cust-info";

            h3 = new HtmlGenericControl("h3");
            h3.InnerText = "Customer Info";
            innerDiv.Controls.Add(h3);

            span = new HtmlGenericControl("span");
            span.InnerText = "ID: " + custID;
            innerDiv.Controls.Add(span);

            span = new HtmlGenericControl("span");
            span.InnerText = "Name: " + custName;
            innerDiv.Controls.Add(span);

            span = new HtmlGenericControl("span");
            span.InnerText = "Email: " + custEmail;
            innerDiv.Controls.Add(span);

            span = new HtmlGenericControl("span");
            span.InnerText = "Phone No: " + custPhoneNum;
            innerDiv.Controls.Add(span);

            groupDiv.Controls.Add(innerDiv);

            innerDiv = new HtmlGenericControl("div");
            innerDiv.Attributes["class"] = "latest-three-movie";

            h3 = new HtmlGenericControl("h3");
            h3.InnerText = "Latest Movie";
            innerDiv.Controls.Add(h3);

            conn.Open();

            string getTicket = "SELECT s.scheduleID, m.movieName, s.date, s.time, t.seatNo FROM Ticket t, Schedule s, Movie m WHERE m.movieID = s.movieID " +
                "AND s.scheduleID = t.scheduleID AND t.custID = @custID AND s.date < GETDATE() ORDER BY s.date, s.time DESC";
            SqlCommand cmdSelectTicket = new SqlCommand(getTicket, conn);
            cmdSelectTicket.Parameters.AddWithValue("@custID", custID);
            SqlDataReader ticketReader = cmdSelectTicket.ExecuteReader();

            if (ticketReader.HasRows)
            {
                Boolean hasRow = ticketReader.Read();

                for (int i = 1; i <= 3 && hasRow; i++)
                {
                    string dateTime = DateTime.Parse(ticketReader["date"].ToString()).ToShortDateString() + " " + ticketReader["time"].ToString();

                    contentDiv = new HtmlGenericControl("div");
                    contentDiv.Attributes["class"] = "movie";

                    span = new HtmlGenericControl("span");

                    text = new LiteralControl(i + ". " + ticketReader["movieName"].ToString() + " ");
                    span.Controls.Add(text);

                    // get all the seats in the same schedule purchased by the same customer              
                    List<string> seats = new List<string>();
                    string scheduleID = ticketReader["scheduleID"].ToString();
                    seats.Add(ticketReader["seatNo"].ToString());

                    while ((hasRow = ticketReader.Read()) && scheduleID == ticketReader["scheduleID"].ToString())
                    {
                        seats.Add(ticketReader["seatNo"].ToString());
                    }

                    innerSpan = new HtmlGenericControl("span");
                    innerSpan.Attributes["class"] = "seatNo";
                    innerSpan.InnerText = string.Join(",", seats);
                    span.Controls.Add(innerSpan);
                    contentDiv.Controls.Add(span);

                    span = new HtmlGenericControl("span");
                    span.InnerText = dateTime;
                    contentDiv.Controls.Add(span);

                    innerDiv.Controls.Add(contentDiv);
                }
            }

            conn.Close();

            groupDiv.Controls.Add(innerDiv);

            hiddenPanel.Controls.Add(groupDiv);

            groupDiv = new HtmlGenericControl("div");
            groupDiv.Attributes["class"] = "group";

            innerDiv = new HtmlGenericControl("div");
            innerDiv.Attributes["class"] = "latest-five-review";

            h3 = new HtmlGenericControl("h3");
            h3.InnerText = "Latest Review";
            innerDiv.Controls.Add(h3);

            HtmlGenericControl mostInnerSpan;
            HtmlGenericControl starIcon;

            conn.Open();

            string getReview = "SELECT TOP 5 m.movieName, r.rating, r.comment FROM Review r, Movie m WHERE m.movieID = r.movieID AND r.custID = @custID ORDER BY date DESC";
            SqlCommand cmdSelectReview = new SqlCommand(getReview, conn);
            cmdSelectReview.Parameters.AddWithValue("@custID", custID);
            SqlDataReader reviewReader = cmdSelectReview.ExecuteReader();

            if (reviewReader.HasRows)
            {
                int i = 1;

                while (reviewReader.Read())
                {
                    contentDiv = new HtmlGenericControl("div");
                    contentDiv.Attributes["class"] = "review";

                    span = new HtmlGenericControl("span");

                    text = new LiteralControl(i + ". " + reviewReader["movieName"].ToString() + " ");
                    span.Controls.Add(text);

                    innerSpan = new HtmlGenericControl("span");
                    innerSpan.Attributes["class"] = "rating";

                    mostInnerSpan = new HtmlGenericControl("span");
                    mostInnerSpan.InnerText = reviewReader["rating"].ToString();
                    innerSpan.Controls.Add(mostInnerSpan);

                    starIcon = new HtmlGenericControl("ion-icon");
                    starIcon.Attributes["name"] = "star-outline";
                    innerSpan.Controls.Add(starIcon);

                    span.Controls.Add(innerSpan);
                    contentDiv.Controls.Add(span);

                    span = new HtmlGenericControl("span");
                    span.Attributes["class"] = "comment-span";
                    span.InnerText = reviewReader["comment"].ToString();
                    contentDiv.Controls.Add(span);

                    innerDiv.Controls.Add(contentDiv);

                    i++;
                }
            }

            conn.Close();

            groupDiv.Controls.Add(innerDiv);

            hiddenPanel.Controls.Add(groupDiv);

            groupDiv = new HtmlGenericControl("div");
            groupDiv.Attributes["class"] = "button-group";

            Button btnDelete = new Button();
            btnDelete.ID = "btnDelete";
            btnDelete.CssClass = "delete-button";
            btnDelete.Text = "Delete";
            btnDelete.Click += btnDelete_Click;
            btnDelete.PostBackUrl = "~/Admin-New/ManageCustomer/ManageCustomer.aspx";
            groupDiv.Controls.Add(btnDelete);

            Button btnBack = new Button();
            btnBack.ID = "btnBack";
            btnBack.CssClass = "back-button";
            btnBack.Text = "Back";
            btnBack.Click += closeView_Click;
            groupDiv.Controls.Add(btnBack);

            hiddenPanel.Controls.Add(groupDiv);
        }

        private void Delete_Customer(string custID)
        {
            conn.Open();

            string queryStr = "DELETE FROM Customer WHERE CustID = @CustID";
            SqlCommand cmdDelete = new SqlCommand(queryStr, conn);
            cmdDelete.Parameters.AddWithValue("@CustID", custID);
            int n = cmdDelete.ExecuteNonQuery();

            if (n > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete Success", "alert('Customer Deleted Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete Failed", "alert('Customer Deleted Failed.');", true);
            }

            conn.Close();
        }
    }
}