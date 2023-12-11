using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WAD_Assignment.cancelRefund
{
  

    public partial class Refund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\Users\Valerie\OneDrive\桌面\Degree Y2S2\WAD\Assignment\WAD_Assignment\App_Data\\TicketDB.mdf;Integrated Security=True");
            conn.Open();
        }

        protected System.Void SqlDataSource1_Selecting(System.Object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}