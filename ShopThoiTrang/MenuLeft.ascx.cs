using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopThoiTrang
{
    public partial class MenuLeft : System.Web.UI.UserControl
    {
        string IDMenu;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtndamlien_Click(object sender, EventArgs e)
        {
            IDMenu = "1";
            Response.Redirect("~/SanPham.aspx?IDMenu=" + IDMenu + "");
        }

        protected void lbtnaokhoac_Click(object sender, EventArgs e)
        {
            IDMenu = "2";
            Response.Redirect("~/SanPham.aspx?IDMenu=" + IDMenu + "");
        }

        protected void lbtndamkm_Click(object sender, EventArgs e)
        {
            IDMenu = "3";
            Response.Redirect("~/SanPham.aspx?IDMenu=" + IDMenu + "");
        }
    }
}