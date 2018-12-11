using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models.RecipesModel
{
    public class Recipes
    {
        public int recipeId { get; set; }
        public string description { get; set; }
        public  string name{ get; set; }
        public  string instructions { get; set; }
        //in minutes
        public int cookTime { get; set; }
        public int prepTime { get; set; }
        public string recipeType { get; set; }
        public bool gluten { get; set; }
        public bool vegetarian { get; set; }
        public bool dairy { get; set; }
        public bool nuts { get; set; }
        public bool vegan { get; set; }
        public int servings { get; set; }
        public int caloriesPerServing { get; set; }
        public double fat { get; set; }
        public double carbohydrates { get; set; }
        public double protein { get; set; }
        public double fiber { get; set; }
        public double cholesterol { get; set; }
        public double sodium { get; set; }

    }
}
