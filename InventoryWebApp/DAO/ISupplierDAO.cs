using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ISupplierDAO
    {
        int AddSupplier(Supplier supplier, string itemCode, decimal price);
        int UpdateSupplier(Supplier supplier);
    }
}