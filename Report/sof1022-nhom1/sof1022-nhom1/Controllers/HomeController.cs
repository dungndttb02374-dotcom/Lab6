using Microsoft.AspNetCore.Mvc;
using sof1022_nhom1.Data;
using sof1022_nhom1.Models;
using System.Diagnostics;

namespace sof1022_nhom1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index(string searchString) 
        {
            var products = _context.Products.ToList();

            if (!string.IsNullOrEmpty(searchString))
            {
                products = products
                    .Where(p => p.ProductName.Contains(searchString))
                    .ToList();
            }

            return View(products);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
