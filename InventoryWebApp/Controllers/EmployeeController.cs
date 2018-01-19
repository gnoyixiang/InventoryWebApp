using InventoryWebApp.DAO;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
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
            string requestCode = "RQ" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
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
        }
    }
}
