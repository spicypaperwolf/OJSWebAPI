//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineJewelryShopping
{
    using System;
    using System.Collections.Generic;
    
    public partial class CartList
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CartList()
        {
            this.InquiryMsts = new HashSet<InquiryMst>();
        }
    
        public string cartId { get; set; }
        public string userId { get; set; }
        public string guestId { get; set; }
        public string itemCode { get; set; }
        public int qty { get; set; }
    
        public virtual GuestMst GuestMst { get; set; }
        public virtual UserRegMst UserRegMst { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InquiryMst> InquiryMsts { get; set; }
    }
}
