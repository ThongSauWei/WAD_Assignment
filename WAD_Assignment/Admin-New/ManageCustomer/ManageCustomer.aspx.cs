using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.Admin_New.ManageCustomer
{
    public partial class ManageCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btnView = (Button)sender;
            string custID = btnView.CommandArgument;

            hiddenPanel.Visible = true;
            allContent.Style["filter"] = "brightness(50%)";
        }

        protected void closeView_Click(object sender, EventArgs e)
        {
            hiddenPanel.Visible = false;
            allContent.Style["filter"] = "brightness(100%)";
        }
    }
}