using System.ComponentModel.DataAnnotations;

namespace sof1022_nhom1.Models
{
    public class Orders
    {
        [Key]
        public int OrderId { get; set; }

        public int UserId { get; set; }

        public DateTime OrderDate { get; set; }

        public decimal TotalMoney { get; set; }

        public string? Status { get; set; }
    }
}