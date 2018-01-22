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
        public string GetDeptCodeByName( string deptName)
        {
            return Idpt.GetDepartCodeByName(deptName);
        }
        public void GetUserInfo(string userName)
        {
            userName = HttpContext.Current.Session.SessionID;
            string deptName = Idpt.GetDepartCode(userName);
            
            //var user = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserId());

            //var userDepartment = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserName());
        }
    }
}
