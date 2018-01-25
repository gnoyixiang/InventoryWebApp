namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PurchaseOrder")]
    public partial class PurchaseOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PurchaseOrder()
        {
            PODetails = new HashSet<PODetail>();
        }

        [Key]
        [StringLength(20)]
        public string PurchaseOrderCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateCreated { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateApproved { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(20)]
        public string SupplierCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateReceived { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateSupplyExpected { get; set; }

        [StringLength(200)]
        public string HeadRemarks { get; set; }

        [StringLength(256)]
        public string ApprovedBy { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        [StringLength(256)]
        public string ReceivedBy { get; set; }

        [StringLength(256)]
        public string LastUpdatedBy { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateLastUpdated { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PODetail> PODetails { get; set; }

        public virtual Supplier Supplier { get; set; }
    }
}
