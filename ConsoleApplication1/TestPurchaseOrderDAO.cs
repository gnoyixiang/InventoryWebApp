using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestPurchaseOrderDAO
    {
        private IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        private IPODetailsDAO podDAO = new PODetailsDAO();
        public static void Main(String[] args)
        {
            TestPurchaseOrderDAO testDAO = new TestPurchaseOrderDAO();

            DateTime now = DateTime.Now;
            PurchaseOrder po1 = new PurchaseOrder();
            po1.PurchaseOrderCode = "ALPA" + now.ToString("yyMMddHHmmssfff");
            po1.DateCreated = now;
            po1.Status = "PENDING";
            po1.Notes = "Test1";
            po1.SupplierCode = "ALPA";
            po1.UserName = "yixiang@ssis.edu.sg";

        //    PODetail pod1 = new PODetail();
        //    pod1.ItemCode = "C001";
        //    pod1.PurchaseOrderCode = po1.PurchaseOrderCode;
        //    pod1.Price = Convert.ToDecimal(0.5);

        //    PODetail pod2 = new PODetail();
        //    pod2.ItemCode = "E001";
        //    pod2.PurchaseOrderCode = po1.PurchaseOrderCode;
        //    pod2.Price = Convert.ToDecimal(0.3);

        //    PODetail pod3 = new PODetail();
        //    pod3.ItemCode = "F020";
        //    pod3.PurchaseOrderCode = po1.PurchaseOrderCode;
        //    pod3.Price = Convert.ToDecimal(2);

            //po1.PODetails.Add(pod1);
            //po1.PODetails.Add(pod2);
            //po1.PODetails.Add(pod3);
            
            Console.WriteLine("/nAdding purchase order");
            testDAO.AddPurchaseOrder(po1);
            
            var polist = testDAO.ListAllPurchaseOrders();            
            foreach (PurchaseOrder po in polist)
            {
                Console.WriteLine("\nListing purchase order");
                Console.WriteLine(testDAO.POToString(po));
                foreach(PODetail pod in testDAO.ListPODetailsInPO(po))
                {
                    Console.WriteLine(testDAO.PODToString(pod));
                }
            }

            Console.WriteLine("\nListing purchase orders by status");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByStatus("pending"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by status");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByStatus("pending"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by supplier code");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersBySupplierCode("alpa"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by username");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByUsername("yixiang@ssis.edu.sg"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by approved by");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByApprovedBy("amit@logic.edu.sg"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by received by");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByReceivedBy("yixiang@ssis.edu.sg"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by last updated by");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByLastUpdatedBy("yixiang@ssis.edu.sg"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by last updated by");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByLastUpdatedBy("yixiang@ssis.edu.sg"))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date created");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByDateCreated(DateTime.Parse("02/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date created range");
            foreach (PurchaseOrder po in 
                testDAO.ListPurchaseOrdersByDateCreated(DateTime.Parse("02/01/2018"), DateTime.Parse("10/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date approved");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByDateApproved(DateTime.Parse("02/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date approved range");
            foreach (PurchaseOrder po in
                testDAO.ListPurchaseOrdersByDateyDateApproved(DateTime.Parse("02/01/2018"), DateTime.Parse("10/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date received");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByDateReceived(DateTime.Parse("02/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date received range");
            foreach (PurchaseOrder po in
                testDAO.ListPurchaseOrdersByDateyDateReceived(DateTime.Parse("02/01/2018"), DateTime.Parse("10/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date last updated");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByDateLastUpdated(DateTime.Parse("02/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date last updated");
            foreach (PurchaseOrder po in
                testDAO.ListPurchaseOrdersByDateyDateLastUpdated(DateTime.Parse("02/01/2018"), DateTime.Parse("10/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }


            Console.WriteLine("\nListing purchase orders by date supply expected");
            foreach (PurchaseOrder po in testDAO.ListPurchaseOrdersByDateSupplyExpected(DateTime.Parse("02/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nListing purchase orders by date supply expected range");
            foreach (PurchaseOrder po in
                testDAO.ListPurchaseOrdersByDateyDateSupplyExpected(DateTime.Parse("02/01/2018"), DateTime.Parse("10/01/2018")))
            {
                Console.WriteLine(testDAO.POToString(po));
            }

            Console.WriteLine("\nUpdate first purchase order");
            PurchaseOrder purchaseOrder = testDAO.ListAllPurchaseOrders().FirstOrDefault<PurchaseOrder>();
            purchaseOrder.Status = "EDITING";
            testDAO.UpdatePurchaseOrder(purchaseOrder);
            Console.WriteLine(testDAO.POToString(testDAO.GetPurchaseOrder(purchaseOrder.PurchaseOrderCode)));

        }

        //add PurchaseOrder with PODetails
        public int AddPurchaseOrder(PurchaseOrder po)
        {
            return poDAO.AddPurchaseOrder(po);
        }

        //get List of PurchaseOrder
        private List<PurchaseOrder> ListAllPurchaseOrders()
        {
            return poDAO.ListAllPurchaseOrders();            
        }

        //get PurchaseOrder
        private PurchaseOrder GetPurchaseOrder(string poCode)
        {
            return poDAO.GetPurchaseOrder(poCode);
        }

        //get List of PODetails by PO
        private List<PODetail> ListPODetailsInPO(PurchaseOrder po)
        {
            return new PODetailsDAO().ListPODetailsByPOCode(po.PurchaseOrderCode);            
        }
        
        //update PurchaseOrder
        private int UpdatePurchaseOrder(PurchaseOrder po)
        {
            return poDAO.UpdatePurchaseOrder(po);
        }

        //get List of PurchaseOrder by Status
        private List<PurchaseOrder> ListPurchaseOrdersByStatus(string status)
        {
            return poDAO.ListPurchaseOrdersByStatus(status);
        }

        //get List of PurchaseOrder by SupplierCode
        private List<PurchaseOrder> ListPurchaseOrdersBySupplierCode(string supplierCode)
        {
            return poDAO.ListPurchaseOrdersBySupplierCode(supplierCode);
        }

        //get List of PurchaseOrder by Username
        private List<PurchaseOrder> ListPurchaseOrdersByUsername(string username)
        {
            return poDAO.ListPurchaseOrdersByUsername(username);
        }

        //get List of PurchaseOrder by ApprovedBy
        private List<PurchaseOrder> ListPurchaseOrdersByApprovedBy(string username)
        {
            return poDAO.ListPurchaseOrdersByApprovedBy(username);
            
        }

        //get List of PurchaseOrder by ReceivedBy
        private List<PurchaseOrder> ListPurchaseOrdersByReceivedBy(string username)
        {
            return poDAO.ListPurchaseOrdersByReceivedBy(username);
        }

        //get List of PurchaseOrder by LastUpdatedBy
        private List<PurchaseOrder> ListPurchaseOrdersByLastUpdatedBy(string username)
        {
            return poDAO.ListPurchaseOrdersByLastUpdatedBy(username);
        }

        //get List of PurchaseOrder by Date Created
        private List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime dateCreated)
        {
            return poDAO.ListPurchaseOrdersByDateCreated(dateCreated);
        }

        //get List of PurchaseOrder by Date Created Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate)
        {
            return poDAO.ListPurchaseOrdersByDateCreated(startDate, endDate);
        }

        //get List of PurchaseOrder by Date Approved Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateyDateApproved(DateTime startDate, DateTime endDate)
        {
            return poDAO.ListPurchaseOrdersByDateApproved(startDate, endDate);
        }

        //get List of PurchaseOrder by Date Approved Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateApproved(DateTime dateTime)
        {
            return poDAO.ListPurchaseOrdersByDateApproved(dateTime);
        }

        //get List of PurchaseOrder by Date Received Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateyDateReceived(DateTime startDate, DateTime endDate)
        {
            return poDAO.ListPurchaseOrdersByDateReceived(startDate, endDate);
        }

        //get List of PurchaseOrder by Date Received Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateReceived(DateTime dateTime)
        {
            return poDAO.ListPurchaseOrdersByDateReceived(dateTime);
        }

        //get List of PurchaseOrder by Date LastUpdated Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateyDateLastUpdated(DateTime startDate, DateTime endDate)
        {
            return poDAO.ListPurchaseOrdersByDateLastUpdated(startDate, endDate);
        }

        //get List of PurchaseOrder by Date LastUpdated Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateLastUpdated(DateTime dateTime)
        {
            return poDAO.ListPurchaseOrdersByDateLastUpdated(dateTime);
        }

        //get List of PurchaseOrder by Date SupplyExpected Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateyDateSupplyExpected(DateTime startDate, DateTime endDate)
        {
            return poDAO.ListPurchaseOrdersByDateSupplyExpected(startDate, endDate);
        }

        //get List of PurchaseOrder by Date SupplyExpected Range
        private List<PurchaseOrder> ListPurchaseOrdersByDateSupplyExpected(DateTime dateTime)
        {
            return poDAO.ListPurchaseOrdersByDateSupplyExpected(dateTime);
        }

        private string POToString(PurchaseOrder po)
        {
            return "POCode: " + po.PurchaseOrderCode + ", Username: " + po.UserName + ", DateCreated: " + po.DateCreated 
                + ", Status: " + po.Status + ", ApprovedBy: " + po.ApprovedBy + ", DateApproved: " + po.DateApproved 
                + ", Notes: " + po.Notes + ", SupplierCode: " + po.SupplierCode + ", Username: " + po.UserName 
                + ", Last Updated By: " + po.LastUpdatedBy + ", Last Updated Date: " + po.DateLastUpdated 
                + ", Received By: " + po.ReceivedBy + ", : " + po.UserName;
        }

        private string PODToString(PODetail pod)
        {
            return "POCode: " + pod.PurchaseOrderCode + ", ItemCode: " + pod.ItemCode + ", Quantity: " + pod.Quantity
                + ", Price: " + pod.Price + ", Notes: " + pod.Notes;
        }
    }
}

