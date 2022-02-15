using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
using ShopThoiTrang.Entity;
namespace ShopThoiTrang
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            if (txtusername.Text == "" || txtpassword.Text == "")
            {
                lblcheck.Text = "Bạn phải nhập đầy đủ user và password!!!";
                return;
            }
            else
            {
                List<Entity.KhachHang> lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + txtusername.Text + "' AND MatKhau='" + txtpassword.Text + "' ", "");
                if (lst.Count > 0)
                {
                    Session["TenDangNhap"] = lst[0].TaiKhoan;
                    Response.Redirect("TrangChu.aspx");
                }
                else
                {
                    lblcheck.Text = "Tài khoản và mật khẩu không đúng!!";
                }
            }
           
            
        }
    }
}