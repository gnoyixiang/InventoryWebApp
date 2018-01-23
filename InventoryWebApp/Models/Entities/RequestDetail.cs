namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable]
    [Table("RequestDetail")]
    public partial class RequestDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string RequestCode { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int? RemainingQuant { get; set; }

        public int? Quantity { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public virtual Request Request { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }
    }
}
