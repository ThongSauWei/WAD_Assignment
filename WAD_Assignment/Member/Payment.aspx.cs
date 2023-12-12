using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.Member
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int thisYear = DateTime.Today.Year;

                for (int year = 0; year <= 5; year++)
                {
                    ddlYear.Items.Add(new ListItem((thisYear + year).ToString()));
                }
            }     
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            int thisYear = DateTime.Today.Year;
            int thisMonth = DateTime.Today.Month;

            if (Convert.ToInt32(ddlYear.SelectedItem.Text) <= thisYear)
            {
                if (Convert.ToInt32(ddlMonth.SelectedValue) <= thisMonth)
                {
                    errorMsg.Text = "The card is expired if this is the expire date";
                }
                else
                {
                    errorMsg.Text = "";
                }
            }
            else
            {
                errorMsg.Text = "";
            }
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage/Homepage.aspx");
        }
    }
}