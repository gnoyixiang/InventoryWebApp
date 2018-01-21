namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AssignRole")]
    public partial class AssignRole
    {
        [Key]
        public int AssignRoleCode { get; set; }

        [StringLength(128)]
        public string TemporaryRoleCode { get; set; }

        [StringLength(20)]
        public string EmployeeCode { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndDate { get; set; }

        [StringLength(256)]
        public string AssignedBy { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Role Role { get; set; }
    }
}
