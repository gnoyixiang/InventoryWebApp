using InventoryWebApp.DAO;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Web.SessionState;
using InventoryWebApp.Models;


namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        private static IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        private static IRequestDAO rDAO = new RequestDAO();
        private static IRequestDetailsDAO rdDAO = new RequestDetailsDAO();
        private static IDisbursementDAO dDAO = new DisbursementDAO();
        private static IDisbursementDetailsDAO ddDAO = new DisbursementDetailsDAO();
        private static IDepartmentDAO Idpt = new DepartmentDAO();
        static DateTime now = DateTime.Now;
        private static IRequestDAO Ir = new RequestDAO();
        private static ICollectionPointDAO Icp = new CollectionPointDAO();
        //list catalogue to gridview
        public List<StationeryCatalogue> Gridview()
        {
            List<StationeryCatalogue> list = Isc.ListAllStationery();
            return list;
        }
        public List<StationeryCatalogue> SearchByDescription(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByDescription(keyword);
            return list;
        }
        public List<StationeryCatalogue> SearchByCategoryCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByCategory(keyword);
            return list;
        }
        public List<StationeryCatalogue> SearchByItemCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByItemCode(keyword);
            return list;
        }
        public StationeryCatalogue GetStationery(string itemcode)
        {
            return Isc.GetStationery(itemcode);
        }
        public Request GetRequestbyRequestCode(string requestCode)
        {
            return rDAO.GetRequest(requestCode);
        }
        //add Request with requestDetail
        public string AddRequest(string userName, string departmentCode, List<RequestDTO> stationaries)
        {
            string requestCode = "RQ" + DateTime.Now.ToString("yyMMddHHmmssfff");
            Request request = new Request()
            {
                RequestCode = requestCode,
                DepartmentCode = departmentCode,
                DateCreated = DateTime.Now,
                Status = "pending",
                UserName = userName
            };
            foreach (var stationary in stationaries)
            {
                request.RequestDetails.Add(new RequestDetail()
                { ItemCode = stationary.ItemCode, Quantity = stationary.Quantity, RemainingQuant = stationary.Quantity, Notes = "" });
            }
            rDAO.AddRequest(request);
            return requestCode;
        }
        public string AddRequestDetailtoCurrentRequest(string requestcode, List<RequestDTO> stationaries)
        {
            Request R = GetRequestbyRequestCode(requestcode);
            List<RequestDetail> rd = new List<RequestDetail>();
            RequestDetail exrd = new RequestDetail();

            foreach (var stationary in stationaries)
            {
                rd.Add(new RequestDetail()
                { RequestCode=requestcode, ItemCode = stationary.ItemCode, Quantity = stationary.Quantity, RemainingQuant = stationary.Quantity, Notes = "" });
            }
            exrd = rd.FirstOrDefault();
            if (rdDAO.GetRequestDetail(requestcode, exrd.ItemCode) == null)
            {
                
            }
            else
            {
                rdDAO.GetRequestDetail(requestcode, exrd.ItemCode).Quantity = exrd.Quantity;
                rdDAO.GetRequestDetail(requestcode, exrd.ItemCode).RemainingQuant = exrd.RemainingQuant;

            }
                
          
            return R.RequestCode;
        }
        public List<Request> ListAllRequest()
        {
            return rDAO.ListAllRequest();

        }
        public List<RequestDetail> ListAllRequestDetails(Request R)
        {
            return rdDAO.ListRequestDetail(R.RequestCode);
        }

        public List<Request> SearchRequest(string SearchParam, string SearchString)
        {

            if (SearchParam == "RequestCode" && !String.IsNullOrEmpty(SearchString))
            {
                return rDAO.SearchRequestbyID(SearchString);
            }
            if (SearchParam == "Status" && !String.IsNullOrEmpty(SearchString))
            {
                return rDAO.SearchRequestbyStatus(SearchString);
            }
            if (String.IsNullOrEmpty(SearchString))
            {
                return rDAO.ListAllRequest();
            }
            return rDAO.ListAllRequest();
        }

        public bool CheckStatusToEdit(Request R)
        {
            if (R.Status.ToLower()=="pending")
            {
                return true;
            }
            else return false;
        }

        public List<Disbursement> ListDisbursementbyRequest(Request R)
        {
            List<Disbursement> dlist = new List<Disbursement>();

            foreach (var c in ddDAO.SearchDDByRequest(R))
            {
                Disbursement d = dDAO.SearchDisbursementByCode(c.DisbursementCode).FirstOrDefault();
                if(d != null)
                {
                    dlist.Add(d);
                }
                
            }

            return dlist;
        }

        public RequestDetail GetRequestDetail(string requestCode, string itemCode)
        {
            return rdDAO.GetRequestDetail(requestCode, itemCode);
        }

        public List<Disbursement> ListDisbursementList()
        {
            return dDAO.GetAllDisbursement();
        }

        public void UpdateRequestDetail(RequestDetail rd)
        {
            rdDAO.UpdateRequestDetail(rd);
        }
        public void DeleteRequestDetail(RequestDetail rd)
        {
            rdDAO.DeleteRequestDetail(rd);
        }
        public void UpdateCollectionPoint(string deptCode, string newCCP)
        {
            Department dpt = new Department();
            dpt.CollectionPointCode = newCCP;
            dpt.DepartmentCode = deptCode;
            Idpt.UpdateCollectionPoint(dpt);
        }
        public List<CollectionPoint> DdlCollectionPoint()
        {
            return Icp.ListAllCollectionPoint();
        }

        public int AddRequestDetail(RequestDetail rd)
        {
            return rdDAO.AddRequestDetail(rd);
        }



    }


}
        IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        IRequestDAO Ir = new RequestDAO();
        IRequestDetailsDAO Ird = new RequestDetailsDAO();
        ICollectionPointDAO Icp = new CollectionPointDAO();
        IDepartmentDAO Idpt = new DepartmentDAO();
        IDisbursementDAO Idbm = new DisbursementDAO();
        IEmployeeDAO Iempl = new EmployeeDAO();
        public List<StationeryCatalogue> Gridview()
        {
            List<StationeryCatalogue> list = Isc.ListAllStationery();
            return list;
        }
        public List<StationeryCatalogue> SearchByDescription(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByDescription(keyword);
            return list;
        }
        public List<StationeryCatalogue> SearchByCategoryCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByCategory(keyword);
            return list;
        }
        public List<StationeryCatalogue> SearchByItemCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByItemCode(keyword);
            return list;
        }
        public StationeryCatalogue GetStationery(string itemcode)
        {
            return Isc.GetStationery(itemcode);
        }
        public Request GetRequestCode(string requestCode)
        {
            return Ir.GetRequest(requestCode);
        }
        public string AddRequest(string userName, string departmentCode, List<RequestDTO> stationaries)
        {
            string requestCode = "RQ" + DateTime.Now.ToString("yyMMddHHmmssfff");
            Request request = new Request()
            {
                RequestCode = requestCode,
                DepartmentCode = departmentCode,
                DateCreated = DateTime.Now,
                Status = "pending",
                UserName = userName
            };
            foreach (var stationary in stationaries)
            {
                request.RequestDetails.Add(new RequestDetail()
                { ItemCode = stationary.ItemCode, Quantity = stationary.Quantity, RemainingQuant= stationary.Quantity, Notes = "" });
            }
            Ir.AddRequest(request);
            return requestCode;
        }
        public List<CollectionPoint> DdlCollectionPoint()
        {
            return Icp.ListAllCollectionPoint();
        }
        public void UpdateCollectionPoint(string deptCode, string newCCP)
        {
            
            Department dpt = new Department();
            dpt.CollectionPointCode = newCCP;
            dpt.DepartmentCode = deptCode;
            Idpt.UpdateCollectionPoint(dpt);
            Idbm.UpdateDbmCollectionPoint(deptCode, newCCP);
        }
        public string GetCollectionPoint(string deptName)
        {
            return Idpt.GetCollectionPoint(deptName);
        }
        public string GetDeptCodeByName(string deptName)
        {
            return Idpt.GetDepartCodeByName(deptName);
        }
        public string GetDeptCodeByUserName (string userName)
        {
            return Iempl.GetDeptCodeByUserName(userName);
        }
        public string GetEmployeeNameByUserName(string userName)
        {
            return Iempl.GetEmployeeName(userName);
        }
        public string GetCollectionPointnameByCode(string collectionCode)
        {
            return Icp.GetCollectionPointNameByCode(collectionCode);
        }
        public string GetDeptNameByCode(string deptCode)
        {
            return Idpt.GetDeptNameByCode(deptCode);
        }
    }
}