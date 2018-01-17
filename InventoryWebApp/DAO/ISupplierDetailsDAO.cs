using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ISupplierDetailsDAO
    {
        SupplierDetail GetSupplierDetailsById(string supplierCode);
        List<SupplierDetail> ListOfSupplierByItemCode(string itemcode);
        int UpdateSupplierDetails(SupplierDetail sp);
    }
}