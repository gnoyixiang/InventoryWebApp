namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SupplierDetail")]
    public partial class SupplierDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string SupplierCode { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public decimal? Price { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }

        public virtual Supplier Supplier { get; set; }
    }
}
