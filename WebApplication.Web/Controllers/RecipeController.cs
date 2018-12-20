using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Web.Models;
using WebApplication.Web.DAL;
using WebApplication.Web.Providers.Auth;
using System.Security.Claims;

namespace WebApplication.Web.Controllers
{
    public class RecipeController : Controller
    {
        IRecipeDAL recipeDAL = new RecipeDAL(@"Data Source=maritom-dev.cgvcfmypecs9.us-east-1.rds.amazonaws.com,1433;Initial Catalog=MealPlanner;User ID=tise;Password=901Penn@v3");
        IIngredientsDAL ingredientsDAL = new IngredientsDAL(@"Data Source=maritom-dev.cgvcfmypecs9.us-east-1.rds.amazonaws.com,1433;Initial Catalog=MealPlanner;User ID=tise;Password=901Penn@v3");

        public IActionResult Index()
        {            
            return View(recipeDAL.GetRecipes());
        }

        public IActionResult Detail(int recipeId)
        {
            AwesomeModel returnModel = new AwesomeModel();
            returnModel.Recipe = recipeDAL.GetRecipe(recipeId);
            returnModel.Ingredients = ingredientsDAL.GetIngredientsForRecipe(recipeId);
            
            return View(returnModel);
        }

        public IActionResult Print(int recipeId)
        {
            Recipes recipe = recipeDAL.GetRecipe(recipeId);
            return View(recipe);
        }
        [AuthorizationFilter]
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