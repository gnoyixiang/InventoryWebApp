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
        IDisbursementDetailsDAO disburseDetailsDAO = new DisbursementDetailsDAO();
        IDisbursementDAO disburseDAO = new DisbursementDAO();
        IRequestDAO requestDAO = new RequestDAO();
        IRequestDetailsDAO requestDetailsDAO = new RequestDetailsDAO();
        IRetrievalDAO retrievalDAO = new RetrievalDAO();
        IRetrievalDetailsDAO retrievalDetailsDAO = new RetrievalDetailsDAO();
        IStationeryCatalogueDAO stationeryDAO = new StationeryCatalogueDAO();
        IEmployeeDAO employeeDAO = new EmployeeDAO();

        public List<RequestDetail> GetNotDisbursedRequestDetailList()
        {
            List<RequestDetail> rdList = new List<RequestDetail>();
            rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus("outstanding"));
            rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus("not collected"));
            rdList.AddRange(requestDetailsDAO.SearchRequestbyStatus("processing"));

            return rdList;
        }

        public String GetEmployeeNameByUserName(String userName)
        {
            return employeeDAO.GetEmployeeName(userName);
        }

        public Retrieval GetCurrentRetrieval()
        {
            List<Retrieval> retrievalList = retrievalDAO.ListRetrievalByStatus("processing");
            //Retrieval rTest = retrievalList.First();
            if (retrievalList.Count == 0)
            {
                Retrieval retrieval = new Retrieval();
                retrieval.RetrievalCode = "RT" + DateTime.Now.ToString("yyMMddHHmmssfff");
                retrieval.Status = "processing";
                //retrieval.UserName = Identity.User;
                retrieval.DateRetrieved = DateTime.Now;
                retrieval = GetRetrievalDetail(retrieval);
                retrievalDAO.AddRetrieval(retrieval);
                return retrieval;
            }
            else
            {
                String retrievalCode = retrievalList.First().RetrievalCode;
                Retrieval retrieval = retrievalDAO.GetRetrieval(retrievalCode);
                List<RetrievalDetail> rdList = retrievalDetailsDAO.ListRetrievalDetailsByRetrievalCode(retrievalCode);
                retrieval.RetrievalDetails = rdList;
                return retrieval;
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
                return (int) rd.QuantityNeeded;
            }
            else
            {
                return stock;
            }
        }
        public Retrieval GetRetrievalDetail(Retrieval retrieval)
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
                    int stock = (int) stationeryDAO.GetStationery(item.Value.ItemCode).Stock;
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