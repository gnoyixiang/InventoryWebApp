using System.Collections.Generic;
using InventoryWebApp.Models.Entities;
using System;

namespace InventoryWebApp.DAO
{
    public interface IDisbursementDetailsDAO
    {
        List<DisbursementDetail> SearchDDByItem(StationeryCatalogue item);
        List<DisbursementDetail> SearchDDByRequest(Request request);

        List<DisbursementDetail> ListDDByItemCode(string ItemCode,DateTime start);
        List<DisbursementDetail> GetDisbursementDetails(string disbursementCode);
        DisbursementDetail GetDisbursementDetail(String disbursementCode, String requestCode, String itemCode);
        List<DisbursementDetail> SearchDDByDCode(String disbursementCode);
        int UpdateDisbursementDetail(DisbursementDetail ddUpdate);
    }
}