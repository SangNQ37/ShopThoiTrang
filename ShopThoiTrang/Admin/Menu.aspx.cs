using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang.Admin
{
    public partial class Menu : System.Web.UI.Page
    {
        public static bool insert = true;
        void getData()
        {
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop("","Type="+cmbType_Home.SelectedValue.ToString(),"");
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i].Level.Length > 4)
                {
                    lst[i].TenMenu = "-------" + lst[i].TenMenu;
                }
            }
            grvMenu.DataSource = lst;
            grvMenu.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }

        protected void cmbType_Home_SelectedIndexChanged(object sender, EventArgs e)
        {
            getData();
        }

        protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
        {
            getData();
        }

        protected void btnAdd_Top_Click(object sender, EventArgs e)
        {

        }
        public void ClearText()
        {
            txtID.Text = "";
            txtTenMenu.Text = "";
            txtType.Text = "";
            txtOrd.Text = "";
            txtLevel.Text = "";
            txtLink.Text = "";
            txtIcon.Text = "";
            chkActive.Checked = true;
            cmbTypeClick.SelectedIndex = 0;
        }
        protected void lbAddSub_Command(object sender, CommandEventArgs e)
        {
            string i = e.CommandArgument.ToString();
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop("", " ID = " + i, "");
            if (lst[0].Level.Length > 4)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo!!", "alert('Không thể thêm Menu cấp 3');", true);
                getData();
            }
            else
            {
                insert = true;
                pnData.Visible = false;
                pnInfo.Visible = true;
                ClearText();
                txtType.Text = cmbType_Home.SelectedValue.ToString();
                List<Entity.QuanLyMeNu> lst1 = new List<Entity.QuanLyMeNu>();
                lst1 = QuanLyMeNuService.QuanLyMeNu_GetByTop("1", "Type = " + cmbType_Home.SelectedValue.ToString() + " and Level like '" + lst[0].Level + "' + '%' and Len(Level) > 4", "Ord DESC");
                string ord;
                if (lst1.Count == 0)
                {
                    ord = "1";
                }
                else
                    ord = (Int32.Parse(lst1[0].Ord) + 1).ToString();
                string level = ord;
                while (level.Length < 4)
                {
                    level = "0" + level;
                }
                level = lst[0].Level + level;
                txtOrd.Text = ord;
                txtLevel.Text = level;
            }
        }

        protected void lbUp_Command(object sender, CommandEventArgs e)
        {
            //if(QuanLyMeNuService)
        }

        protected void lbDown_Command(object sender, CommandEventArgs e)
        {

        }

        protected void lbEdit_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();

            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop("", " ID = "+i, "");
            pnInfo.Visible = true;
            pnData.Visible = false;
            
            insert = false;

            txtID.Text = lst[0].ID;
            txtTenMenu.Text = lst[0].TenMenu;
            txtType.Text = lst[0].Type;
            txtOrd.Text = lst[0].Ord;
            txtLevel.Text = lst[0].Level;
            cmbTypeClick.SelectedValue = lst[0].TypeClick;
            txtIcon.Text = lst[0].Icon;
            chkActive.Checked = lst[0].Active == "True" ? true : false;
            txtLink.Text = lst[0].Link;
        }

        protected void lbDelete_Command(object sender, CommandEventArgs e)
        {
            int i = Int32.Parse(e.CommandArgument.ToString());
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop(""," ID = " + i,"");
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop(""," Type="+lst[0].Type+" and Level like '"+lst[0].Level+"' + '%'","");
            for (int j = 0; j < lst.Count; j++)
            {
                QuanLyMeNuService.QuanLyMeNu_Delete(lst[j].ID);
            }
            getData();

        }

        protected void grvMenu_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvMenu_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Top_Command(object sender, CommandEventArgs e)
        {
            insert = true;
            pnData.Visible = false;
            pnInfo.Visible = true;
            ClearText();
            txtType.Text = cmbType_Home.SelectedValue.ToString();

            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst = QuanLyMeNuService.QuanLyMeNu_GetByTop("1", "Type = " + cmbType_Home.SelectedValue.ToString() + " and Len(Level) < 5", "Ord DESC");
            string ord;
            if (lst.Count == 0)
            {
                ord = "1";
            }
            else
                ord = (Int32.Parse(lst[0].Ord) + 1).ToString();
            string level = ord;
            while (level.Length < 4)
            {
                level = "0" + level;
            }
            txtOrd.Text = ord;
            txtLevel.Text = level;
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnSave_Top_Click(object sender, EventArgs e)
        {
            Entity.QuanLyMeNu dt = new Entity.QuanLyMeNu();
            if (insert == true)
            {
                dt.TenMenu = txtTenMenu.Text;
                dt.Type = txtType.Text;
                dt.Ord = txtOrd.Text;
                dt.Level = txtLevel.Text;
                dt.Link = txtLink.Text;
                dt.TypeClick = cmbTypeClick.SelectedValue.ToString();
                dt.Icon = txtIcon.Text;
                dt.Active = chkActive.Checked == true ? "True" : "False";
                QuanLyMeNuService.QuanLyMeNu_Insert(dt);
                getData();
            }
            else
            {
                dt.ID = txtID.Text;
                dt.TenMenu = txtTenMenu.Text;
                dt.Type = txtType.Text;
                dt.Ord = txtOrd.Text;
                dt.Level = txtLevel.Text;
                dt.Link = txtLink.Text;
                dt.TypeClick = cmbTypeClick.SelectedValue.ToString();
                dt.Icon = txtIcon.Text;
                dt.Active = chkActive.Checked == true ? "True" : "False";
                QuanLyMeNuService.QuanLyMeNu_Update(dt);
                getData();
            }
            insert = true;
            pnData.Visible = true;
            pnInfo.Visible = false;
            ClearText();
        }

        protected void btnReturn_Top_Click(object sender, EventArgs e)
        {

        }
        public bool isDown(string ID)
        {
            List<Entity.QuanLyMeNu> lst1 = new List<Entity.QuanLyMeNu>();
            lst1 = QuanLyMeNuService.QuanLyMeNu_GetByTop("1", "ID = "+ID, "");
            List<Entity.QuanLyMeNu> lst2 = new List<Entity.QuanLyMeNu>();
            string s = lst1[0].Level.Substring(0,lst1[0].Level.Length-4);
            lst2=QuanLyMeNuService.QuanLyMeNu_GetByTop("1","Type = " + lst1[0].Type + " and Level like '" + s + "' + '%' and Level <>'" + s + "'  and Len(Level) < Len('" + s + "') + 5 and Ord > " + lst1[0].Ord,"Ord Asc");
            if (lst2.Count == 0)
                return false;
            else
                return true;
        }
        protected void btnReturn_Top_Command(object sender, CommandEventArgs e)
        {
            ClearText();
            pnData.Visible = true;
            pnInfo.Visible = false;
            getData();
        }
    }
}