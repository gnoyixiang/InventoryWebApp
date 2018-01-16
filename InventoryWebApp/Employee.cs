namespace InventoryWebApp
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Employee")]
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            AssignRoles = new HashSet<AssignRole>();
            CollectionPoints = new HashSet<CollectionPoint>();
            Departments = new HashSet<Department>();
            Departments1 = new HashSet<Department>();
            Employee1 = new HashSet<Employee>();
        }

        [Key]
        [StringLength(20)]
        public string EmployeeCode { get; set; }

        [StringLength(20)]
        public string ReportTo { get; set; }

        [StringLength(20)]
        public string DepartmentCode { get; set; }

        [StringLength(128)]
        public string CurrentRoleCode { get; set; }

        [StringLength(100)]
        public string EmployeeName { get; set; }

        [StringLength(10)]
        public string EmployeeTitle { get; set; }

        [StringLength(128)]
        public string UserId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AssignRole> AssignRoles { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CollectionPoint> CollectionPoints { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Department> Departments { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Department> Departments1 { get; set; }

        public virtual Department Department { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employee1 { get; set; }

        public virtual Employee Employee2 { get; set; }

        public virtual Role Role { get; set; }

        public virtual User User { get; set; }
    }
}
