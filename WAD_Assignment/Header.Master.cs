using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Header : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string logoPath = "~/image/cinemaLogo.png";

            cinemaLogo.Src = ResolveUrl(logoPath);

            string movieImgPath = "~/image/movie1.jpg";

            Img1.Src = ResolveUrl(movieImgPath);
            Img2.Src = ResolveUrl(movieImgPath);
            Img3.Src = ResolveUrl(movieImgPath);

            Img4.Src = ResolveUrl(logoPath);
            footerImg.Src = ResolveUrl(logoPath);
        }

        protected void Button2_ServerClick(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginUrl = "~/loginRegister/Login.aspx";

            Response.Redirect(ResolveUrl(loginUrl));
        }
    }
}