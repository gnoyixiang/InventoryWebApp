namespace InventoryWebApp.DAO
{
    public interface ISupplierDetailsDAO
    {
        int UpdateSupplierDetails(string supplierCode, string itemCode, decimal price);
    }
}