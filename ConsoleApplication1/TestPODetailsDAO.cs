using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class TestPODetailsDAO
    {
        //private IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        //private IPODetailsDAO podDAO = new PODetailsDAO();
        //public static void Main(String[] args)
        //{
        //    TestPODetailsDAO testDAO = new TestPODetailsDAO();

        //    Console.WriteLine("\nListing all PODetails");
        //    foreach(PODetail pod in testDAO.ListAllPODetails())
        //    {
        //        Console.WriteLine(testDAO.PODToString(pod));
        //    }

        //    Console.WriteLine("\nListing all PODetails by ItemCode");
        //    foreach (PODetail pod in testDAO.ListPODetailsByItemCode("C001"))
        //    {
        //        Console.WriteLine(testDAO.PODToString(pod));
        //    }

        //    Console.WriteLine("\nListing all PODetails by PODetails");
        //    foreach (PODetail pod in testDAO.ListPODetailsByPOCode("ALPA180116234406038"))
        //    {
        //        Console.WriteLine(testDAO.PODToString(pod));
        //    }

        //    Console.WriteLine("\nGet PODetail");
        //    Console.WriteLine(testDAO.PODToString(testDAO.GetPODetail("ALPA180116234406038", "C001")));

        //    Console.WriteLine("\nUpdate PODetail");
        //    PODetail poDetail = testDAO.GetPODetail("ALPA180116234406038", "C001");
        //    poDetail.Quantity = 999;
        //    testDAO.UpdatePODetail(poDetail);
        //    Console.WriteLine(testDAO.PODToString(testDAO.GetPODetail("ALPA180116234406038", "C001")));
        //}

        ////list all PODetails
        //private List<PODetail> ListAllPODetails()
        //{
        //    return podDAO.ListAllPODetails();
        //}

        ////list all PODetails by PO code
        //private List<PODetail> ListPODetailsByPOCode(string poCode)
        //{
        //    return podDAO.ListPODetailsByPOCode(poCode);
        //}

        ////list all PODetails by ItemCode
        //private List<PODetail> ListPODetailsByItemCode(string itemCode)
        //{
        //    return podDAO.ListPODetailsByItemCode(itemCode);
        //}

        ////get PODetail
        //private PODetail GetPODetail(string poCode, string itemCode)
        //{
        //    return podDAO.GetPODetail(poCode, itemCode);
        //}

        ////update PODetail
        //private int UpdatePODetail(PODetail pod)
        //{
        //    return new PODetailsDAO().UpdatePODetail(pod);
        //}

        //private string PODToString(PODetail pod)
        //{
        //    return "POCode: " + pod.PurchaseOrderCode + ", ItemCode: " + pod.ItemCode + ", Quantity: " + pod.Quantity
        //        + ", Price: " + pod.Price + ", Notes: " + pod.Notes;
        //}
    }
}
