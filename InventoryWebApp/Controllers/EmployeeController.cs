using InventoryWebApp.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Web.SessionState;

namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        private static IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        private static IRequestDAO rDAO = new RequestDAO();
        private static IRequestDetailsDAO rdDAO = new RequestDetailsDAO();
        private static IDisbursementDAO dDAO = new DisbursementDAO();
        private static IDisbursementDetailsDAO ddDAO = new DisbursementDetailsDAO();
        static DateTime now = DateTime.Now;
        //list catalogue to gridview
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
        public Request GetRequestbyRequestCode(string requestCode)
        {
            return rDAO.GetRequest(requestCode);
        }
        //add Request with requestDetail
        public static int AddRequest(Request R)
        {
            int a = -1;
            a = rDAO.AddRequest(R);
            return a;
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
            if (R.ApprovedBy != null)
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



    }


}