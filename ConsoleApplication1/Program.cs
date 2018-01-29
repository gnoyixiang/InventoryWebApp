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
            //SupplierDetail sd = null;
            ITenderDAO tDAO = new TenderDAO();
            ITenderDetailsDAO tdDAO = new TenderDetailsDAO();

            Tender tender;

            string[] supplierCode = new string[] { "ALPA", "BANE", "CHEP", "OMEG" };

            foreach(string s in supplierCode)
            {
                tender = new Tender();
                tender.SupplierCode = s;
                DateTime date = Convert.ToDateTime("01/01/2016");
                tender.DateCreated = date;
                tender.TenderCode = "T" + s + date.ToString("yyMMddHHmmssfff");

                Random r = new Random();

                List<SupplierDetail> sdlist = sdDAO.ListAllSupplierDetail();
                foreach(SupplierDetail sd in sdlist)
                {
                    if (tender.SupplierCode == sd.SupplierCode)
                    {
                        var tenderDetail = new TenderDetail();
                        //tenderDetail.TenderCode = tender.TenderCode;
                        tenderDetail.ItemCode = sd.ItemCode;

                        int discount = r.Next(11);
                        tenderDetail.Price = sd.Price - discount/100*sd.Price;
                        tender.TenderDetails.Add(tenderDetail);
                    }
                }

                tDAO.AddTender(tender);

            }


            //foreach (StationeryCatalogue s in sDAO.ListAllStationery())
            //{
            //    sd = new SupplierDetail();
            //    sd.SupplierCode = s.Supplier1;
            //    sd.ItemCode = s.ItemCode;
            //    sd.Price = s.Price;
            //    sdDAO.AddSupplierDetail(sd);

            //    sd = new SupplierDetail();
            //    sd.SupplierCode = s.Supplier2;
            //    sd.ItemCode = s.ItemCode;
            //    sd.Price = s.Price + Convert.ToDecimal(0.1);
            //    sdDAO.AddSupplierDetail(sd);

            //    sd = new SupplierDetail();
            //    sd.SupplierCode = s.Supplier3;
            //    sd.ItemCode = s.ItemCode;
            //    sd.Price = s.Price + Convert.ToDecimal(0.2);
            //    sdDAO.AddSupplierDetail(sd);
            //}

        }

    }
}
