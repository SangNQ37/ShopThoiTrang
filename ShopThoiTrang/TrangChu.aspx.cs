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
    public partial class TrangChu : System.Web.UI.Page
    {
       public void bind_SanPham()
        {
            List<Entity.KhuyenMai> km = new List<Entity.KhuyenMai>();
            km=KhuyenMaiService.KhuyenMai_GetByTop("","","");
            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=2 AND TinhTrang=N'Còn'", " ID ASC");
            dtlaokhoac.DataSource = lst;
            dtlaokhoac.DataBind();
            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=1 AND TinhTrang=N'Còn' ", " ID ASC"); 
            dtlvaydamvasetbo.DataSource = lst;
            dtlvaydamvasetbo.DataBind();
            lst = SanPhamService.SanPham_GetByTop("", " Active='True' AND id_Menu=3 AND TinhTrang=N'Còn' ", " ID ASC");
            dtldamkhuyenmai.DataSource = lst;
            dtldamkhuyenmai.DataBind();
        }
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            bind_SanPham();

            string link_fb = Request.QueryString["s"];

            rptQuangCao.DataSource = QuangCaoService.QuangCao_GetByTop("", " Active='True'", "");
            rptQuangCao.DataBind();

            if (link_fb != null)
            {
                Session["link_fb"] = link_fb;
                List<Entity.KhachHang> lstKh = new List<Entity.KhachHang>();

                lstKh = KhachHangService.KhachHang_GetByTop("", " Link_Fb='" + Session["link_fb"].ToString() + "' ", "");
                if (lstKh.Count ==0)
                {
                    KhachHang objkh = new KhachHang();
                    objkh.TenKH = "";
                    objkh.GioiTinh = "true";
                    objkh.NgaySinh = "";
                    objkh.MatKhau = "";
                   
                    objkh.Email ="";
                    objkh.TaiKhoan = Session["TenDangNhap"].ToString();
                    objkh.SDT = "";
                    objkh.Tinh = "";
                    objkh.Quan = "";
                    objkh.DiaChi = "";
                    objkh.Link_Fb = Session["Link_Fb"].ToString();
                    KhachHangService.KhachHang_Insert(objkh);
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("DangNhap.aspx");
        }

        protected void dtlaokhoac_ItemCommand(object source, DataListCommandEventArgs e)
        {

            //int i;

            //i = e.Item.ItemIndex;
            //HyperLink s = (HyperLink)(dtlaokhoac.Items[i].FindControl("hpltensp"));
            //string TenSP = s.Text;
            //Response.Redirect("~/ChiTietSanPham.aspx?TenSanPham=" + TenSP + "");
         
             
        }

        protected void dtlvaydamvasetbo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //int i;

            //i = e.Item.ItemIndex;
            //HyperLink s = (HyperLink)(dtlvaydamvasetbo.Items[i].FindControl("hpltensp"));
            //string TenSP = s.Text;
            //Response.Redirect("~/ChiTietSanPham.aspx?TenSanPham=" + TenSP + "");
        }

        protected void dtldamkhuyenmai_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //int i;

            //i = e.Item.ItemIndex;
            //HyperLink s = (HyperLink)(dtldamkhuyenmai.Items[i].FindControl("hpltensp"));
            //string TenSP = s.Text;
            //Response.Redirect("~/ChiTietSanPham.aspx?TenSanPham=" + TenSP + "");
        }

        protected void rptQuangCao_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (sender as ImageButton);
                string id=btn.CommandArgument;
                QuangCaoService.QuangCaoClick_Update(id);

        }

        protected void dtlvaydamvasetbo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton myButton = sender as LinkButton;
            if (myButton != null)
            {
                int id = Convert.ToInt32(myButton.CommandArgument);
                Response.Redirect("~/ChiTietSanPham.aspx?Id=" + id + "");
            }
        }

        protected void lbtnMuatiep_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/SanPham.aspx?IDMenu=2");
           
        }

        protected void lbtnchitietvdsb_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=1");
        }

        protected void lbtndamkm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SanPham.aspx?IDMenu=3");
        }
    }
    }