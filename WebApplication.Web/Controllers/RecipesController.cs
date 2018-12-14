﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Web.Models;
using WebApplication.Web.DAL;

namespace WebApplication.Web.Controllers
{
    public class RecipesController : Controller
    {
        RecipeDAL recipeDAL = new RecipeDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");
        
        public IActionResult Index()
        {
            
            return View(recipeDAL.GetRecipes());
        }

        public IActionResult Detail()
        {
            
            return View(recipeDAL.GetRecipes());
        }

        [HttpGet]
        public IActionResult AddRecipe()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddRecipe(Recipes recipe)
        {
            recipeDAL.AddRecipe(recipe);

            return RedirectToAction("Index", "Home");
        }
    }
}