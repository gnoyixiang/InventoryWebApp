namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TenderDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string TenderCode { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public decimal? Price { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }

        public virtual Tender Tender { get; set; }
    }
}
