using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IPurchaseOrderDAO
    {
        int AddPurchaseOrder(PurchaseOrder purchaseOrder);
        PurchaseOrder GetPurchaseOrder(string purchaseOrderCode);
        List<PurchaseOrder> ListAllPurchaseOrders();
        List<PurchaseOrder> ListPurchaseOrdersByPOCode(string poCode);
        List<PurchaseOrder> ListPurchaseOrdersByApprovedBy(string approvedBy);
        List<PurchaseOrder> ListPurchaseOrdersByDateApproved(DateTime dateApproved);
        List<PurchaseOrder> ListPurchaseOrdersByDateApproved(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime dateCreated);
        List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByDateLastUpdated(DateTime dateLastUpdated);
        List<PurchaseOrder> ListPurchaseOrdersByDateLastUpdated(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByDateReceived(DateTime dateReceived);
        List<PurchaseOrder> ListPurchaseOrdersByDateReceived(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByDateSupplyExpected(DateTime dateSupplyExpected);
        List<PurchaseOrder> ListPurchaseOrdersByDateSupplyExpected(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByLastUpdatedBy(string updatedBy);
        List<PurchaseOrder> ListPurchaseOrdersByReceivedBy(string receivedBy);
        List<PurchaseOrder> ListPurchaseOrdersByStatus(string status);
        List<PurchaseOrder> ListPurchaseOrdersBySupplierCode(string supplierCode);
        List<PurchaseOrder> ListPurchaseOrdersByUsername(string username);
        int UpdatePurchaseOrder(PurchaseOrder purchaseOrder);
    }
}