using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
namespace InventoryWebApp.Controllers
{
    public class DepartmentHeadController
    {
        IEmployeeDAO eDAO = new EmployeeDAO();
        IRequestDAO rDAO = new RequestDAO();
        IRequestDetailsDAO rdDAO = new RequestDetailsDAO();
        IStationeryCatalogueDAO scDAO = new StationeryCatalogueDAO();
        IDisbursementDetailsDAO ddDAO = new DisbursementDetailsDAO();
        IDisbursementDAO dDAO = new DisbursementDAO();

        public List<Request> ListPendingRequest(string code)
        {
            return rDAO.SearchRequestbyStatus("pending", code);
        }
        public string GetEmployeeName(string username)
        {
            return eDAO.GetEmployeeName(username);
        }
        public List<RequestDetail> ListRequestDetail(string code)
        {
            return rdDAO.ListRequestDetail(code);
        }
        public StationeryCatalogue GetStationeryCatalogue(string code)
        {
            return scDAO.GetStationery(code);
        }
        public int UpdateRequest(Request r, string status)
        {
            int result = 0;
            List<RequestDetail> rdlist = rdDAO.ListRequestDetail(r.RequestCode);

            foreach (RequestDetail rd in rdlist)
            {
               // if (rd.RequestCode.Equals(r.RequestCode))
                //{
                    result = rdDAO.UpdateRequestDetailStatus(rd, status);
                //}
            }
            
            
                rDAO.UpdateRequestApproval(r);
                rDAO.UpdateRequestStatus(r);
                
            
            return result;



        }
    }
}