namespace InventoryWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Department")]
    public partial class Department
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Department()
        {
            Disbursements = new HashSet<Disbursement>();
            Employees = new HashSet<Employee>();
            Requests = new HashSet<Request>();
        }

        [Key]
        [StringLength(20)]
        public string DepartmentCode { get; set; }

        [StringLength(100)]
        public string DepartmentName { get; set; }

        [StringLength(20)]
        public string CollectionPointCode { get; set; }

        [StringLength(50)]
        public string Contact_Name { get; set; }

        [StringLength(50)]
        public string TelephoneNo { get; set; }

        [StringLength(50)]
        public string FaxNo { get; set; }

        [StringLength(20)]
        public string HeadCode { get; set; }

        [StringLength(20)]
        public string RepresentativeCode { get; set; }

        public virtual CollectionPoint CollectionPoint { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Disbursement> Disbursements { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employees { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Request> Requests { get; set; }
    }
}
