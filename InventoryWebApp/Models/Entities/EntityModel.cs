namespace InventoryWebApp.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EntityModel : DbContext
    {
        public EntityModel()
            : base("name=EntityModel")
        {
            Configuration.LazyLoadingEnabled = false;
        }

        static EntityModel()
        {
            Util.EnsureStaticReference<System.Data.Entity.SqlServer.SqlProviderServices>();
        }

        public virtual DbSet<Adjustment> Adjustments { get; set; }
        public virtual DbSet<AssignRole> AssignRoles { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<CollectionPoint> CollectionPoints { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Disbursement> Disbursements { get; set; }
        public virtual DbSet<DisbursementDetail> DisbursementDetails { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<PODetail> PODetails { get; set; }
        public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<RequestDetail> RequestDetails { get; set; }
        public virtual DbSet<Retrieval> Retrievals { get; set; }
        public virtual DbSet<RetrievalDetail> RetrievalDetails { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<StationeryCatalogue> StationeryCatalogues { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<SupplierDetail> SupplierDetails { get; set; }
        public virtual DbSet<Tender> Tenders { get; set; }
        public virtual DbSet<TenderDetail> TenderDetails { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserClaim> UserClaims { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Department>()
                .HasMany(e => e.Employees)
                .WithOptional(e => e.Department)
                .HasForeignKey(e => e.DepartmentCode);

            modelBuilder.Entity<Disbursement>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Disbursement)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.CollectionPoints)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.SClerkInCharge);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Departments)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.HeadCode);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Departments1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.RepresentativeCode);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Employee1)
                .WithOptional(e => e.Employee2)
                .HasForeignKey(e => e.ReportTo);

            modelBuilder.Entity<PurchaseOrder>()
                .HasMany(e => e.PODetails)
                .WithRequired(e => e.PurchaseOrder)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Request>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Request)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Request>()
                .HasMany(e => e.RequestDetails)
                .WithRequired(e => e.Request)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Retrieval>()
                .HasMany(e => e.RetrievalDetails)
                .WithRequired(e => e.Retrieval)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.AssignRoles)
                .WithOptional(e => e.Role)
                .HasForeignKey(e => e.TemporaryRoleCode);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Employees)
                .WithOptional(e => e.Role)
                .HasForeignKey(e => e.CurrentRoleCode);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Users)
                .WithMany(e => e.Roles)
                .Map(m => m.ToTable("UserRole").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.PODetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.RequestDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.RetrievalDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.SupplierDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.TenderDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.StationeryCatalogues)
                .WithOptional(e => e.Supplier)
                .HasForeignKey(e => e.Supplier1);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.StationeryCatalogues1)
                .WithOptional(e => e.Supplier4)
                .HasForeignKey(e => e.Supplier2);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.StationeryCatalogues2)
                .WithOptional(e => e.Supplier5)
                .HasForeignKey(e => e.Supplier3);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.SupplierDetails)
                .WithRequired(e => e.Supplier)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tender>()
                .HasMany(e => e.TenderDetails)
                .WithRequired(e => e.Tender)
                .WillCascadeOnDelete(false);
        }
    }
}
