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
        }

        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<SupplierDetail> SupplierDetails { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<PODetail> PODetails { get; set; }
        public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }
        public virtual DbSet<StationeryCatalogue> StationeryCatalogues { get; set; }
        public virtual DbSet<Tender> Tenders { get; set; }
        public virtual DbSet<TenderDetail> TenderDetails { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.SupplierDetails)
                .WithRequired(e => e.Supplier)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PurchaseOrder>()
                .HasMany(e => e.PODetails)
                .WithRequired(e => e.PurchaseOrder)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.PODetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StationeryCatalogue>()
                .HasMany(e => e.TenderDetails)
                .WithRequired(e => e.StationeryCatalogue)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tender>()
                .HasMany(e => e.TenderDetails)
                .WithRequired(e => e.Tender)
                .WillCascadeOnDelete(false);
        }
    }
}
