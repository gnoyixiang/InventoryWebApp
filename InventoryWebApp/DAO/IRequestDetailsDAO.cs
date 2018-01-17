﻿using InventoryWebApp.Models;
using System.Collections.Generic;

namespace InventoryWebApp.DAO
{
    public interface IRequestDetailsDAO
    {
        List<RequestDetail> ListRequestDetail(string RequestCode);
        List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus);
        int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged);
        int UpdateRequestDetailStatus(RequestDetail R, string newStatus);
    }
}