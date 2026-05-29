using Microsoft.EntityFrameworkCore;
using sof1022_nhom1.Models;

namespace sof1022_nhom1.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext
            (DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {

        }

        public DbSet<Product> Products { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Supplier> Suppliers { get; set; }

        public DbSet<Users> Users { get; set; }

        public DbSet<Orders> Orders { get; set; }

        public DbSet<OrderDetail> OrderDetails { get; set; }

        public DbSet<Warehouse> Warehouses { get; set; }
    }
}