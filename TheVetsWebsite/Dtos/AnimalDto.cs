using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;


namespace TheVetsWebsite.Dtos
{
    public class AnimalDto
    {
        public int id { get; set; }
        [DisplayName("Animal Type")]
        public string animaltype { get; set; }
        [DisplayName("Breed")]
        public string breed { get; set; }
        [DisplayName("Min Size (ft)")]
        public float minsize { get; set; }
        [DisplayName("Max Size (ft)")]
        public float maxsize { get; set; }
        [DisplayName("Min Weight (lb)")]
        public float minweight { get; set; }
        [DisplayName("Max Weight (lb)")]
        public float maxweight { get; set; }
        [DisplayName("Energy Level")]
        public int energylevel { get; set; }
        [DisplayName("Temperament")]
        public string temperament { get; set; }
        [DisplayName("Trainability")]
        public int trainability { get; set; }
        [DisplayName("Life Span")]
        public int lifespan { get; set; }
        [DisplayName("Good With Kids?")]
        public bool goodwithkids { get; set; }
        [DisplayName("Good With Other Animals?")]
        public bool goodwithotheranimals { get; set; }
    }
}