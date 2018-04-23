using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using TheVetsWebsite.Dtos;
using TheVetsWebsite.Models;

namespace TheVetsWebsite.App_Start
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            Mapper.CreateMap<Animal, AnimalDto>();
            Mapper.CreateMap<AnimalDto, Animal>();
        }
    }
}