using System.ComponentModel.DataAnnotations;
namespace sof1022_nhom1.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }

        public string? ProductName { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }

        public string? ImageUrl { get; set; }

        public string? Description { get; set; }
    }
}