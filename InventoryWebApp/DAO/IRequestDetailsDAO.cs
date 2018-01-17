using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IRequestDetailsDAO
    {
        List<RequestDetail> ListRequestDetail(string RequestCode);
        List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus);
        int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged);
        int UpdateRequestDetailStatus(RequestDetail R, string newStatus);
        int CancelRequestDetail(RequestDetail rd);
        RequestDetail GetRequestDetail(string RequestC, string itemCode);
        int UpdateRequestDetail(RequestDetail rDetail);
    }
}