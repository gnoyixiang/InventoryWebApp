namespace InventoryWebApp.Models.Entities
{
    using DAO;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RetrievalDetail:IComparable<RetrievalDetail>
    {
        IStationeryCatalogueDAO scDAO = new StationeryCatalogueDAO();

        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string ItemCode { get; set; }

        public int? QuantityRetrieved { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string RetrievalCode { get; set; }

        public int? QuantityNeeded { get; set; }

        public virtual Retrieval Retrieval { get; set; }

        public virtual StationeryCatalogue StationeryCatalogue { get; set; }

        public int CompareTo(RetrievalDetail other)
        {
            return this.ItemCode.CompareTo(other.ItemCode);
        }
    }
}
