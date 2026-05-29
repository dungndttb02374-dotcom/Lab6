using Microsoft.AspNetCore.Mvc;
using sof1022_nhom1.Data;
using sof1022_nhom1.Models;
using System.Linq;

namespace sof1022_nhom1.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Register
        public IActionResult Register()
        {
            return View();
        }

        // POST: Register
        [HttpPost]
        public IActionResult Register(Users user)
        {
            user.Role = "User";

            _context.Users.Add(user);

            _context.SaveChanges();

            return RedirectToAction("Login");
        }

        // GET: Login
        public IActionResult Login()
        {
            return View();
        }

        // POST: Login
        [HttpPost]
        public IActionResult Login(string username, string password)
        {
            var user = _context.Users
                .FirstOrDefault(x =>
                    x.UserName == username &&
                    x.Password == password);

            if (user != null)
            {
                HttpContext.Session.SetString("Username", user.UserName);

                HttpContext.Session.SetString("Role", user.Role);

                // ADMIN
                if (user.Role == "Admin")
                {
                    return RedirectToAction("Index", "Admin");
                }

                // USER
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }

            ViewBag.Error = "Sai tài khoản";

            return View();
        }

        // Logout
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();

            return RedirectToAction("Index", "Home");
        }
    }
}