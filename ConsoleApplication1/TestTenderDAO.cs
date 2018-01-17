using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestTenderDAO
    {
        public static void Main(String[] args)
        {
            TestTenderDAO testDAO = new TestTenderDAO();

            Tender t1 = new Tender();
            t1.TenderCode = "T" + DateTime.Now.ToString("yyMMddhhmmssfff");
            t1.SupplierCode = "Alpa";
            t1.UserName = "yixiang@ssis.edu.sg";
            t1.Notes = "Testing";

            t1.DateCreated = DateTime.Now;
            System.Threading.Thread.Sleep(100);
            Tender t2 = new Tender();
            t2.TenderCode = "T" + DateTime.Now.ToString("yyMMddhhmmssfff"); 
            t2.SupplierCode = "Alpa";
            t2.UserName = "yixiang@ssis.edu.sg";
            t2.Notes = "Testing";
            t2.DateCreated = DateTime.Now;

            System.Threading.Thread.Sleep(100);
            Tender t3 = new Tender();
            t3.TenderCode = "T" + DateTime.Now.ToString("yyMMddhhmmssfff"); 
            t3.SupplierCode = "bane";
            t3.UserName = "yixiang@ssis.edu.sg";
            t3.Notes = "Testing";
            t3.DateCreated = DateTime.Now;

            testDAO.AddTender(t1);
            testDAO.AddTender(t2);
            testDAO.AddTender(t3);

            Console.WriteLine("\nGet tender by code");
            Console.WriteLine(testDAO.GetTender("1235").TenderCode);

            Console.WriteLine("\nList all tenders");
            foreach (Tender t in testDAO.ListAllTenders())
            {
                Console.WriteLine(t.TenderCode);
            }

            Console.WriteLine("\nList all by supplier code");
            foreach (Tender t in testDAO.ListTendersBySupplierCode("BANE"))
            {
                Console.WriteLine(t.TenderCode);
            }

            Console.WriteLine("\nList all by username");
            foreach (Tender t in testDAO.ListTendersByUsername("YIXIANG@ssis.edu.sg"))
            {
                Console.WriteLine(t.TenderCode);
            }

            Console.WriteLine("\nList all date created");
            foreach (Tender t in testDAO.ListTendersByDateCreated(DateTime.Parse("17/01/18")))
            {
                Console.WriteLine(t.TenderCode);
            }

            Console.WriteLine("\nList all date created");
            foreach (Tender t in testDAO.ListTendersByDateCreated(DateTime.Parse("16/01/18"), DateTime.Parse("16/01/18")))
            {
                Console.WriteLine(t.TenderCode);
            }
        }

        private Tender GetTender(string tenderCode)
        {
            return new TenderDAO().getTender(tenderCode);
        }

        private List<Tender> ListAllTenders()
        {
            return new TenderDAO().ListAllTenders();
        }

        private List<Tender> ListTendersBySupplierCode(string supplierCode)
        {
            return new TenderDAO().ListTendersBySupplierCode(supplierCode);
        }

        private List<Tender> ListTendersByUsername(string username)
        {
            return new TenderDAO().ListTendersByUsername(username);
        }

        private List<Tender> ListTendersByDateCreated(DateTime dateCreated)
        {
            return new TenderDAO().ListTendersByDateCreated(dateCreated);
        }

        private List<Tender> ListTendersByDateCreated(DateTime startDate, DateTime endDate)
        {
            return new TenderDAO().ListTendersByDateCreated(startDate, endDate);
        }

        private int AddTender(Tender tender)
        {
            return new TenderDAO().AddTender(tender);
        }

        private int UpdateTender(Tender tender)
        {
            return new TenderDAO().UpdateTender(tender);
        }
    }
}
