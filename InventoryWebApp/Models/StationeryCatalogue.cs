using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models
{
    public class StationeryCatalogue
    {
        public StationeryCatalogue(string _itemcode, string _category, string _description, int _quantity)
        {
            this.ItemCode = _itemcode;
            this.Category = _category;
            this.Description = _description;
            this.Quantity = _quantity;
        }
        public string ItemCode { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
    }
}