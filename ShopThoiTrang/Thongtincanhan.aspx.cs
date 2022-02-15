using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang
{
    public partial class Thongtincanhan : System.Web.UI.Page
    {
        string MatKhau, TenDangNhap;
         List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                TenDangNhap = Request.QueryString["TenDangNhap"];
                if (Session["link_fb"] != null)
                {
                   
                    txtpassword.Enabled = false;
                    txtpassword.Width = 319;
                    txtpassword.Height = 30;
                    txtrepressPassword.Enabled = false;
                    txtrepressPassword.Width = 319;
                    txtrepressPassword.Height = 27;

                    
                    lst = KhachHangService.KhachHang_GetByTop("", " link_fb='" + Session["link_fb"] + "'", "");
                    lbltendangnhap.Text = lst[0].TaiKhoan;
                    txthovaten.Text = lst[0].TenKH;
                    string gt = lst[0].GioiTinh;
                    if (String.Compare(gt, "True") == 0)
                    {
                        rdobtnNam.Checked = true;
                    }
                    else
                    {
                        rdobtnNu.Checked = true;
                    }

                    txtngaysinh.Text = lst[0].NgaySinh;
                    txtemail.Text = lst[0].Email;
                    txtdienthoai.Text = lst[0].SDT;
                    if (lst[0].Quan != "" && lst[0].Tinh != "")
                    {
                        ddlquan.Items.FindByText(lst[0].Quan).Selected = true;
                        ddlthanhpho.Items.FindByText(lst[0].Tinh).Selected = true;
                    }
                  
                    txtdiachi.Text = lst[0].DiaChi;

                   

                    lbltendangnhap.Text = lst[0].TaiKhoan;
                    txtemail.Text = lst[0].Email;
                }
                else
                {
                    List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
                    lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + TenDangNhap + "' ", "");
                    lbltendangnhap.Text = lst[0].TaiKhoan;
                    txthovaten.Text = lst[0].TenKH;
                    string gt = lst[0].GioiTinh;
                    if (String.Compare(gt, "True") == 0)
                    {
                        rdobtnNam.Checked = true;
                    }
                    else
                    {
                        rdobtnNu.Checked = true;
                    }

                    txtngaysinh.Text = lst[0].NgaySinh;
                    txtemail.Text = lst[0].Email;
                    txtdienthoai.Text = lst[0].SDT;
                    if (lst[0].Quan != "" && lst[0].Tinh != "")
                    {
                        ddlquan.Items.FindByText(lst[0].Quan).Selected = true;
                        ddlthanhpho.Items.FindByText(lst[0].Tinh).Selected = true;
                    }
                    txtdiachi.Text = lst[0].DiaChi;
                    
                    MatKhau = lst[0].MatKhau;
                }
            }
          
        }

        protected void btndangki_Click(object sender, EventArgs e)
        {
           
            
                Entity.KhachHang objkh = new Entity.KhachHang();
                if (txtpassword.Text != "")
                    objkh.MatKhau = txtpassword.Text.Trim();
                else
                {
                    objkh.MatKhau = MatKhau;
                    //Response.Write("<script>alert('Bạn phải bắt buộc phải nhập mật khẩu!')</script>");
                    //return;
                }
                objkh.TenKH = txthovaten.Text.Trim();
                if (rdobtnNam.Checked == true)
                {
                    objkh.GioiTinh = "true";
                }
                else
                {
                    objkh.GioiTinh = "false";
                }
                objkh.NgaySinh = txtngaysinh.Text;
               
                objkh.SDT = txtdienthoai.Text.Trim();
                objkh.Tinh = ddlthanhpho.SelectedItem.ToString();
                objkh.Quan = ddlquan.SelectedItem.ToString();
                objkh.DiaChi = txtdiachi.Text.Trim();
                List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
                if (Session["link_fb"] != null)
                {
                    objkh.Email = txtemail.Text;
                    lst = KhachHangService.KhachHang_GetByTop("", " link_fb='" + Session["link_fb"] + "' ", "");
                    objkh.Id = lst[0].Id;
                    KhachHangService.KhachHang_Update(objkh);
                    Response.Write("<script>alert('Cật nhật thành công')</script>");
                }
                else
                {
                    objkh.Email = txtemail.Text.Trim();
                    lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + Session["TenDangNhap"] + "'", "");
                    objkh.Id = lst[0].Id;
                    KhachHangService.KhachHang_Update(objkh);
                    Response.Write("<script>alert('Cật nhật thành công')</script>");
                }
            
        }
      
        protected void btnhuy_Click(object sender, EventArgs e)
        {
            if (Session["link_fb"] != null)
            {
                lst = KhachHangService.KhachHang_GetByTop("", " link_fb='" + Session["link_fb"] + "'", "");
                lbltendangnhap.Text = lst[0].TaiKhoan;
                txthovaten.Text = lst[0].TenKH;
                string gt = lst[0].GioiTinh;
                if (String.Compare(gt, "True") == 0)
                {
                    rdobtnNam.Checked = true;
                }
                else
                {
                    rdobtnNu.Checked = true;
                }

                txtngaysinh.Text = lst[0].NgaySinh;
                txtemail.Text = lst[0].Email;
                txtdienthoai.Text = lst[0].SDT;
                if (lst[0].Quan != "" && lst[0].Tinh != "")
                {
                    ddlquan.Items.FindByText(lst[0].Quan).Selected = true;
                    ddlthanhpho.Items.FindByText(lst[0].Tinh).Selected = true;
                }

                txtdiachi.Text = lst[0].DiaChi;



                lbltendangnhap.Text = lst[0].TaiKhoan;
                txtemail.Text = lst[0].Email;

            }
            else
            {
                List<Entity.KhachHang> lst = new List<Entity.KhachHang>();
                lst = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + TenDangNhap + "'", "");
                lbltendangnhap.Text = lst[0].TaiKhoan;
                txthovaten.Text = lst[0].TenKH;
                string gt = lst[0].GioiTinh;
                if (String.Compare(gt, "True") == 0)
                {
                    rdobtnNam.Checked = true;
                }
                else
                {
                    rdobtnNu.Checked = true;
                }

                txtngaysinh.Text = "2017-01-01";
                txtemail.Text = lst[0].Email;
                txtdienthoai.Text = lst[0].SDT;
                ddlquan.Items.FindByText(lst[0].Quan).Selected = true;
                ddlthanhpho.Items.FindByText(lst[0].Tinh).Selected = true;
                txtdiachi.Text = lst[0].DiaChi;
                MatKhau = lst[0].MatKhau;
            }
        }
    }
}