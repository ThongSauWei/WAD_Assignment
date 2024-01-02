using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.MyBooking
{
    public partial class Completed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitRefund_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Refund request submitted. We're processing your request. We'll repond as soon as possible. Thank You');</script>");
        }
    }
}