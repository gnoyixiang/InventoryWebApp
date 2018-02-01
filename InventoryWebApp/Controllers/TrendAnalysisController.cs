using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Controllers
{
    public class TrendAnalysisController
    {
        private static IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        private static ISupplierDAO supplierDAO = new SupplierDAO();
        private static ISupplierDetailsDAO supplierDetailsDAO = new SupplierDetailsDAO();
        private static ITenderDAO tenderDAO = new TenderDAO();
        private static ITenderDetailsDAO tenderDetailDAO = new TenderDetailsDAO();


        public List<Supplier> ListAllSupplier()
        {
            return supplierDAO.ListOfSupplier();

        }

        public List<Tender> ListAllTender()
        {
            return tenderDAO.ListAllTenders();
        }

        public List<TenderDetail> ListAllTenderDetails(Tender tender)
        {
            return tender.TenderDetails.ToList();
        }

        public double GetPriceForAnalysis(string supplierName, int year, string itemCode)
        {

            List<Tender> tenderList = tenderDAO.ListTendersBySupplierCode(supplierDAO.GetSupplierCodeBySupplierName(supplierName));
            List<TenderDetail> tdDetailList = new List<TenderDetail>();
            double price;
            foreach(var i in tenderList)
            {
                if (Convert.ToDateTime(i.DateCreated).Year == year)
                {
                    foreach (var r in tenderDetailDAO.ListTenderDetailsByTenderCode(i.TenderCode))
                    {
                        if (r.ItemCode == itemCode)
                        {
                            price = (double)tenderDetailDAO.getTenderDetail(i.TenderCode, r.ItemCode).Price;
                            return price;
                        }
                        
                    }
                }
                

            }
            return 0;
            
        }

        public List<string> ListAllItemCode()
        {
            return Isc.ListAllItemCode();
        }

        public List<string> ListAllSupplierName()
        {
            List<string> supplierName = new List<string>();
            foreach(var s in supplierDAO.ListOfSupplier())
            {
                supplierName.Add(s.SupplierName);
            }
            return supplierName;
        }

    }
}