using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestRequestDAO
    {
        private static IRequestDAO rDAO = new RequestDAO();
        private static IRequestDetailsDAO rdDAO = new RequestDetailsDAO();
        public static void Main(String[] args)
        {
            DateTime now = DateTime.Now;
            Request r = new Request();
            User u = new User();
            
            r.RequestCode = "RQ" + now.ToString("yyMMddHHmmssfff");
            r.DateCreated = now;
            r.Status = "PENDING";
            r.DepartmentCode = null;
            r.UserName = "junye@logic.edu.sg";
            

            RequestDetail rd1 = new RequestDetail();
            rd1.RequestCode = r.RequestCode;
            rd1.ItemCode = "C006";
            rd1.Quantity = 50;
            rd1.RemainingQuant = 50;
            RequestDetail rd2 = new RequestDetail();
            rd2.RequestCode = r.RequestCode;
            rd2.ItemCode = "E002";
            rd2.Quantity = 50;
            rd2.RemainingQuant = 50;

            RequestDetail rd3 = new RequestDetail();
            rd3.RequestCode = r.RequestCode;
            rd3.ItemCode = "F021";
            rd3.Quantity = 50;
            rd3.RemainingQuant = 50;

            r.RequestDetails.Add(rd1);
            r.RequestDetails.Add(rd2);
            r.RequestDetails.Add(rd3);

            AddRequest(r);

            ListAllRequest();

        }

        //add Request with requestDetail
        public static int AddRequest(Request R)
        {
            int a = -1;
            Console.WriteLine("Adding purchase order " + R.RequestCode);
            a=rDAO.AddRequest(R);

            return a;
        }

        //get List of Request
        private static void ListAllRequest()
        {
            var rList = rDAO.ListAllRequest();
            foreach (Request r in rList)
            {
                Console.WriteLine(RequestToString(r));
                var rdList = rdDAO.ListRequestDetail(r.RequestCode);
                foreach (RequestDetail rd in rdList)
                {
                    Console.WriteLine(RDToString(rd));
                }
            }
        }

        ////update PurchaseOrder and PODetail
        //private static void UpdatePurchaseOrderAndPODetail()
        //{
        //    var po = poDAO.GetPurchaseOrder("ALPA180116234406038");
        //    po.Status = "CANCELLED";
        //    //update purchase order
        //    Console.WriteLine(poDAO.UpdatePurchaseOrder(po));

        //    var podList = podDAO.ListPODetailsByPOCode(po.PurchaseOrderCode);
        //    foreach (PODetail pod in podList)
        //    {
        //        pod.Quantity = 100;
        //        //update poDetail
        //        Console.WriteLine(podDAO.UpdatePODetail(pod));
        //    }
        //}

        ////get List of PurchaseOrder by Status
        //private static void ListPurchaseOrdersByStatus(string status)
        //{
        //    var poList = poDAO.ListPurchaseOrdersByStatus(/*"APPROVED" */status);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by SupplierCode
        //private static void ListPurchaseOrdersBySupplierCode(string supplierCode)
        //{
        //    var poList = poDAO.ListPurchaseOrdersBySupplierCode(/*"ALPA"*/supplierCode);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by Username
        //private static void ListPurchaseOrdersByUsername(string username)
        //{
        //    var poList = poDAO.ListPurchaseOrdersByUsername(/*"amit@logic.edu.sg"*/username);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by ApprovedBy
        //private static void ListPurchaseOrdersByApprovedBy(string username)
        //{
        //    var poList = poDAO.ListPurchaseOrdersByApprovedBy(/*"amit@logic.edu.sg"*/username);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by ReceivedBy
        //private static void ListPurchaseOrdersByReceivedBy(string username)
        //{
        //    var poList = poDAO.ListPurchaseOrdersByReceivedBy(/*"yixiang@ssis.edu.sg"*/username);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by LastUpdatedBy
        //private static void ListPurchaseOrdersByLastUpdatedBy(string username)
        //{
        //    var poList = poDAO.ListPurchaseOrdersByLastUpdatedBy(/*"yixiang@ssis.edu.sg"*/ username);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        ////get List of PurchaseOrder by LastUpdatedBy
        //private static void ListPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate)
        //{
        //    //DateTime startDate = DateTime.Parse("01/01/2018");
        //    //DateTime endDate = DateTime.Parse("10/01/2018");
        //    var poList = poDAO.ListPurchaseOrdersByDateCreated(startDate, endDate);
        //    foreach (PurchaseOrder po in poList)
        //    {
        //        Console.WriteLine(POToString(po));
        //    }
        //}

        private static string RequestToString(Request r)
        {
            return "Request Code: " + r.RequestCode + ", Department Code " + r.DepartmentCode + ", DateCreated: " + r.DateCreated
                + ", DateApproved: " + r.ApprovedBy + ", Status: " + r.Status + ", Head Remarks: " + r.HeadRemarks
                + ", User Name: " + r.UserName + ", Approved By: " + r.ApprovedBy;
        }

        private static string RDToString(RequestDetail rd)
        {
            return "RecordCode: " + rd.RequestCode + ", ItemCode: " + rd.ItemCode + ", Remaining Quantity: " + rd.RemainingQuant
                + ", Quantity: " + rd.Quantity + ", Notes: " + rd.Notes + ", Status: "+ rd.Status;
        }
    }
}
