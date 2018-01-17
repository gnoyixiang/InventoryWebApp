namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tender")]
    public partial class Tender
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tender()
        {
            TenderDetails = new HashSet<TenderDetail>();
        }

        [Key]
        [StringLength(20)]
        public string TenderCode { get; set; }

        [StringLength(20)]
        public string SupplierCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateCreated { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        public virtual Supplier Supplier { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TenderDetail> TenderDetails { get; set; }
    }
}
