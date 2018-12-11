using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class Ingredients
    {
        public int IngredientId { get; set; }
        public string IngredientName { get; set; }
        public string IngredientImage { get; set; }
    }
}