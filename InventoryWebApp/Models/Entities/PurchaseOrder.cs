namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PurchaseOrder")]
    public partial class PurchaseOrder:IComparable<PurchaseOrder>
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

        [StringLength(20)]
        public string Status { get; set; }

        [StringLength(20)]
        public string SupplierCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateReceived { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(50)]
        public string ApprovedBy { get; set; }

        [StringLength(50)]
        public string ReceivedBy { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateSupplyExpected { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PODetail> PODetails { get; set; }

        public int CompareTo(PurchaseOrder other)
        {
            int thisStatusAsInt = this.Status == "PENDING" ? 0 : (this.Status == "APPROVED" ? 1 : (this.Status == "REJECTED" ? 2 : 3));
            int otherStatusAsInt = other.Status == "PENDING" ? 0 : (other.Status == "APPROVED" ? 1 : (other.Status == "REJECTED" ? 2 : 3));
            if(thisStatusAsInt < otherStatusAsInt)
            {
                return 1;
            }
            else if(thisStatusAsInt == otherStatusAsInt)
            {
                return 0;
            }
            return -1;

        }
    }
}
