using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ISupplierDAO
    {
        int AddOrUpdateSupplier(Supplier supplier);
        Supplier GetSupplier(string supplierCode);
        List<Supplier> ListOfSupplier();
        string GetSupplierCodeBySupplierName(string supplierName);
    }
}