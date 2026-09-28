using Microsoft.AspNetCore.Mvc;
using Razor1.Data;
using Razor1.Models;

namespace Razor1.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _context;

        // Tiêm phụ thuộc (Dependency Injection) ApplicationDbContext
        public ProductController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: /Product/ hoặc /Product/Index
        public IActionResult Index()
        {
            // Lấy danh sách sản phẩm trực tiếp từ cơ sở dữ liệu SQL Server (không dùng dữ liệu hardcode)
            List<Product> products = _context.Products.ToList();

            // Truyền danh sách sản phẩm sang View
            return View(products);
        }
    }
}
