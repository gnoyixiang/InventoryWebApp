using InventoryWebApp.DAO;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        IRequestDAO Ir = new RequestDAO();
        IRequestDetailsDAO Ird = new RequestDetailsDAO();
        ICollectionPointDAO Icp = new CollectionPointDAO();
        IDepartmentDAO Idpt = new DepartmentDAO();
        IDisbursementDAO Idbm = new DisbursementDAO();
        IEmployeeDAO Iempl = new EmployeeDAO();
        IDisbursementDetailsDAO IdbmDetails = new DisbursementDetailsDAO();
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
                {
                    ItemCode = stationary.ItemCode,
                    Quantity = stationary.Quantity,
                    RemainingQuant = stationary.Quantity,
                    Notes = "" });
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
        public List<Disbursement> ListAllDisbursement()
        {
            return Idbm.ListAllDisbursement();
        }
        public List<DisbursementDetail> DisbursementDetails(string disbrusementCode)
        {
            return IdbmDetails.GetDisbursementDetails(disbrusementCode);
        }
        public int UpdateDisbursement(Disbursement d)
        {
            return Idbm.UpdateDbmStatus(d);
        }
        public Disbursement GetDisbursementCode(string disbursementCode)
        {
            return Idbm.GetDisbursementByCode(disbursementCode);
        }
        public int UpdateRequestDetails(RequestDetail reDetails)
        {
            return Ird.UpdateRequestDetail(reDetails);
        }
        public int UpdateRequestStatus(Request rq, string status)
        {
            return Ir.UpdateRequestStatus(rq, status);
        }
        public int UpdateRequest(Request rq)
        {
            return Ir.UpdateRequest(rq);
        }
        public List<RequestDetail> ListRequestDetail(string requestCode)
        {
            return Ird.ListRequestDetail(requestCode);
        }
    }
}
