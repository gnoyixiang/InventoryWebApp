namespace InventoryWebApp
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PODetail")]
    public partial class PODetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public decimal? Price { get; set; }

        public int? Quantity { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string PurchaseOrderCode { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public virtual PurchaseOrder PurchaseOrder { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }
    }
}
