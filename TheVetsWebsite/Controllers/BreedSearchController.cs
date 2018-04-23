using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheVetsWebsite.Models;

namespace TheVetsWebsite.Controllers
{
    public class BreedSearchController : Controller
    {
        private ApplicationDbContext _context;

        public BreedSearchController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }


        public ActionResult Index()
        {
            return View();
        }

        // GET: BreedSearch
        public ViewResult AllAnimals()
        {
            var animals = _context.Animals;

            return View(animals);
        }
    }
}