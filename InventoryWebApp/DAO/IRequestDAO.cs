using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;


namespace InventoryWebApp.DAO
{
    public interface IRequestDAO
    {
        int AddRequest(Request newR);
        Request GetRequest(string ROCode);
        List<Request> ListAllRequest();
        List<Request> SearchRequestbyDate(DateTime RequestDate);
        List<Request> SearchRequestbyID(string RequestC);
        
        int UpdateRequestApproval(Request r);
        int UpdateRequestStatus(Request r);
        List<Request> SearchPendingRequestByName(string username,string deptcode);
        List<Request> SearchPendingRequestByDate(DateTime d,string deptcode);
        List<Request> SearchRequestbyStatus(string RequestStatus,string deptcode);
        List<Request> SearchRequestbyDept(string dept);
        List<Request> SearchRequestbyStatus(string RequestStatus);
        int UpdateRequest(Request r);
        int UpdateRequestApproval(Request R, string ApprovedN);
        int UpdateRequestStatus(Request R, string newStatus);
        List<Request> SearchRequestByDeptCode(string deptCode);
    }
}