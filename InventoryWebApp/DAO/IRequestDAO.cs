using System.Collections.Generic;

namespace InventoryWebApp.DAO
{
    public interface IRequestDAO
    {
        int AddRequest(Request newR);
        Request GetRequest(string ROCode);
        List<Request> ListAllRequest();
        List<Request> SearchRequestbyDate(string RequestDate);
        List<Request> SearchRequestbyID(string RequestC);
        List<Request> SearchRequestbyStatus(string RequestStatus);
        int UpdateRequestApproval(Request R, string ApprovedN);
        int UpdateRequestStatus(Request R, string newStatus);
        int UpdateRequest(Request r);
    }
}