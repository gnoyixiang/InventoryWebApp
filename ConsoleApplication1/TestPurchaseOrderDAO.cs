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
        private static IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        private static IPODetailsDAO podDAO = new PODetailsDAO();
        public static void Main(String[] args)
        {
            DateTime now = DateTime.Now;
            PurchaseOrder po1 = new PurchaseOrder();
            po1.PurchaseOrderCode = "ALPA" + now.ToString("yyMMddHHmmssfff");
            po1.DateCreated = now;
            po1.Status = "PENDING";
            po1.Notes = "Test1";
            po1.SupplierCode = "ALPA";
            po1.UserName = "yixiang@ssis.edu.sg";

            PODetail pod1 = new PODetail();
            pod1.ItemCode = "C001";
            pod1.PurchaseOrderCode = po1.PurchaseOrderCode;
            pod1.Price = Convert.ToDecimal(0.5);

            PODetail pod2 = new PODetail();
            pod2.ItemCode = "E001";
            pod2.PurchaseOrderCode = po1.PurchaseOrderCode;
            pod2.Price = Convert.ToDecimal(0.3);

            PODetail pod3 = new PODetail();
            pod3.ItemCode = "F020";
            pod3.PurchaseOrderCode = po1.PurchaseOrderCode;
            pod3.Price = Convert.ToDecimal(2);

            po1.PODetails.Add(pod1);
            po1.PODetails.Add(pod2);
            po1.PODetails.Add(pod3);

            AddPurchaseOrder(po1);

            ListAllPurchaseOrders();
            
        }

        //add PurchaseOrder with PODetail
        public static void AddPurchaseOrder(PurchaseOrder po)
        {
            Console.WriteLine("Adding purchase order " + po.PurchaseOrderCode);
            poDAO.AddPurchaseOrder(po);
        }

        //get List of PurchaseOrder
        private static void ListAllPurchaseOrders()
        {
            var poList = poDAO.ListAllPurchaseOrders();
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
                var podList = podDAO.ListPODetailsByPOCode(po.PurchaseOrderCode);
                foreach (PODetail pod in podList)
                {
                    Console.WriteLine(PODToString(pod));
                }
            }
        }

        //update PurchaseOrder and PODetail
        private static void UpdatePurchaseOrderAndPODetail()
        {
            var po = poDAO.GetPurchaseOrder("ALPA180116234406038");
            po.Status = "CANCELLED";
            //update purchase order
            Console.WriteLine(poDAO.UpdatePurchaseOrder(po));

            var podList = podDAO.ListPODetailsByPOCode(po.PurchaseOrderCode);
            foreach (PODetail pod in podList)
            {
                pod.Quantity = 100;
                //update poDetail
                Console.WriteLine(podDAO.UpdatePODetail(pod));
            }
        }

        //get List of PurchaseOrder by Status
        private static void ListPurchaseOrdersByStatus(string status)
        {
            var poList = poDAO.ListPurchaseOrdersByStatus(/*"APPROVED" */status);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by SupplierCode
        private static void ListPurchaseOrdersBySupplierCode(string supplierCode)
        {
            var poList = poDAO.ListPurchaseOrdersBySupplierCode(/*"ALPA"*/supplierCode);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by Username
        private static void ListPurchaseOrdersByUsername(string username)
        {
            var poList = poDAO.ListPurchaseOrdersByUsername(/*"amit@logic.edu.sg"*/username);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by ApprovedBy
        private static void ListPurchaseOrdersByApprovedBy(string username)
        {
            var poList = poDAO.ListPurchaseOrdersByApprovedBy(/*"amit@logic.edu.sg"*/username);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by ReceivedBy
        private static void ListPurchaseOrdersByReceivedBy(string username)
        {
            var poList = poDAO.ListPurchaseOrdersByReceivedBy(/*"yixiang@ssis.edu.sg"*/username);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by LastUpdatedBy
        private static void ListPurchaseOrdersByLastUpdatedBy(string username)
        {
            var poList = poDAO.ListPurchaseOrdersByLastUpdatedBy(/*"yixiang@ssis.edu.sg"*/ username);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        //get List of PurchaseOrder by LastUpdatedBy
        private static void ListPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate)
        {
            //DateTime startDate = DateTime.Parse("01/01/2018");
            //DateTime endDate = DateTime.Parse("10/01/2018");
            var poList = poDAO.ListPurchaseOrdersByDateCreated(startDate, endDate);
            foreach (PurchaseOrder po in poList)
            {
                Console.WriteLine(POToString(po));
            }
        }

        private static string POToString(PurchaseOrder po)
        {
            return "POCode: " + po.PurchaseOrderCode + ", DateCreated: " + po.DateCreated + ", Status: " + po.Status
                + ", ApprovedBy: " + po.ApprovedBy + ", DateApproved: " + po.DateApproved + ", Notes: " + po.Notes
                + ", SupplierCode: " + po.SupplierCode + ", Username: " + po.UserName;
        }

        private static string PODToString(PODetail pod)
        {
            return "POCode: " + pod.PurchaseOrderCode + ", ItemCode: " + pod.ItemCode + ", Quantity: " + pod.Quantity
                + ", Price: " + pod.Price + ", Notes: " + pod.Notes;
        }
    }
}

