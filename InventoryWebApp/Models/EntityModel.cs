namespace InventoryWebApp.Models
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
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<CollectionPoint> CollectionPoints { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Disbursement> Disbursements { get; set; }
        public virtual DbSet<DisbursementDetail> DisbursementDetails { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<RequestDetail> RequestDetails { get; set; }
        public virtual DbSet<Retrieval> Retrievals { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<StationeryCatalogue> StationeryCatalogues { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Disbursement>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Disbursement)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Request>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Request)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Request>()
                .HasMany(e => e.RequestDetails)
                .WithRequired(e => e.Request)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.RequestDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);
        }
    }
}
