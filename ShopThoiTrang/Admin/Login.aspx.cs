using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<Entity.NhanVien> login = new List<Entity.NhanVien>();
            login = NhanVienService.Check_Login("", " UserName='" + txtUserName.Text + "' and Password='"+txtPassWord.Text+"'", "");
            if (login.Count == 0)
            {
                lbError.Text = "Tài khoản hoặc Mật khẩu không đúng!!";
            }
            else
            {
                Session["User"] = login;
                Response.Redirect("HangAdminaspx.aspx");
 
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }
    }
}