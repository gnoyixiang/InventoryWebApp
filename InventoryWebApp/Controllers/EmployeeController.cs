using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        private static IEmployeeDAO Iempl = new EmployeeDAO();
        private static ICategoryDAO cDAO = new CategoryDAO();
        IDisbursementDetailsDAO IdbmDetails = new DisbursementDetailsDAO();
        IDisbursementDAO Idbm = new DisbursementDAO();
        IUserDAO user = new UserDAO();

        public Employee GetEmployee(string username)
        {
            return Iempl.GetEmployeeInfo(username);
        }
        public Role GetRole(string userName)
        {
            return user.getRoleNameByUsername(userName);
        }

        public int UpdateRequest(Request rq)
        {
            return Ir.UpdateRequest(rq);
        }
        public int UpdateRequestStatusWCF(Request rd)
        {
            return Ir.UpdateRequestStatusWCF(rd);
        }
        public int UpdateRequestDetails(RequestDetail reDetails)
        {
            return rdDAO.UpdateRequestDetail(reDetails);
        }
        public List<RequestDetail> ListRequestDetail(string requestCode)
        {
            return rdDAO.ListRequestDetail(requestCode);
        }

        public int UpdateDisbursement(Disbursement d)
        {
            return Idbm.UpdateDbmStatus(d);

        }
        public Disbursement GetDisbursementCode(string disbursementCode)
        {
            return Idbm.GetDisbursementByCode(disbursementCode);
        }
        public List<DisbursementDetail> DisbursementDetails(string disbrusementCode)
        {
            return IdbmDetails.GetDisbursementDetails(disbrusementCode);
        }
        public Employee GetEmployeeByUsername(string username)
        {
            return Iempl.GetEmployeeInfo(username);
        }

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
        public Request GetRequestCode(string requestCode)
        {
            return Ir.GetRequest(requestCode);
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

        internal List<string> ListAllStationeryCategory()
        {
            return cDAO.ListAllCategoryCode();

        }

        public string AddRequestDetailtoCurrentRequest(string requestcode, List<RequestDTO> stationaries)
        {
            Request R = GetRequestbyRequestCode(requestcode);
            List<RequestDetail> rd = new List<RequestDetail>();
            RequestDetail exrd = new RequestDetail();

            foreach (var stationary in stationaries)
            {
                rd.Add(new RequestDetail()
                { RequestCode = requestcode, ItemCode = stationary.ItemCode, Quantity = stationary.Quantity, RemainingQuant = stationary.Quantity, Notes = "" });
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
            if (SearchParam == "EmployeeName" && !String.IsNullOrEmpty(SearchString))
            {
                return rDAO.ListAllRequest().Where(r=> GetEmployeeNameByUserName(r.UserName).ToUpper().Contains(SearchString.ToUpper())).ToList();
            }
            if (String.IsNullOrEmpty(SearchString))
            {
                return rDAO.ListAllRequest();
            }
            return rDAO.ListAllRequest();
        }

        public bool CheckStatusToEdit(Request R)
        {
            if (R.Status.ToLower() == "pending")
            {
                return true;
            }
            else return false;
        }

        public List<Disbursement> ListDisbursementbyRequest(Request R)
        {
            List<Disbursement> dlist = new List<Disbursement>();

            foreach (var dd in ddDAO.SearchDDByRequest(R))
            {
                Disbursement d = dDAO.SearchDisbursementByCode(dd.DisbursementCode).FirstOrDefault();
                if (d != null)
                {
                    bool hasDisbursement = false;
                    foreach (Disbursement disbursement in dlist)
                    {
                        if (disbursement.DisbursementCode==d.DisbursementCode)
                        {
                            hasDisbursement = true;
                            break;
                        }
                    }
                    if (!hasDisbursement)
                    {
                        dlist.Add(d);
                    }
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
            dDAO.UpdateDbmCollectionPoint(deptCode, newCCP);
        }
        public List<CollectionPoint> DdlCollectionPoint()
        {
            return Icp.ListAllCollectionPoint();
        }

        public int AddRequestDetail(RequestDetail rd)
        {
            return rdDAO.AddRequestDetail(rd);
        }
        public string GetCollectionPoint(string deptName)
        {
            return Idpt.GetCollectionPoint(deptName);
        }
        public string GetDeptCodeByName(string deptName)
        {
            return Idpt.GetDepartCodeByName(deptName);
        }
        public string GetDeptCodeByUserName(string userName)
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
        public int GetCategoryQuantityByDept(string deptName, string catCode, int month, int year)
        {
            List<Request> rlist = new List<Request>();

            foreach (var r in rDAO.SearchRequestByDeptCode(GetDeptCodeByName(deptName)))
            {
                if (r.DateApproved != null)
                {
                    DateTime rDate = Convert.ToDateTime(r.DateApproved);
                    if (rDate.Month == month && rDate.Year == year)
                    {
                        rlist.Add(r);
                    }
                }
            }
            List<RequestDetail> rdlist = new List<RequestDetail>();
            List<StationeryCatalogue> sList = Isc.SearchByCategory(catCode);
            List<string> iteminCat = new List<string>();

            int itemsum = 0;
            foreach (var s in sList)
            {
                iteminCat.Add(s.ItemCode);
            }

            foreach (var r in rlist)
            {
                foreach (var rdl in rdDAO.ListRequestDetail(r.RequestCode))
                {
                    foreach (string s in iteminCat)
                    {
                        if (rdl.ItemCode == s)
                        {
                            itemsum += (int)rdl.Quantity;
                            break;
                        }
                    }
                }
            }
            return itemsum;
        }
        public List<DisbursementDetail> ListAllDisbursementDetails()
        {
            return IdbmDetails.ListAllDisbursementDetails();
        }

        public List<Disbursement> ListAllDisbursement()
        {
            return Idbm.GetAllDisbursement();
        }
    }
}