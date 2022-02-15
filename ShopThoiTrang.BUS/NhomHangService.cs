using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopThoiTrang.DAL;
namespace ShopThoiTrang.BUS
{
   public class NhomHangService
    {
        private static NhomHangDAL cmb = new NhomHangDAL();
        public static List<Entity.NhomHang> NhomHang_GetByTop(string Top, string Where, string Order)
        {
            return cmb.NhomHang_GetByTop(Top, Where, Order);
        }
    }
}
