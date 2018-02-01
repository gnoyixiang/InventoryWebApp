using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.WCF;

namespace ConsoleTestApp
{
    class Program
    {
        public static void Main(String[] args)
        {
            //IStationeryCatalogueDAO sDAO = new StationeryCatalogueDAO();
            //ISupplierDetailsDAO sdDAO = new SupplierDetailsDAO();
            ////SupplierDetail sd = null;
            //ITenderDAO tDAO = new TenderDAO();
            //ITenderDetailsDAO tdDAO = new TenderDetailsDAO();

            //Tender tender;

            //string[] supplierCode = new string[] { "ALPA", "BANE", "CHEP", "OMEG" };

            ////foreach (string s in supplierCode)
            ////{
            //    //tender = new Tender();
            //    //tender.SupplierCode = s;
            //    //DateTime date = Convert.ToDateTime("01/01/2016");
            //    //tender.DateCreated = date;
            //    //tender.TenderCode = "T" + s + date.ToString("yyMMddHHmmssfff");

            //    foreach (Tender t in tDAO.ListTendersByDateCreated(Convert.ToDateTime("01/01/2016")))
            //    {
            //        //tender = tDAO.getTender(s);

            //        Random r = new Random();

            //        List<SupplierDetail> sdlist = sdDAO.ListAllSupplierDetail();
            //        foreach (SupplierDetail sd in sdlist)
            //        {
            //            if (t.SupplierCode == sd.SupplierCode)
            //            {
            //                var tenderDetail = new TenderDetail();
            //                tenderDetail.TenderCode = t.TenderCode;
            //                tenderDetail.ItemCode = sd.ItemCode;

            //                System.Threading.Thread.Sleep(200);
            //                int discount = r.Next(-20,21);
            //                tenderDetail.Price = sd.Price + (decimal)discount / 100 * sd.Price;
            //                //tender.TenderDetails.Add(tenderDetail);
            //                tdDAO.addTenderDetail(tenderDetail);
            //            }
            //        }
            //    }

            //tDAO.AddTender(tender);

            //}

            //ClerkService s = new ClerkService();
            //List<WCF_RetrievalDetail> l= s.GetProcessingRetrievalDetails("tracy@logic.edu.sg", "!Passw0rd");
            //foreach(WCF_RetrievalDetail d in l)
            //{
            //    Console.WriteLine(d.RetrievalCode);
            //}
            //EmployeeService e = new EmployeeService();
            //WCF_Disbursement d = new WCF_Disbursement();
            //d.Status = "completed";
            //d.DisbursementCode = "DBM1801230808388891";
            //d.RepName = "derek@logic.edu.sg";
            ////e.UpdateDisbursement(d);
            //DepartmentService ds = new DepartmentService();
            //WCFRequest r = new WCFRequest();
            //r.RequestCode = "RQ123456790";

            //ds.Update(r);

            //DepartmentService ds = new DepartmentService();

            //ds.GetAssignRoleInDepartment("ZOOL");
            //Console.WriteLine(ds);


        }
    }
}
