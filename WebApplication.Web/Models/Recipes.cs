﻿using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class Recipes
    {
        public int RecipeId { get; set; }
       
        public string RecipeDescription { get; set; }
        public string RecipeName{ get; set; }
        public string Instructions { get; set; }

        //in minutes
        public int CookTime { get; set; }

        public int PrepTime { get; set; }
        public string RecipeType { get; set; }
        public bool GlutenFree { get; set; }
        public bool VegetarianFriendly { get; set; }
        public bool DairyFree { get; set; }
        public bool NutFree { get; set; }
        public bool VeganFriendly { get; set; }
        public int Servings { get; set; }
        public int CaloriesPerServing { get; set; }
        public double Fat { get; set; }
        public double Carbohydrates { get; set; }
        public double Protein { get; set; }
        public double Fiber { get; set; }
        public double Cholesterol { get; set; }
        public double Sodium { get; set; }
        public string RecipeImage { get; set; }

        public string ChosenRecipe { get; set; }
        public List<SelectListItem> RecipeDropDown { get; set; }

    }
}