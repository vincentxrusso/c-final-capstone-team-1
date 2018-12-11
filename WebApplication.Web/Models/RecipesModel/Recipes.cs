﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models.RecipesModel
{
    public class Recipes
    {
        public int RecipeId { get; set; }
        public string Description { get; set; }
        public  string Name{ get; set; }
        public  string Instructions { get; set; }
        //in minutes
        public int CookTime { get; set; }
        public int PrepTime { get; set; }
        public string RecipeType { get; set; }
        public bool Gluten { get; set; }
        public bool Vegetarian { get; set; }
        public bool Dairy { get; set; }
        public bool Nuts { get; set; }
        public bool Vegan { get; set; }
        public int Servings { get; set; }
        public int CaloriesPerServing { get; set; }
        public double Fat { get; set; }
        public double Carbohydrates { get; set; }
        public double Protein { get; set; }
        public double Fiber { get; set; }
        public double Cholesterol { get; set; }
        public double Sodium { get; set; }

    }
}
