using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication.Web.Models;
using WebApplication.Web.DAL;

namespace WebApplication.Web.Controllers
{
    public class MealPlanController : Controller
    {

        IMealPlanDAL mealPlanDAL = new MealPlanDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");
        IRecipeDAL recipeDAL = new RecipeDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");

        public IActionResult Index()
        {
           
            return View(mealPlanDAL.GetMealPlans());
        }

        //[HttpGet]
        //public IActionResult RecipesToAddToMealPlan()
        //{
        //    return View();
        //}
        //[HttpPost]
        //public IActionResult RecipesToAddToMealPlan(AwesomeModel model)
        //{

        //    return View(recipeDAL.DropDownRecipeGet());
        //}
        [HttpGet]
        public IActionResult AddMealPlan()
        {
            
            return View(new AwesomeModel());

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddMealPlan(AwesomeModel model)
        {

            return View(new AwesomeModel());

        }
    }
}
