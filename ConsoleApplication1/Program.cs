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

            //foreach (string s in supplierCode)
            //{
                //tender = new Tender();
                //tender.SupplierCode = s;
                //DateTime date = Convert.ToDateTime("01/01/2016");
                //tender.DateCreated = date;
                //tender.TenderCode = "T" + s + date.ToString("yyMMddHHmmssfff");

                foreach (Tender t in tDAO.ListTendersByDateCreated(Convert.ToDateTime("01/01/2016")))
                {
                    //tender = tDAO.getTender(s);

                    Random r = new Random();
                    
                    List<SupplierDetail> sdlist = sdDAO.ListAllSupplierDetail();
                    foreach (SupplierDetail sd in sdlist)
                    {
                        if (t.SupplierCode == sd.SupplierCode)
                        {
                            var tenderDetail = new TenderDetail();
                            tenderDetail.TenderCode = t.TenderCode;
                            tenderDetail.ItemCode = sd.ItemCode;

                            System.Threading.Thread.Sleep(200);
                            int discount = r.Next(-20,21);
                            tenderDetail.Price = sd.Price + (decimal)discount / 100 * sd.Price;
                            //tender.TenderDetails.Add(tenderDetail);
                            tdDAO.addTenderDetail(tenderDetail);
                        }
                    }
                }

                //tDAO.AddTender(tender);

            //}
        }
    }
}
