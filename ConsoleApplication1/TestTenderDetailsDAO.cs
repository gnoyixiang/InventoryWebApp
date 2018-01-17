using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestTenderDetailsDAO
    {
        public static void Main(String[] args)
        {
            TestTenderDetailsDAO testDAO = new TestTenderDetailsDAO();

            TenderDetail td1 = new TenderDetail();
            td1.TenderCode = "1235";
            td1.ItemCode = "C001";
            td1.Price = 100;
            //testDAO.AddTender(td1);

            Console.WriteLine("\nGet Tender Detail");
            Console.WriteLine(testDAO.getTenderDetail("1235", "c001").TenderCode);

            Console.WriteLine("\nGet all Tender Details");
            foreach (TenderDetail td in testDAO.ListAllTenderDetails())
            {
                Console.WriteLine(td.ItemCode);
            }

            Console.WriteLine("\nGet Tender Details by item code");
            foreach (TenderDetail td in testDAO.ListTendersByItemCode("c001"))
            {
                Console.WriteLine(td.ItemCode);
            }

            Console.WriteLine("\nGet Tender Details by Tender Code");
            foreach (TenderDetail td in testDAO.ListTendersByTenderCode("1235"))
            {
                Console.WriteLine(td.ItemCode);
            }

            Console.WriteLine("\nGet Tender Details by price");
            foreach (TenderDetail td in testDAO.ListTendersByPrice(1000))
            {
                Console.WriteLine(td.ItemCode);
            }

            Console.WriteLine("\nGet Tender Details by price range");
            foreach (TenderDetail td in testDAO.ListTendersByPrice(1,999))
            {
                Console.WriteLine(td.ItemCode);
            }

            Console.WriteLine("\nUpdate Tender Details");
            TenderDetail td2 = testDAO.getTenderDetail("1235", "c001");
            td2.Price = 888;
            testDAO.UpdateTender(td2);
            Console.WriteLine(testDAO.getTenderDetail("1235", "c001").TenderCode);
        }

        private TenderDetail getTenderDetail(string tenderCode, string itemCode)
        {
            return new TenderDetailsDAO().getTenderDetail(tenderCode, itemCode);
        }

        private List<TenderDetail> ListAllTenderDetails()
        {
            return new TenderDetailsDAO().ListAllTenderDetails();
        }

        private List<TenderDetail> ListTendersByItemCode(string itemCode)
        {
            return new TenderDetailsDAO().ListTenderDetailsByItemCode(itemCode);
        }

        private List<TenderDetail> ListTendersByTenderCode(string tenderCode)
        {
            return new TenderDetailsDAO().ListTenderDetailsByTenderCode(tenderCode);
        }

        private List<TenderDetail> ListTendersByPrice(decimal price)
        {
            return new TenderDetailsDAO().ListTenderDetailsByPrice(price);
        }

        private List<TenderDetail> ListTendersByPrice(decimal startPrice, decimal endPrice)
        {
            return new TenderDetailsDAO().ListTenderDetailsByPrice(startPrice, endPrice);
        }

        private int AddTender(TenderDetail tender)
        {
            return new TenderDetailsDAO().addTenderDetail(tender);
        }

        private int UpdateTender(TenderDetail tender)
        {
            return new TenderDetailsDAO().updateTenderDetail(tender);
        }
    }

}
