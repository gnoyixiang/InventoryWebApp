namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DisbursementDetail")]
    public partial class DisbursementDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string DisbursementCode { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string RequestCode { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public decimal? Price { get; set; }

        public int? ActualQuantity { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public int? ActualQuantity { get; set; }

        public virtual Disbursement Disbursement { get; set; }

        public virtual Request Request { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }
    }
}
