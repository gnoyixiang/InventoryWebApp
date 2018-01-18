using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTestApp
{
    class DisbursementTestApp
    {
        static IDisbursementDAO disbursementDAO = new DisbursementDAO();
        static IRetrievalDAO retrievalDAO = new RetrievalDAO();
        static IRequestDetailsDAO requestDetailsDAO = new RequestDetailsDAO();
        static IRequestDAO requestDAO = new RequestDAO();


        static void Main(string[] args)
        {
            Console.WriteLine(requestDetailsDAO.SearchRequestbyStatus("proce").ToList().Count);
            Disbursement d = new Disbursement();
            d.DisbursementCode = "DBM180101162312124";
            d.DateCreated = DateTime.ParseExact("2018-01-02", "yyyy-MM-dd", null);
            d.DepartmentCode = "ENGL";
            d.DateDisbursed = DateTime.ParseExact("2018-01-02", "yyyy-MM-dd", null);
            d.UserName = "esther@logic.edu.sg";
            d.ReceivedBy = "amit@logic.edu.sg";
            d.Notes = "Test2";
            d.Status = "not disbursed";
            d.DisbursementDetails = null;

            Disbursement dUpdate = GetDisbursementByCode(d.DisbursementCode);
            d.Notes = "Test Update disbursement.";

            Disbursement dUpdateDbmDetail = GetDisbursementByCode("DBMDisbDetailsTest");
            PrintDisbursement(dUpdateDbmDetail);
            //dUpdateDbmDetail.DisbursementDetails = new List<DisbursementDetail>();
            DisbursementDetail dd1 = new DisbursementDetail();
            dd1.RequestCode = "RQ123456789";
            dd1.ItemCode = "P010";
            dd1.Quantity = 20;
            DisbursementDetail dd2 = new DisbursementDetail();
            dd2.RequestCode = "RQ123456789";
            dd2.ItemCode = "P011";
            dd2.Quantity = 25;
            dUpdateDbmDetail.DisbursementDetails.Add(dd1);
            dUpdateDbmDetail.DisbursementDetails.Add(dd2);
            if (dUpdateDbmDetail.DisbursementDetails == null)
            {
                Console.WriteLine("Null");
            }


            DateTime date1 = DateTime.ParseExact("2017-12-01", "yyyy-MM-dd", null);
            DateTime date2 = DateTime.ParseExact("2018-01-04", "yyyy-MM-dd", null);

            Department department = new DepartmentDAO().GetDepartmentInfo("ISS1");


            Console.WriteLine("1. GetAllDisbursement");
            Console.WriteLine("2. GetDisbursementByCode");
            Console.WriteLine("3. SearchDisbursementByCode");
            Console.WriteLine("4. SearchDbmByDateDisbursed");
            Console.WriteLine("5. SearchDbmByPeriodDisbursed");
            Console.WriteLine("6. SearchDbmByDateCreated");
            Console.WriteLine("7. SearchDbmByPeriodCreated");
            Console.WriteLine("8. SearchDbmByDepartment");
            Console.WriteLine("9. SearchDbmByDepartmentCode");
            Console.WriteLine("10. SearchDbmByStatus");
            Console.WriteLine("11. UpdateDisbursement");
            Console.WriteLine("12. UpdateDbmDisbursementDetail");
            Console.WriteLine("13. AddDisbursement");

            Console.WriteLine();

            Console.Write("Please enter the test case: ");
            String test = Console.ReadLine();
            switch (test)
            {
                case "1":
                    PrintDisbursementList( GetAllDisbursement());
                    break;
                case "2":
                    PrintDisbursement(GetDisbursementByCode("DBMDisbDetailsTest"));
                    break;
                case "3":
                    PrintDisbursementList(SearchDisbursementByCode("18"));
                    break;
                case "4":
                    PrintDisbursementList(SearchDbmByDateDisbursed(date2));
                    break;
                case "5":
                    PrintDisbursementList(SearchDbmByPeriodDisbursed(date1, date2));
                    break;
                case "6":
                    PrintDisbursementList(SearchDbmByDateCreated(date1));
                    break;
                case "7":
                    PrintDisbursementList(SearchDbmByPeriodCreated(date1, date2));
                    break;
                case "8":
                    PrintDisbursementList(SearchDbmByDepartment(department));
                    break;
                case "9":
                    PrintDisbursementList(SearchDbmByDepartmentCode("ENGL"));
                    break;
                case "10":
                    PrintDisbursementList(SearchDbmByStatus("not disbursed"));
                    break;
                case "11":
                    Console.WriteLine(UpdateDisbursement(dUpdate));
                    break;
                case "12":
                    Console.WriteLine(UpdateDbmDisbursementDetail(dUpdateDbmDetail));
                    break;
                case "13":
                    Console.WriteLine(AddDisbursement(d));
                    break;
                default:
                    Console.WriteLine(UpdateDbmDisbursementDetail(dUpdateDbmDetail));
                    break;
            }
        }

        static void PrintDisbursement(Disbursement d)
        {
            Console.WriteLine(d.DisbursementCode);
            Console.WriteLine("Number of Disbursement details: "+ d.DisbursementDetails.Count);
            Console.WriteLine(d.DepartmentCode);
            Console.WriteLine(d.UserName);
            Console.WriteLine(d.DateCreated);
            Console.WriteLine("------------------------");
        }
        static void PrintDisbursementList(List<Disbursement> dList)
        {
            if (dList != null)
            {
                foreach (Disbursement d in dList)
                {
                    PrintDisbursement(d);
                }
            }
            else
                Console.WriteLine("There is nothing in the list");
            
        }
       
        static List<Disbursement> GetAllDisbursement()
        {
            return disbursementDAO.GetAllDisbursement();
        }
        static Disbursement GetDisbursementByCode(String disbursementCode)
        {
            return disbursementDAO.GetDisbursementByCode(disbursementCode);
            
        }
        static List<Disbursement> SearchDisbursementByCode(String disbursementCode)
        {
            return disbursementDAO.SearchDisbursementByCode(disbursementCode);
        }
        static List<Disbursement> SearchDbmByDateDisbursed(DateTime d)
        {
            //DateTime d = DateTime.ParseExact(Console.ReadLine(), "yyyy-MM-dd", null);
            return disbursementDAO.SearchDbmByDateDisbursed(d);
        }
        static List<Disbursement> SearchDbmByPeriodDisbursed(DateTime start, DateTime end)
        {
            return disbursementDAO.SearchDbmByPeriodDisbursed(start,end);
        }
        static List<Disbursement> SearchDbmByDateCreated(DateTime d)
        {

            //DateTime d = DateTime.ParseExact(Console.ReadLine(), "yyyy-MM-dd", null);
            return disbursementDAO.SearchDbmByDateCreated(d);

        }
        static List<Disbursement> SearchDbmByPeriodCreated(DateTime start, DateTime end)
        {
            return disbursementDAO.SearchDbmByPeriodCreated(start, end);
        }
        static List<Disbursement> SearchDbmByDepartment(Department d)
        {
            return disbursementDAO.SearchDbmByDepartment(d);
        }
        static List<Disbursement> SearchDbmByDepartmentCode(String dCode)
        {
            return disbursementDAO.SearchDbmByDepartment(dCode);
        }

        static List<Disbursement> SearchDbmByStatus(String status)
        {
            return disbursementDAO.SearchDbmByStatus(status);
        }
        static int UpdateDisbursement(Disbursement d)
        {
            return disbursementDAO.UpdateDisbursement(d);
        }
        static int UpdateDbmDisbursementDetail(Disbursement d)
        {
            return disbursementDAO.UpdateDbmDisbursementDetail(d);
        }
        static int AddDisbursement (Disbursement d)
        {
            return disbursementDAO.AddDisbursement(d);
        }

        //------------------------------------------------------------------------
        //public List<Request> GetNotDisbursedRequestList()
        //{
        //    List<Request> requestList = new List<Request>();
        //    requestList.AddRange(requestDAO.SearchRequestbyStatus("processing"));
        //    requestList.AddRange(requestDAO.SearchRequestbyStatus("incomplete"));
        //    return requestList;
        //}
        //public List<RequestDetail> GetNotDisbursedRequestDetails()
        //{
        //    List<Request> requestList = this.GetNotDisbursedRequestList();
        //    List<RequestDetail> rdList = new List<RequestDetail>();
        //    foreach (Request r in requestList)
        //    {
        //        rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus("outstanding"));
        //        rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus("not collected"));
        //        rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus(""));
        //    }
        //    return rdList;
        //}
       

        //public Retrieval GetCurrentRetrieval()
        //{
        //    List<Retrieval> retrievalList = retrievalDAO.ListRetrievalByStatus("processing");
        //    if (retrievalList != null)
        //    {
        //        Retrieval retrieval = new Retrieval();
        //        retrieval.RetrievalCode = "RT" + DateTime.Now.ToString("yyMMddHHmmssfff");
        //        retrieval.Status = "processing";
        //        //retrieval.UserName = Identity.User;
        //        retrieval.DateRetrieved = DateTime.Now;
        //        retrieval = GetRetrievalDetail(retrieval);
        //        return retrieval;
        //    }
        //    else
        //    {
        //        return retrievalList.First();
        //    }
        //}

        //public Retrieval GetRetrievalDetail(Retrieval retrieval)
        //{
        //    List<RequestDetail> rdList = this.GetNotDisbursedRequestDetails();
        //    Dictionary<String, RetrievalDetail> retrievalList = new Dictionary<string, RetrievalDetail>();
        //    foreach (RequestDetail rd in rdList)
        //    {
        //        if (retrievalList.ContainsKey(rd.ItemCode))
        //        {
        //            retrievalList[rd.ItemCode].QuantityNeeded = rd.Quantity;
        //        }
        //        else
        //        {
        //            retrievalList.Add(rd.ItemCode, new RetrievalDetail());
        //            retrievalList[rd.ItemCode].ItemCode = rd.ItemCode;
        //            retrievalList[rd.ItemCode].RetrievalCode = retrieval.RetrievalCode;
        //            retrievalList[rd.ItemCode].QuantityNeeded = rd.RemainingQuant;
        //        }
        //    }
        //    foreach (var item in retrievalList)
        //    {
        //        if (item.Value.StationeryCatalogue.Stock > item.Value.QuantityNeeded)
        //        {
        //            item.Value.QuantityRetrieved = item.Value.QuantityNeeded;
        //        }
        //        else
        //        {
        //            item.Value.QuantityRetrieved = item.Value.StationeryCatalogue.Stock;
        //        }
        //        retrieval.RetrievalDetails.Add(item.Value);
        //    }
        //    return retrieval;
        //}
    }
}
