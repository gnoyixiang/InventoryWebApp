namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable]
    [Table("Retrieval")]
    public partial class Retrieval
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Retrieval()
        {
            RetrievalDetails = new HashSet<RetrievalDetail>();
        }

        [Key]
        [StringLength(20)]
        public string RetrievalCode { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateRetrieved { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RetrievalDetail> RetrievalDetails { get; set; }
    }
}
