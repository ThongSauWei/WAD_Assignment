using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.Admin
{
    public partial class Refund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add additional logic in Page_Load if needed
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ConfirmAccept", "confirmAccept();", true);
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ConfirmReject", "confirmReject();", true);
        }
    }
}