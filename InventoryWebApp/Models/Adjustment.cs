namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Adjustment")]
    public partial class Adjustment
    {
        [Key]
        [StringLength(20)]
        public string AdjustmentCode { get; set; }

        [StringLength(20)]
        public string ItemCode { get; set; }

        public int? QuantOnHand { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateCreated { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateApproved { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(200)]
        public string Reason { get; set; }

        [StringLength(50)]
        public string ApprovedBy { get; set; }

        [StringLength(200)]
        public string HeadRemarks { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }
    }
}
