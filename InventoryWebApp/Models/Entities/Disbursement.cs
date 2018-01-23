namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Disbursement")]
    public partial class Disbursement : IComparable<Disbursement>
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Disbursement()
        {
            DisbursementDetails = new HashSet<DisbursementDetail>();
        }

        [Key]
        [StringLength(20)]
        public string DisbursementCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateCreated { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        [StringLength(20)]
        public string DepartmentCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateDisbursed { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        [StringLength(256)]
        public string ReceivedBy { get; set; }
        [Column(TypeName = "date")]
        public DateTime? DatePlanToCollect { get; set; }

        [StringLength(20)]
        public string CollectionPointCode { get; set; }
        public virtual CollectionPoint CollectionPoint { get; set; }

       

        public virtual Department Department { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisbursementDetail> DisbursementDetails { get; set; }
        public int CompareTo(Disbursement other)
        {
            return this.CollectionPointCode.CompareTo(other.CollectionPointCode);
        }
    }
}
