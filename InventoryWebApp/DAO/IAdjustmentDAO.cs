using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IAdjustmentDAO
    {
        int AddAdjustment(Adjustment b);
        List<Adjustment> ListAllAdjustments();
        List<Adjustment> SearchAdjustmentByStatus(string b);
        int UpdateAdjustment(string b, int d, string e);
        int UpdateAdjustmentByStoreSupervisor(Adjustment adjustment);

        Adjustment GetAdjustmentByAdjustmentCode(string adjustmentCode);
    }
}