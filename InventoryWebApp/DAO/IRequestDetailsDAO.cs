using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRequestDetailsDAO
    {
        List<RequestDetail> SearchOutstandingRequestDetails();
        int CancelRequestDetail(RequestDetail rd);
        
        List<RequestDetail> ListRequestDetail(string RequestCode);
        List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus);
        int UpdateRequestDetail(RequestDetail rDetail);
        int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged);
        int UpdateRequestDetailStatus(RequestDetail R, string newStatus);
        RequestDetail GetRequestDetail(string requestCode, string itemCode);
        int UpdateRequestDetail(RequestDetail rDetail);
    }
}