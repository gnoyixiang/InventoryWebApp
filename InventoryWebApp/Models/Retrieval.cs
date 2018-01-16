namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Retrieval")]
    public partial class Retrieval
    {
        [Key]
        [StringLength(20)]
        public string RetrievalCode { get; set; }

        [StringLength(20)]
        public string ItemCode { get; set; }

        public int? Quantity { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }
    }
}
