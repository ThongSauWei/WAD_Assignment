using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.MyBooking
{
    public partial class cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ticketID"] == null)
            {
                Response.Redirect("~/error/GeneralError.aspx");
            }
            else
            {
                string ticketID = Request.QueryString["ticketID"];
                string amount = Request.QueryString["amount"];
                pTicketID.InnerText = ticketID;
                ticketIDField.Value = ticketID;
                amountField.Value = amount;
            }
        }

    }
}