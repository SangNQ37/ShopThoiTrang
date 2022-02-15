using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang.Admin
{
    public partial class DonHangAdmin : System.Web.UI.Page
    {
        void getData()
        {
            List<Entity.DatHang> lst = new List<Entity.DatHang>();
            lst = DatHangService.DatHang_GetByTop("", "", "");
            grvDatHang.DataSource = lst;
            grvDatHang.DataBind();

           
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                
            }
        }

        protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnAdd_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnAdd_Top_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Top_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Top_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void CkDelete_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void lbAddSub_Command(object sender, CommandEventArgs e)
        {

        }

        protected void lbEdit_Command(object sender, CommandEventArgs e)
        {

        }

        protected void lbDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void grvKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void grvKhachHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ID"));
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lbtnctdh");
                List<Entity.ChiTietDatHang> lst1 = new List<Entity.ChiTietDatHang>();
                lst1 = ChiTietDatHangService.ChiTietDatHang_GetByTop("", " id_hoadon=" + id + "", "");
                grvChiTietDonHang.DataSource = lst1;
                grvChiTietDonHang.DataBind();
            }  
            
          
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            
        }

        protected void grvKhachHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void grvKhachHang_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnctdh_Click(object sender, EventArgs e)
        {
           
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string id = row.Cells[1].Text;
            List<Entity.ChiTietDatHang> lst1 = new List<Entity.ChiTietDatHang>();
            lst1 = ChiTietDatHangService.ChiTietDatHang_GetByTop("", " id_hoadon="+id+"", "");
            grvChiTietDonHang.DataSource = lst1;
            grvChiTietDonHang.DataBind();
          
           
        }

        protected void grvTintuc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvTintuc_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lbtnctdh_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string id = row.Cells[1].Text;
            List<Entity.ChiTietDatHang> lst1 = new List<Entity.ChiTietDatHang>();
            lst1 = ChiTietDatHangService.ChiTietDatHang_GetByTop("", " id_hoadon=" + id + "", "");
            grvChiTietDonHang.DataSource = lst1;
            grvChiTietDonHang.DataBind();
        }
    }
}