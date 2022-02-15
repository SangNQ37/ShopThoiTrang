using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int? so = null;
            int id = Convert.ToInt32(Request["Id"]);
            List<Entity.TinTuc> lst = new List<Entity.TinTuc>();
            TinTucService.TinTucView_Update(id.ToString());
            rptbantin.DataSource = TinTucService.TinTuc_GetByTop("", " id='"+id+"'", "");
            rptbantin.DataBind();
            rptcacbaikhac.DataSource = TinTucService.TinTuc_GetByTop("2", "", " NEWID()");
            rptcacbaikhac.DataBind();
        }
    }
}