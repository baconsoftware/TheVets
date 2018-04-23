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
        // GET: BreedSearch
        public ViewResult index()
        {
            var animals = new List<Animal>
            {
                new Animal {breed = "Boston Terrier"},
                new Animal {breed = "Labrador"},
                new Animal {breed = "Jack Russel"}
            };
            return View(animals);
        }
    }
}