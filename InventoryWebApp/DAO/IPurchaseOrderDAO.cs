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
        List<PurchaseOrder> ListPurchaseOrderByDateApproved(DateTime dateApproved);
        List<PurchaseOrder> ListPurchaseOrderByDateApproved(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrderByDateCreated(DateTime dateCreated);
        List<PurchaseOrder> ListPurchaseOrderByDateCreated(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrderByDateLastUpdated(DateTime dateLastUpdated);
        List<PurchaseOrder> ListPurchaseOrderByDateLastUpdated(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrderByDateReceived(DateTime dateReceived);
        List<PurchaseOrder> ListPurchaseOrderByDateReceived(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrderByDateSupplyExpected(DateTime dateSupplyExpected);
        List<PurchaseOrder> ListPurchaseOrderByDateSupplyExpected(DateTime startDate, DateTime endDate);
        List<PurchaseOrder> ListPurchaseOrdersByApprovedBy(string approvedBy);
        List<PurchaseOrder> ListPurchaseOrdersByLastUpdatedBy(string updatedBy);
        List<PurchaseOrder> ListPurchaseOrdersByReceivedBy(string receivedBy);
        List<PurchaseOrder> ListPurchaseOrdersByStatus(string status);
        List<PurchaseOrder> ListPurchaseOrdersBySupplierCode(string supplierCode);
        List<PurchaseOrder> ListPurchaseOrdersByUsername(string username);
        int UpdatePurchaseOrder(PurchaseOrder purchaseOrder);
    }
}