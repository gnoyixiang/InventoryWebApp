using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;


namespace ConsoleTestApp
{
    class Program
    {
        public static void Main(String[] args)
        {
            IStationeryCatalogueDAO sDAO = new StationeryCatalogueDAO();
            ISupplierDetailsDAO sdDAO = new SupplierDetailsDAO();
            SupplierDetail sd=null;
            foreach (StationeryCatalogue s in sDAO.ListAllStationery())
            {
                sd = new SupplierDetail();
                sd.SupplierCode = s.Supplier1;
                sd.ItemCode = s.ItemCode;
                sd.Price = s.Price;
                sdDAO.AddSupplierDetail(sd);

                sd = new SupplierDetail();
                sd.SupplierCode = s.Supplier2;
                sd.ItemCode = s.ItemCode;
                sd.Price = s.Price + Convert.ToDecimal(0.1);
                sdDAO.AddSupplierDetail(sd);

                sd = new SupplierDetail();
                sd.SupplierCode = s.Supplier3;
                sd.ItemCode = s.ItemCode;
                sd.Price = s.Price + Convert.ToDecimal(0.2);
                sdDAO.AddSupplierDetail(sd);
            }
        }
    }
}
