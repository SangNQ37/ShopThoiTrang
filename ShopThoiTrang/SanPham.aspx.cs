using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang
{
    public partial class SanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Entity.SanPham> lst = new List<Entity.SanPham>();
            string ID_Menu=Request.QueryString["IDMenu"];
            if (String.Compare(ID_Menu, "1") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=1", "");
                lblsanpham.Text = "ĐẦM LIỀN";
            }
            else if (String.Compare(ID_Menu, "2") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=2", "");
                lblsanpham.Text = "ÁO KHOÁC ";
            }
            else if (String.Compare(ID_Menu, "3") == 0)
            {
                lst = SanPhamService.SanPham_GetByTop("", " id_Menu=3", "");
                lblsanpham.Text = "ĐẦM KHUYẾN MÃI";
            }
            else
            {
                lst = SanPhamService.SanPham_GetByTop("", "", "");
                lblsanpham.Text = "SẢN PHẨM";
            }
            dtlsanpham.DataSource = lst;
            dtlsanpham.DataBind();

        }

        protected void dtlaokhoac_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //int i;

            //i = e.Item.ItemIndex;
            //HyperLink s = (HyperLink)(dtlsanpham.Items[i].FindControl("hpltensp"));
            //string TenSP = s.Text;
            //Response.Redirect("~/ChiTietSanPham.aspx?TenSanPham=" + TenSP + "");
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
    }
}