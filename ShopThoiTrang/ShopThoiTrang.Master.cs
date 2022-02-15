using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang
{
    public partial class ShopThoiTrang : System.Web.UI.MasterPage 
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
              
                lblsonguoiOnline.Text = Application["OnlineUsers"].ToString();
                if (Session["slspgiohang"]!=null)
                  lblslgiohang.Text = Session["slspgiohang"].ToString();
               
                if (Session["TenDangNhap"] != null)
                {
                    //lblsonguoidangnhap.Text = Application["LoggedInUsers"].ToString();
                   
                    btndangki.Text = Session["TenDangNhap"].ToString();
                    btndangnhap.Text = "Đăng xuất";
              
                    
                }

                rptTinTuc.DataSource = TinTucService.TinTuc_GetByTop("4", "", "");
                rptTinTuc.DataBind();
                rptTinTucMoiNhat.DataSource = TinTucService.TinTuc_GetByTop("", " ngayviet=(SELECT MAX(ngayviet) from tbl_TinTuc) ", "");
                rptTinTucMoiNhat.DataBind();
               


            }
           
        }

        protected void btndangki_Click(object sender, EventArgs e)
        {
            if (Session["Facebook"] != null)
            {
                Response.Redirect("~/Thongtincanhan.aspx?TenDangNhap=" + Session["TenDangNhap"] + "");
            }
            else if (Session["TenDangNhap"]!=null)
                Response.Redirect("~/Thongtincanhan.aspx?TenDangNhap=" + Session["TenDangNhap"] + "");
            else
                Response.Redirect("DangKiThanhVien.aspx");
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                Session.Clear();
                btndangki.Text = "Đăng kí";
                btndangnhap.Text = "Đăng nhập";
                Response.Redirect("Dangnhap.aspx");

            }
            else
            {
                Response.Redirect("Dangnhap.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GioHang.aspx");
            
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            if (txtsearch.Text == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập từ khóa tìm kiếm')</script>");
                return;
            }
            else
            Response.Redirect("~/TimKiem.aspx?TenSanPham=" + txtsearch.Text + "");
        }
    }
}