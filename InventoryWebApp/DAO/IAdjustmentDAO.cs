using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IAdjustmentDAO
    {
        List<Adjustment> ListAllAdjustments();
        List<Adjustment> SearchAdjustmentByStatus(string b);
        int AddAdjustment(Adjustment b);
        int UpdateAdjustment(string b, int d, string e);
        int UpdateAdjustment(Adjustment c);
        int ApproveAdjustment(string adjustmentCode);
        int RejectAdjustment(string adjustmentCode, string headRemarks);
        Adjustment GetAdjustment(string adjustmentCode);
        string GetLastAdjustment();
    }
}