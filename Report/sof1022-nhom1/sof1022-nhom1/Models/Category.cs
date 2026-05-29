
using System.ComponentModel.DataAnnotations;

namespace sof1022_nhom1.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        public string Description { get; set; }
    }
}