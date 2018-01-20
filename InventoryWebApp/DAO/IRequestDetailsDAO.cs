using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRequestDetailsDAO
    {
        List<RequestDetail> SearchOutstandingRequestDetails();
        List<RequestDetail> ListRequestDetail(string RequestCode);
        List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus);
        int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged);
        int UpdateRequestDetailStatus(RequestDetail R, string newStatus);
    }
}