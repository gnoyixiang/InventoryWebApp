using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

        public DepartmentHeadController()
        {

        }

        public List<string> ListEmpName(string dept,string role)
        {
            return eDAO.ListEmpName(dept, role);

        }

        public List<Request> ListPendingRequest()
        {
            return rDAO.SearchRequestbyStatus("pending","ISS1");
        }

       

        public List<Request> ListAllRequest()
        {
            return rDAO.SearchRequestbyDept("ISS1");
        }

        public List<Request> SearchRequestByName(string name)
        {
            string username = eDAO.GetUserName(name);
            return rDAO.SearchPendingRequestByName(username,"ISS1");
        }

        public List<Request> SearchRequestByDate(DateTime d)
        {

            return rDAO.SearchPendingRequestByDate(d,"ISS1");
        }

        public List<Request> SearchRequestByStatus(string status)
        {

            return rDAO.SearchRequestbyStatus(status,"ISS1");
        }



        public Request GetRequest(string code)
        {
            return rDAO.GetRequest(code);
        }

        public List<RequestDetail> ListRequestDetail(string code)
        {
            return rdDAO.ListRequestDetail(code);
        }

        public StationeryCatalogue GetStationeryCatalogue(string code)
        {
            return scDAO.GetStationery(code);
        }

        

        public string GetEmployeeName(string username)
        {
            return eDAO.GetEmployeeName(username);
        }
        

        public int UpdateRequest(Request r,string status)
        {                               
               
                List<RequestDetail> rdlist= rdDAO.ListRequestDetail(r.RequestCode);
                
                foreach(RequestDetail rd in rdlist)
                {
                    rdDAO.UpdateRequestDetailStatus(rd, status);
                }

                rDAO.UpdateRequestApproval(r);
                return rDAO.UpdateRequestStatus(r);          
                   
                    
           
        }

       public List<DisbursementDetail> ListDisbursementDetail(Request r)
        {
            return ddDAO.SearchDDByRequest(r);
        }

        public Disbursement GetDisbursement(string code)
        {
            return dDAO.GetDisbursementByCode(code);
        }

        public List<DisbursementDetail> ListDisbursementDetailByCode(string code)
        {
            return ddDAO.SearchDDByCode(code);
        }

    }
}