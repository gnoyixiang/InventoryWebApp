﻿using System.Collections.Generic;
using InventoryWebApp.Models.Entities;
using System;

namespace InventoryWebApp.DAO
{
    public interface IDisbursementDetailsDAO
    {
        List<DisbursementDetail> SearchDDByItem(StationeryCatalogue item);
        List<DisbursementDetail> SearchDDByRequest(Request request);
        List<DisbursementDetail> SearchDDByDCode(string disbursementCode);
        int UpdateDisbursementDetail(DisbursementDetail ddUpdate);

        List<DisbursementDetail> ListDDByItemCode(string ItemCode,DateTime start);
    }
}