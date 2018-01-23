using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Controllers
{
    public class StoreClerkController
    {
        IDepartmentDAO departmentDAO = new DepartmentDAO();
        IDisbursementDetailsDAO disbursementDetailsDAO = new DisbursementDetailsDAO();
        IDisbursementDAO disbursementDAO = new DisbursementDAO();
        IEmployeeDAO employeeDAO = new EmployeeDAO();
        IRequestDAO requestDAO = new RequestDAO();
        IRequestDetailsDAO requestDetailsDAO = new RequestDetailsDAO();
        IRetrievalDAO retrievalDAO = new RetrievalDAO();
        IRetrievalDetailsDAO retrievalDetailsDAO = new RetrievalDetailsDAO();
        IStationeryCatalogueDAO stationeryDAO = new StationeryCatalogueDAO();
        ICollectionPointDAO collectionPointDAO = new CollectionPointDAO();
        
        public Disbursement GetDisbursement(string disbursementCode)
        {
            return disbursementDAO.GetDisbursementByCode(disbursementCode);
        }
        public int UpdateRequestDetail(RequestDetail rd)
        {
            return requestDetailsDAO.UpdateRequestDetail(rd);
        }
        public int UpdateStationeryCatalogue(StationeryCatalogue sc)
        {
            return stationeryDAO.UpdateStationery(sc);
        }

        public List<DisbursementDetail> GetDisbursementDetails(String disbursementCode)
        {
            return disbursementDetailsDAO.SearchDDByDCode(disbursementCode);
        }

        public int UpdateDisbursement (Disbursement d)
        {
            return disbursementDAO.UpdateDbmStatus(d);
        }
        public void UpdateDisbursementDetail(DisbursementDetail dd)
        {
            disbursementDetailsDAO.UpdateDisbursementDetail(dd);
        }
        public RequestDetail GetRequestDetail(string RequestC, string itemCode)
        {
            return requestDetailsDAO.GetRequestDetail(RequestC, itemCode);
        }
        public List<DisbursementDetail> GetDisbursingDisbursementDetail()
        {
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();
            foreach (var item in GetDisbursingDisbursements())
            {
                ddList.AddRange(GetDisbursingDisbDetailsByDeptCode(item.DepartmentCode));
            }
            return ddList;
        }
        public Disbursement GetDisbursingDisbursementByDeptCode(String deptCode)
        {
            List<Disbursement> dList = GetDisbursingDisbursements();
            foreach (var item in dList)
            {
                if (item.DepartmentCode == deptCode)
                    return item;
            }
            return null;
        }
        public List<DisbursementDetail> GetDisbursingDisbDetailsByDeptCode(String deptCode)
        {
            try
            {
                return disbursementDetailsDAO.SearchDDByDCode(GetDisbursingDisbursementByDeptCode(deptCode).DisbursementCode);
            } catch(Exception e)
            {
                return null;
            }
            
            
        }

        public List<Disbursement> GetDisbursementListBySClerkInCharge(String collectionPointCode)
        {
            List<Disbursement> disbursingList = GetDisbursingDisbursements();
            List<Disbursement> dList = new List<Disbursement>();
            foreach (var item in disbursingList)
            {
                if (item.CollectionPointCode == collectionPointCode)
                {
                    dList.Add(item);
                }
            }
            return dList;

        }

        public List<Disbursement> GetDisbursementListByCollectionPoint(String collectionPointCode)
        {
            List<Disbursement> disbursingList = GetDisbursingDisbursements();
            List<Disbursement> dList = new List<Disbursement>();
            foreach (var item in disbursingList)
            {
                if (item.CollectionPointCode == collectionPointCode)
                {
                    dList.Add(item);
                }
            }
            return dList;

        }
        public List<Disbursement> GetDisbursingDisbursements()
        {

            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("disbursing");
            dList.Sort();
            return dList;
        }
        public String GetCollectionSClerkInCharge(String collectionPointCode)
        {
            return employeeDAO.GetEmployeeByCode(collectionPointDAO.SearchByCollectionPointCode(collectionPointCode).FirstOrDefault().SClerkInCharge).EmployeeName;
        }
        public void SetCollectionDateToDisbursement(DateTime dt)
        {
            List<Disbursement> dList = GetDisbursingDisbursements();
            foreach(var item in dList)
            {
                item.DatePlanToCollect = dt;
                disbursementDAO.UpdateDbmStatus(item);
                foreach (var detail in disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode))
                {
                    detail.ActualQuantity = detail.Quantity;
                    disbursementDetailsDAO.UpdateDisbursementDetail(detail);
                }
            }
        }
        public CollectionPoint GetCollectionPointByCode (String collectionPointCode)
        {
            return collectionPointDAO.SearchByCollectionPointCode(collectionPointCode).FirstOrDefault();
        }
        
        public List<Department> GetDisbursingDepartmentList(List<Disbursement> dList)
        {
            List<Department> deptList = new List<Department>();
            foreach(var item in dList)
            {
                deptList.Add(departmentDAO.GetDepartmentInfo(item.DepartmentCode));
            }
            return deptList;
        }
        public HashSet<CollectionPoint> GetListOfCollectionPoint()
        {
            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("disbursing");
            HashSet<CollectionPoint> cpList = new HashSet<CollectionPoint>();
            HashSet<String> collectionList = new HashSet<string>();
            foreach (var item in dList)
            {
                cpList.Add(collectionPointDAO.SearchByCollectionPointCode(disbursementDAO.GetDisbursingDisburmentByDeptCode(item.DepartmentCode).CollectionPointCode).FirstOrDefault());
            }

            return cpList; 
        }

        public DateTime GetDefaultCollectionDate()
        {
            DateTime today = DateTime.Today;
            int daysUntilTuesday = ((int)DayOfWeek.Tuesday - (int)today.DayOfWeek + 7) % 7;
            DateTime nextTuesday = today.AddDays(daysUntilTuesday);
            return nextTuesday;
        }
        public void ChangeDisbursementDisbursingToAllocating()
        {
            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("disbursing");
            foreach (var item in dList)
            {
                item.Status = "allocating";
                item.DateCreated = null;
                item.DatePlanToCollect = null;
                disbursementDAO.UpdateDbmStatus(item);
            }
        }
        public void ChangeDisbursementAllocatingToDisbursing()
        {
            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("allocating");
            foreach (var item in dList)
            {
                item.Status = "disbursing";
                item.DateCreated = DateTime.Today;
                item.CollectionPointCode = departmentDAO.GetDepartmentInfo(item.DepartmentCode).CollectionPointCode;
                disbursementDAO.UpdateDbmStatus(item);
                
            }
        }
        public List<DisbursementDetail> GenerateDisbursementDetail()
        {
            List<RequestDetail> requestDetailList = this.GetNotDisbursedRequestDetailList();
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();
            Dictionary<String, int> quantRetrievedRemained = new Dictionary<string, int>();

            foreach (var item in this.GetCurrentRetrieval().RetrievalDetails)
            {
                quantRetrievedRemained.Add(item.ItemCode, (int)item.QuantityRetrieved);
            }

            requestDetailList.Sort();

            foreach (var item in requestDetailList)
            {
                if (quantRetrievedRemained[item.ItemCode] > 0)
                {
                    DisbursementDetail dd = new DisbursementDetail();
                    dd.RequestCode = item.RequestCode;
                    dd.ItemCode = item.ItemCode;
                    //requestDAO.GetRequest(item.RequestCode).DepartmentCode;
                    if (quantRetrievedRemained[item.ItemCode] > item.RemainingQuant)
                    {
                        dd.Quantity = item.RemainingQuant;
                        quantRetrievedRemained[item.ItemCode] -= (int)item.RemainingQuant;
                    }
                    else
                    {
                        dd.Quantity = quantRetrievedRemained[item.ItemCode];
                        quantRetrievedRemained[item.ItemCode] = 0;
                    }
                    ddList.Add(dd);
                }
            }
            return ddList;
        }

        public Dictionary<String, List<DisbursementDetail>> GenerateDisbursementDetailPerItem()
        {
            Retrieval retrieval = this.GetCurrentRetrieval();
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();

            Dictionary<String, List<DisbursementDetail>> ddDict = new Dictionary<string, List<DisbursementDetail>>();

            foreach (var item in retrieval.RetrievalDetails)
            {
                ddDict.Add(item.ItemCode, new List<DisbursementDetail>());
            }
            
            if (disbursementDAO.SearchDbmByStatus("allocating").Count == 0)
            {
                foreach (var item in disbursementDAO.SearchDbmByStatus("disbursing"))
                {
                    ddList.AddRange(disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode));
                }
            }else
            {
                foreach (var item in disbursementDAO.SearchDbmByStatus("allocating"))
                {
                    ddList.AddRange(disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode));
                }
            }

            foreach (var item in ddList)
            {
                ddDict[item.ItemCode].Add(item);
            }
            return ddDict;
        }

        public Dictionary<String, List<DisbursementDetail>> GenerateDisbursementDetail2()
        {
            Retrieval retrieval = this.GetCurrentRetrieval();
            List<RequestDetail> requestDetailList = this.GetNotDisbursedRequestDetailList();
            Dictionary<String, List<DisbursementDetail>> ddList = new Dictionary<string, List<DisbursementDetail>>();
            Dictionary<String, int> quantRetrievedRemained = new Dictionary<string, int>();
            //Dictionary<String, List<DisbursementDetail>>
            //GenerateDisbursementDetail

            foreach (var item in retrieval.RetrievalDetails)
            {
                quantRetrievedRemained.Add(item.ItemCode, (int)item.QuantityRetrieved);
            }

            requestDetailList.Sort();

            foreach (var item in retrieval.RetrievalDetails)
            {
                ddList.Add(item.ItemCode, null);
            }

            foreach (var item in requestDetailList)
            {
                if (quantRetrievedRemained[item.ItemCode] > 0)
                {
                    DisbursementDetail dd = new DisbursementDetail();
                    dd.RequestCode = item.RequestCode;
                    dd.ItemCode = item.ItemCode;
                    if (quantRetrievedRemained[item.ItemCode] > item.RemainingQuant)
                    {
                        dd.Quantity = item.RemainingQuant;
                        quantRetrievedRemained[item.ItemCode] -= (int)item.RemainingQuant;
                    }
                    else
                    {
                        dd.Quantity = quantRetrievedRemained[item.ItemCode];
                        quantRetrievedRemained[item.ItemCode] = 0;
                    }
                    ddList[item.ItemCode].Add(dd);
                }
            }
            return ddList;
        }

        public HashSet<String> GetListOfDeptFromDisbursementDetails(List<DisbursementDetail> ddList)
        {
            HashSet<String> departmentList = new HashSet<string>();
            foreach (var item in ddList)
            {

                departmentList.Add(requestDAO.GetRequest(item.RequestCode).DepartmentCode);
            }
            return departmentList;
        }

        public List<Disbursement> GetAllocatingDisbursementList()
        {

            List<Disbursement> dbmList = disbursementDAO.SearchDbmByStatus("allocating").ToList();
            if (dbmList.Count == 0)
            {
                //if (disbursementDAO.SearchDbmByStatus("disbursing").ToList().Count != 0)
                //{
                //    return disbursementDAO.SearchDbmByStatus("disbursing").ToList();
                //}
                //dbm = new List<Disbursement>();
                List<DisbursementDetail> ddList = GenerateDisbursementDetail();
                HashSet<String> departmentList = GetListOfDeptFromDisbursementDetails(ddList);
                Dictionary<String, Disbursement> disbursementDictionary = new Dictionary<string, Disbursement>();

                int count = 0;

                foreach(var item in departmentList)
                {
                    Disbursement disbursement = new Disbursement();
                    disbursement.DisbursementCode = "DBM" + DateTime.Now.ToString("yyMMddhhmmssfff")+count++;
                    disbursement.DepartmentCode = item;
                    disbursement.Status = "allocating";
                    //disbursement.Username = Session["User"]; Need to write with user
                    //dbm.Add(disbursement);
                    disbursementDictionary.Add(item, disbursement);
                }
                //Add disbursement Details to disbursement
                foreach (var item in ddList)
                {
                    item.DisbursementCode = disbursementDictionary[requestDAO.GetRequest(item.RequestCode).DepartmentCode].DisbursementCode;
                    disbursementDictionary[requestDAO.GetRequest(item.RequestCode).DepartmentCode].DisbursementDetails.Add(item);
                }

                foreach (var item in disbursementDictionary.Values)
                {
                    disbursementDAO.AddDisbursement(item);
                }
                return disbursementDictionary.Values.ToList();
            }
            else
            {
                return dbmList;
            }
        }


        public List<RequestDetail> GetNotDisbursedRequestDetailList()
        {
            List<RequestDetail> rdList = requestDetailsDAO.SearchOutstandingRequestDetails();
            
            foreach (var item in rdList)
            {
                item.Request = requestDAO.GetRequest(item.RequestCode);
            }
            return rdList;
        }

        public Employee GetEmployee(String emplCode)
        {
            return employeeDAO.GetEmployeeByCode(emplCode);
        }

        public Retrieval GetCurrentRetrieval()
        {
            Retrieval retrieval = retrievalDAO.ListRetrievalByStatus("processing").FirstOrDefault();
            //Retrieval rTest = retrievalList.FirstOrDefault();
            if (retrieval == null)
            {
                retrieval = new Retrieval();
                retrieval.RetrievalDetails = new List<RetrievalDetail>();
                retrieval.RetrievalCode = "RT" + DateTime.Now.ToString("yyMMddHHmmssfff");
                retrieval.Status = "processing";
                //retrieval.UserName = Identity.User;
                retrieval.DateRetrieved = DateTime.Now;
                retrieval = CreateRetrievalDetails(retrieval);
                retrievalDAO.AddRetrieval(retrieval);
                return retrieval;
            }
            else
            {
                Retrieval newRetrieval = new Retrieval();
                newRetrieval.RetrievalCode = retrieval.RetrievalCode;
                newRetrieval.Status = retrieval.Status;
                newRetrieval.DateRetrieved = retrieval.DateRetrieved;
                newRetrieval.RetrievalDetails = new List<RetrievalDetail>();
                newRetrieval.RetrievalDetails = retrievalDetailsDAO.ListRetrievalDetailsByRetrievalCode(newRetrieval.RetrievalCode);
                return newRetrieval;
            }
        }
        public Retrieval ResetRetrieval(Retrieval retrieval)
        {
            foreach (var item in retrieval.RetrievalDetails)
            {
                item.QuantityRetrieved = GetMaxRetrieved(item);
                retrievalDetailsDAO.UpdateRetrivalDetails(item);
            }

            return retrieval;
        }

        public int GetMaxRetrieved(RetrievalDetail rd)
        {
            int stock = (int)stationeryDAO.GetStationery(rd.ItemCode).Stock;
            if (stock > rd.QuantityNeeded)
            {
                return (int)rd.QuantityNeeded;
            }
            else
            {
                return stock;
            }
        }
        public Retrieval CreateRetrievalDetails(Retrieval retrieval)
        {
            List<RequestDetail> rdList = this.GetNotDisbursedRequestDetailList();
            Dictionary<String, RetrievalDetail> retrievalList = new Dictionary<string, RetrievalDetail>();
            foreach (RequestDetail rd in rdList)
            {
                if (retrievalList.ContainsKey(rd.ItemCode))
                {
                    retrievalList[rd.ItemCode].QuantityNeeded += rd.Quantity;
                }
                else
                {
                    retrievalList.Add(rd.ItemCode, new RetrievalDetail());
                    retrievalList[rd.ItemCode].ItemCode = rd.ItemCode;
                    retrievalList[rd.ItemCode].RetrievalCode = retrieval.RetrievalCode;
                    retrievalList[rd.ItemCode].QuantityNeeded = rd.RemainingQuant;
                }
            }
            if (retrievalList != null)
            {
                foreach (var item in retrievalList)
                {
                    int stock = (int)stationeryDAO.GetStationery(item.Value.ItemCode).Stock;
                    item.Value.QuantityRetrieved = GetMaxRetrieved(item.Value);
                    retrieval.RetrievalDetails.Add(item.Value);
                }
            }

            return retrieval;
        }
        public List<Request> GetNotDisbursedRequestList()
        {
            List<Request> requestList = new List<Request>();
            requestList.AddRange(requestDAO.SearchRequestbyStatus("processing"));
            requestList.AddRange(requestDAO.SearchRequestbyStatus("incomplete"));
            return requestList;
        }

        public int? GetOutstandingQuantOfRequestDetail(RequestDetail rd)
        {
            if (rd.Status == "outstanding" || rd.Status == "" || rd.Status == "not collected" || rd.Status == null)
            {
                return rd.RemainingQuant;
            }
            return 0;

        }

        public Request GetRequest(String requestCode)
        {
            return requestDAO.GetRequest(requestCode);
        }

        public Department GetDeptByCode(String deptCode)
        {
            return departmentDAO.GetDepartmentInfo(deptCode);
        }

        public StationeryCatalogue GetStationeryByCode(String stationeryCode)
        {
            return stationeryDAO.GetStationery(stationeryCode);
        }

        public int UpdateRetrievalDetail(RetrievalDetail retrievalDetail)
        {
            return retrievalDetailsDAO.UpdateRetrivalDetails(retrievalDetail);
        }

        public List<RequestDetail> GetRequestDetails(String requestCode)
        {
            return requestDetailsDAO.ListRequestDetail(requestCode);
        }


    }
}