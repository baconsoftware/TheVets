using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TheVetsWebsite.Dtos;
using TheVetsWebsite.Models;

namespace TheVetsWebsite.Controllers.Api
{
    public class BreedSearchResultsController : ApiController
    {

        private ApplicationDbContext _context;

        public BreedSearchResultsController()
        {
            _context = new ApplicationDbContext();
        }
        // GET /api/BreedSearch
        public IEnumerable<AnimalDto> GetAnimals()
        {
            return _context.Animals.ToList().Select(Mapper.Map<Animal, AnimalDto>);
        }

        // GET /api/breedsearch/1
        public AnimalDto GetAnimal(int id)
        {
            var animal = _context.Animals.SingleOrDefault(a => a.id == id);

            if (animal == null)
                throw new HttpResponseException(HttpStatusCode.NotFound);

            return Mapper.Map<Animal, AnimalDto>(animal);
        }
    }
}
