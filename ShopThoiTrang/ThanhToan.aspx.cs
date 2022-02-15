using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.Entity;
using ShopThoiTrang.BUS;
using System.Data;
namespace ShopThoiTrang
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        static DataTable tbGioHang = new DataTable();
        Label lblsl = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["IDSanPham"] != null)
                {
                    tbGioHang = (DataTable)Session["GioHang"];
                }
                grvsanpham.DataSource = tbGioHang;
                grvsanpham.DataBind();
                string strTongTien = tbGioHang.Compute("Sum(TongGia)", "").ToString();
                lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
                lblsl = (Label)Master.FindControl("lblslgiohang");
                Session["slspgiohang"] = tbGioHang.Compute("Sum(SoLuong)", "").ToString();
                lblsl.Text = Session["slspgiohang"].ToString();
                List<Entity.HinhThucThanhToan> lstThanhToan = new List<Entity.HinhThucThanhToan>();
                lstThanhToan = HinhThucThanhToanService.HinhThucThanhToan_GetByTop("", " Visible='True'", "");
                ddlhinhthucthanhtoan.DataSource = lstThanhToan;
                ddlhinhthucthanhtoan.DataTextField = "HinhThucThanhToan1";
                ddlhinhthucthanhtoan.DataValueField = "IdPay";
                ddlhinhthucthanhtoan.DataBind();
            }
           
        }

        protected void grvsanpham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int dong = e.RowIndex;
            tbGioHang.Rows.RemoveAt(dong);
            Session["GioHang"] = tbGioHang;
            grvsanpham.DataSource = tbGioHang;
            grvsanpham.DataBind();
            lblsl = (Label)Master.FindControl("lblslgiohang");
            string strTongTien = tbGioHang.Compute("Sum(TongGia)", "").ToString();
            if (strTongTien != "")
                lbltongtien.Text = "Tổng giá: " + string.Format("{0:#.000}", Convert.ToDecimal(strTongTien) / 1000) + " VNĐ";
            else
                lbltongtien.Text = "Tổng giá: 0 VNĐ";
            Session["slspgiohang"] = grvsanpham.Rows.Count.ToString();
            lblsl.Text = Session["slspgiohang"].ToString();

        }

        protected void grvsanpham_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnmuatiep_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }

        protected void btndathang_Click(object sender, EventArgs e)
        {
            List<Entity.KhachHang> lstKh = new List<Entity.KhachHang>();
            Entity.DatHang dh = new Entity.DatHang();
            List<Entity.DatHang> lstdh = new List<Entity.DatHang>();
            Entity.ChiTietDatHang lstctdh = new Entity.ChiTietDatHang();
            string Id_SP;
            if (txtdiachi.Text == "" || txtdienthoai.Text == "" || txtemail.Text == "" || txthovaten.Text == "" || ddlquan.SelectedIndex == 0 || ddlthanhpho.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Bạn phải nhập đầy đủ thông tin!!1')</script>");
                return;
            }
            else if (Session["Link_Fb"] == null)
            {
                if (Session["TenDangNhap"] == null)
                {
                    Entity.KhachHang obj = new Entity.KhachHang();

                    obj.TenKH = txthovaten.Text;
                    obj.TaiKhoan = "";
                    obj.MatKhau = "";
                    obj.NgaySinh = "";
                    obj.GioiTinh = "True";

                    obj.Email = txtemail.Text;
                    obj.SDT = txtdienthoai.Text;
                    obj.DiaChi = txtdiachi.Text;
                    obj.Tinh = ddlthanhpho.SelectedItem.ToString();
                    obj.Quan = ddlquan.SelectedItem.ToString();
                    obj.Link_Fb = "false";
                    KhachHangService.KhachHang_Insert(obj);
                    lstKh = KhachHangService.KhachHang_GetByTop("", " id=(SELECT MAX(id) from tbl_KhachHang) ", "");
                    dh.Id_KhachHang = lstKh[0].Id;
                    dh.NgaylapHD = DateTime.Now.ToString();
                    dh.IdPay = ddlhinhthucthanhtoan.SelectedValue.ToString();
                    DatHangService.DatHang_Insert(dh);
                    lstdh = DatHangService.DatHang_GetByTop("", " id=(SELECT MAX(id) from tbl_DatHang)", "");
                    lstctdh.Id_hoadon = lstdh[0].Id;
                    for (int i = 0; i < tbGioHang.Rows.Count; i++)
                    {
                        string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                        Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;
                        lstctdh.Id_hang = Id_SP;
                        lstctdh.Size = tbGioHang.Rows[i]["Size"].ToString();
                        lstctdh.SoLuongMua = tbGioHang.Rows[i]["SoLuong"].ToString();
                        lstctdh.ThanhTien = tbGioHang.Rows[i]["TongGia"].ToString();
                        lstctdh.Gia = tbGioHang.Rows[i]["Gia"].ToString();
                        ChiTietDatHangService.ChiTietDatHang_Insert(lstctdh);

                    }
                }
                else
                {
                    string TenDangNhap = Session["TenDangNhap"].ToString();

                    lstKh = KhachHangService.KhachHang_GetByTop("", " TaiKhoan='" + TenDangNhap + "'", "");
                    Entity.KhachHang kh = new Entity.KhachHang();
                    kh.Id = lstKh[0].Id;
                    kh.TenKH = txthovaten.Text;
                    kh.Email = txtemail.Text;
                    kh.DiaChi = txtdiachi.Text;
                    kh.SDT = txtdienthoai.Text;
                    kh.Tinh = ddlthanhpho.SelectedItem.ToString();
                    kh.Quan = ddlquan.SelectedItem.ToString();
                    KhachHangService.KhachHang_UpdateDatHang(kh);

                    dh.NgaylapHD = DateTime.Now.ToString();
                    dh.IdPay = ddlhinhthucthanhtoan.SelectedValue.ToString();
                    dh.Id_KhachHang = kh.Id;
                    DatHangService.DatHang_Insert(dh);

                    lstdh = DatHangService.DatHang_GetByTop("", " id=(SELECT MAX(id) from tbl_DatHang where id_KhachHang=" + kh.Id + ")", "");


                    lstctdh.Id_hoadon = lstdh[0].Id;
                    for (int i = 0; i < tbGioHang.Rows.Count; i++)
                    {
                        string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                        Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;
                        lstctdh.Id_hang = Id_SP;
                        lstctdh.Size = tbGioHang.Rows[i]["Size"].ToString();
                        lstctdh.SoLuongMua = tbGioHang.Rows[i]["SoLuong"].ToString();
                        lstctdh.ThanhTien = tbGioHang.Rows[i]["TongGia"].ToString();
                        lstctdh.Gia = tbGioHang.Rows[i]["Gia"].ToString();
                        ChiTietDatHangService.ChiTietDatHang_Insert(lstctdh);

                    }
                }
            }
            else
            {
                string Link_Fb = Session["Link_Fb"].ToString();

                lstKh = KhachHangService.KhachHang_GetByTop("", " Link_Fb='" + Link_Fb + "' ", "");
                Entity.KhachHang kh = new Entity.KhachHang();
                kh.Id = lstKh[0].Id;
                kh.TenKH = txthovaten.Text;
                kh.Email = txtemail.Text;
                kh.DiaChi = txtdiachi.Text;
                kh.SDT = txtdienthoai.Text;
                kh.Tinh = ddlthanhpho.SelectedItem.ToString();
                kh.Quan = ddlquan.SelectedItem.ToString();
                KhachHangService.KhachHang_UpdateDatHang(kh);

                dh.NgaylapHD = DateTime.Now.ToString();
                dh.IdPay = ddlhinhthucthanhtoan.SelectedValue.ToString();
                dh.Id_KhachHang = kh.Id;
                DatHangService.DatHang_Insert(dh);

                lstdh = DatHangService.DatHang_GetByTop("", " id=(SELECT MAX(id) from tbl_DatHang where id_KhachHang=" + kh.Id + ")", "");


                lstctdh.Id_hoadon = lstdh[0].Id;
                for (int i = 0; i < tbGioHang.Rows.Count; i++)
                {
                    string tenSP = tbGioHang.Rows[i]["TenSP"].ToString();
                    Id_SP = SanPhamService.SanPham_GetByTop("", " TenHang=N'" + tenSP + "'", "")[0].Id;
                    lstctdh.Id_hang = Id_SP;
                    lstctdh.Size = tbGioHang.Rows[i]["Size"].ToString();
                    lstctdh.SoLuongMua = tbGioHang.Rows[i]["SoLuong"].ToString();
                    lstctdh.ThanhTien = tbGioHang.Rows[i]["TongGia"].ToString();
                    lstctdh.Gia = tbGioHang.Rows[i]["Gia"].ToString();
                    ChiTietDatHangService.ChiTietDatHang_Insert(lstctdh);

                }
            }
            Response.Write("<script>alert('Đặt hàng thành công!!')</script>");
            Session["GioHang"] = null;
            lblsl = (Label)Master.FindControl("lblslgiohang");
            lblsl.Text = "0";
            lbltongtien.Text = "0 VNĐ";
            tbGioHang = null;
            grvsanpham.DataSource = tbGioHang;
            grvsanpham.DataBind();
        }
    }
}