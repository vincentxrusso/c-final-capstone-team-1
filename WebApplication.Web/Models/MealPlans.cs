using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class MealPlans
    {
        public int MealPlanId { get; set; }
        public List<int> RecipeId { get; set; }
        public List<Recipes> RecipesList { get; set; }
        public string MealPlanName { get; set; }
        public string MealPlanImage { get; set; }
        public int RecipeCount { get; set; }

        public IList<Recipes> Recipes { get; set; }
    }
    
}