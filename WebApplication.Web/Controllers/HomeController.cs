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
    public class HomeController : Controller
    {
        RecipeDAL recipeDAL = new RecipeDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");

        [HttpGet]
        public IActionResult Index()
        {
            
            return View(recipeDAL.RecipesTop5());
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }
        
        [HttpGet]
        public IActionResult Detail()
        {

            return View(recipeDAL.GetRecipes());
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
      

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
