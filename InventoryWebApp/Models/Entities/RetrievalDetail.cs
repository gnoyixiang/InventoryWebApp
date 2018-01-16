namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RetrievalDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public int? Quantity { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string RetrievalCode { get; set; }

        public virtual Retrieval Retrieval { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }
    }
}
