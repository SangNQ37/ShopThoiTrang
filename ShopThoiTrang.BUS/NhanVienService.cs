using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopThoiTrang.DAL;
namespace ShopThoiTrang.BUS
{
    public class NhanVienService
    {
        private static NhanVienDAL cmb = new NhanVienDAL();
        public static List<Entity.NhanVien> NhanVien_GetByTop(string Top, string Where, string Order)
        {
            return cmb.NhanVien_GetByTop(Top, Where, Order);

        }
        public static List<Entity.NhanVien> Check_Login(string Top, string Where, string Order)
        {
            return cmb.NhanVien_GetByTop(Top, Where, Order);
        }
    }
}
