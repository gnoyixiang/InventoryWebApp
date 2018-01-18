using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Models.Classes
{
    [Serializable]
    public class PurchaseItem
    {
        public StationeryCatalogue Stationery { get; set; }

        public string SupplierCode { get; set; }

        public int? OrderQuantity { get; set; }
    }
}