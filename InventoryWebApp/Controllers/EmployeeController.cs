using InventoryWebApp.DAO;
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
        public List<StationeryCatalogue> gridview()
        {
            List<StationeryCatalogue> list = Isc.ListAllStationery();
            return list;
        }
        public List<StationeryCatalogue> searchByDescription(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByDescription(keyword);
            return list;
        }
        public List<StationeryCatalogue> searchByCategoryCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByCategory(keyword);
            return list;
        }
        public List<StationeryCatalogue> searchByItemCode(string keyword)
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
        //public void AddRequest(string requestCode, string departmentCode, DateTime dateCreate, string status)
        //{
        //        Request request = new Request()
        //        {
        //            RequestCode = requestCode,
        //            DepartmentCode = departmentCode,
        //            DateCreated = dateCreate,
        //            Status = status,
        //        };
        //        Ir.AddRequest(request);
        //}
        public int AddRequest(Request r)
        {
            int a = Ir.AddRequest(r);
            return a;
        }
    }
}