using System.Collections.Generic;
using InventoryWebApp.Models.Entities;
using System;

namespace InventoryWebApp.DAO
{
    public interface IAdjustmentDAO
    {
        int AddAdjustment(Adjustment b);
        List<Adjustment> ListAllAdjustments();
        List<Adjustment> SearchAdjustmentByStatus(string b);
        int UpdateAdjustment(string b, int d, string e);
        List<Adjustment> ListAllAdjustmentsByItemCode(string itemCode,DateTime start);
        int UpdateAdjustmentByStoreSupervisor(Adjustment adjustment);
        Adjustment GetAdjustmentByAdjustmentCode(string adjustmentCode);
    }
}