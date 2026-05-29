using System.ComponentModel.DataAnnotations;

namespace sof1022_nhom1.Models
{
    public class Supplier
    {
        [Key]
        public int SupplierId { get; set; }

        public string SupplierName { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }
    }
}