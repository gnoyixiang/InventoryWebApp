namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Role")]
    public partial class Role
    {
        [Key]
        [StringLength(20)]
        public string RoleCode { get; set; }

        [StringLength(100)]
        public string RoleName { get; set; }
    }
}
