using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IDisbursementDetailsDAO
    {
        List<DisbursementDetail> SearchDDByItem(StationeryCatalogue item);
        List<DisbursementDetail> SearchDDByRequest(Request request);

        List<DisbursementDetail> ListDDByItemCode(string ItemCode);
    }
}