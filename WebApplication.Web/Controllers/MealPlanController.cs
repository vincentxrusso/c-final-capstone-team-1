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
    [AuthorizationFilter]
    public class MealPlanController : Controller
    {

        private readonly IAuthProvider authProvider;
        public MealPlanController(IAuthProvider authProvider)
        {
            this.authProvider = authProvider;
        }
        IMealPlanDAL mealPlanDAL = new MealPlanDAL(@"Data Source=maritom-dev.cgvcfmypecs9.us-east-1.rds.amazonaws.com,1433;Initial Catalog=MealPlanner;User ID=tise;Password=901Penn@v3");
        IRecipeDAL recipeDAL = new RecipeDAL(@"Data Source=maritom-dev.cgvcfmypecs9.us-east-1.rds.amazonaws.com,1433;Initial Catalog=MealPlanner;User ID=tise;Password=901Penn@v3");

        public IActionResult Index()
        {
            var user = authProvider.GetCurrentUser();
            //This is a way to pass a single value into your view
            ViewBag.isLoggedIn = authProvider.IsLoggedIn;
            AwesomeModel awesomeModel = recipeDAL.DropDownRecipeGet();
            awesomeModel.MealPlans = mealPlanDAL.GetMealPlans(user.UserId);
            return View(awesomeModel);
        }

        /// <returns></returns>
        //[HttpGet]
        //public IActionResult RecipeToAddToMealPlan()
        //{
        //    return View();
        //}
        //[HttpPost]
        //public IActionResult RecipeToAddToMealPlan(AwesomeModel model)
        //{

        //    return View(recipeDAL.DropDownRecipeGet());
        //}
        [HttpGet]
        public IActionResult AddMealPlan()
        {
        
            return View(recipeDAL.DropDownRecipeGet());

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Submit(AwesomeModel model)
        {
         
            model.User = authProvider.GetCurrentUser();
            model = mealPlanDAL.AddMealPlan(model);
            model = mealPlanDAL.GetMealPlanByID(model.MealPlan.MealPlanId);
            return RedirectToAction("Index");
            //return View( "MealPlanDetail", model);
        }
        [HttpGet]
        public IActionResult MealPlanDetail(int id)
        {
            AwesomeModel awesomeModel = mealPlanDAL.GetMealPlanByID(id);
            awesomeModel.Recipe = new Recipes();
            awesomeModel.Recipe.RecipeDropDown = recipeDAL.DropDownRecipeOnly();
            return View(awesomeModel);
        }

        [HttpPost]
        public IActionResult Remove(int MealPlanId, int RecipeId)
        {
            mealPlanDAL.RemoveRecipeFromPlan(MealPlanId, RecipeId);
            return RedirectToAction("MealPlanDetail", new { id = MealPlanId });          
        }

        [HttpPost]
        public IActionResult AddRecipeToSinglePlan(int MealPlanId, AwesomeModel awesomeModel)
        {
            mealPlanDAL.AddRecipeToPlan(MealPlanId, awesomeModel.Recipe.RecipeId);
            return RedirectToAction("MealPlanDetail", new { id = MealPlanId });

        }
    }
}
