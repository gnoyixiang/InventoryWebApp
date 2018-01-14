//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InventoryWebApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tender
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tender()
        {
            this.TenderDetails = new HashSet<TenderDetail>();
        }
    
        public string TenderCode { get; set; }
        public string SupplierCode { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string Username { get; set; }
    
        public virtual Supplier Supplier { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TenderDetail> TenderDetails { get; set; }
    }
}
