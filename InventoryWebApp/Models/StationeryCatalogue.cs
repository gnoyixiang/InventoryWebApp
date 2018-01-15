namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StationeryCatalogue")]
    public partial class StationeryCatalogue
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StationeryCatalogue()
        {
            DisbursementDetails = new HashSet<DisbursementDetail>();
            RequestDetails = new HashSet<RequestDetail>();
            Retrievals = new HashSet<Retrieval>();
        }

        [Key]
        [StringLength(20)]
        public string ItemCode { get; set; }

        [StringLength(20)]
        public string CategoryCode { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? ReorderLevel { get; set; }

        public int? ReorderQuantity { get; set; }

        [StringLength(10)]
        public string MeasureUnit { get; set; }

        public decimal? Price { get; set; }

        public int? Stock { get; set; }

        [StringLength(20)]
        public string Supplier1 { get; set; }

        [StringLength(20)]
        public string Supplier2 { get; set; }

        [StringLength(20)]
        public string Supplier3 { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisbursementDetail> DisbursementDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequestDetail> RequestDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Retrieval> Retrievals { get; set; }
    }
}
