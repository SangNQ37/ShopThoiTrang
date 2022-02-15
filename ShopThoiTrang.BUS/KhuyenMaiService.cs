using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopThoiTrang.DAL;
namespace ShopThoiTrang.BUS
{
   public class KhuyenMaiService
    {
       private static KhuyenMaiDAL cmb = new KhuyenMaiDAL();
        public static List<Entity.KhuyenMai> KhuyenMai_GetByTop(string Top, string Where, string Order)
        {
            return cmb.KhuyenMai_GetByTop(Top, Where, Order);
        }
    }
}
