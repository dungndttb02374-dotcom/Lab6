using System.ComponentModel.DataAnnotations;

namespace sof1022_nhom1.Models
{
    public class Warehouse
    {
        [Key]
        public int WarehouseId { get; set; }

        public int ProductId { get; set; }

        public int ImportQuantity { get; set; }

        public int ExportQuantity { get; set; }

        public DateTime LastUpdate { get; set; }
    }
}