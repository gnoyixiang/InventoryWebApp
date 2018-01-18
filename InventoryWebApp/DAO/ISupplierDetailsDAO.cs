using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ISupplierDetailsDAO
    {
        List<SupplierDetail> GetSupplierDetailsById(string supplierCode);
        List<SupplierDetail> ListOfSupplierByItemCode(string itemcode);
        int UpdateSupplierDetails(SupplierDetail sp);
        SupplierDetail GetSupplierDetail(string supplierCode, string itemCode);
        int AddSupplierDetail(SupplierDetail sd);
    }
}