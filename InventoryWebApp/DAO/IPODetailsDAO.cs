using System.Collections.Generic;
using InventoryWebApp.Models.Entities;
using System;

namespace InventoryWebApp.DAO
{
    public interface IPODetailsDAO
    {
        PODetail GetPODetail(string purchaseOrderCode, string itemCode);
        List<PODetail> ListAllPODetails();
        List<PODetail> ListPODetailsByItemCode(string itemCode);

        List<PODetail> ListPODetailByItemCodeAndDate(string itemCode,DateTime start);
        List<PODetail> ListPODetailsByPOCode(string purchaseOrderCode);
        int UpdatePODetail(PODetail poDetail);
        List<PODetail> ListAllPODetailsByPOCode(string purchaseOrderCode);
    }
}