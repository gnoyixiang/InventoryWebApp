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
         
        public DepartmentHeadController()
        {

        }

        public List<string> ListEmpName(string dept,string role)
        {
            return eDAO.ListEmpName(dept, role);

        }

        public List<Request> ListPendingRequest()
        {
            return rDAO.SearchRequestbyStatus("pending");
        }

        public string GetEmployeeName(string username)
        {
            return eDAO.GetEmployeeName(username);
        }

        public List<Request> SearchRequestByName(string name)
        {
            string username = eDAO.GetUserName(name);
            return rDAO.SearchPendingRequestByName(username);
        }

        public List<Request> SearchRequestByDate(DateTime d)
        {

            return rDAO.SearchPendingRequestByDate(d);
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

        public int ApproveRequest(Request r,string name)
        {
            r.Status = "processing";


            r.DateApproved = DateTime.Now;
            r.ApprovedBy = name;
           
               
                List<RequestDetail> rdlist= rdDAO.ListRequestDetail(r.RequestCode);
                
                foreach(RequestDetail rd in rdlist)
                {
                    rdDAO.UpdateRequestDetailStatus(rd, "processing");
                }

                rDAO.UpdateRequestApproval(r);
                return rDAO.UpdateRequestStatus(r);            
                      
                      
           
        }

        public int RejectRequest(Request r, string remark)
        {
            r.Status = "rejected";
            r.HeadRemarks = remark;    
            


            List<RequestDetail> rdlist = rdDAO.ListRequestDetail(r.RequestCode);

            foreach (RequestDetail rd in rdlist)
            {
                rdDAO.UpdateRequestDetailStatus(rd, "rejected");
            }

            
            return rDAO.UpdateRequestStatus(r);



        }


    }
}