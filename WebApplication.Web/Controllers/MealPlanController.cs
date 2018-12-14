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
        RecipeDAL recipeDAL = new RecipeDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");

        public IActionResult Index()
        {
           
            return View(mealPlanDAL.GetMealPlans());
        }
        //public IActionResult MealPlanSetUp()
        //{
        //    //MealPlans PlanB = new MealPlans();
        //    //RecipeDAL dal = new RecipeDAL();
        //    //PlanB.Recipes = dal.GetRecipes();
            
        //    return View(PlanB);
        //}
        public IActionResult RecipesToAddToMealPlan()
        {

            return View(recipeDAL.DropDownRecipeGet());
        }
        [HttpGet]
        public IActionResult AddMealPlan()
        {
            AwesomeModel Model;
            return View(Model);

        }
    }
}
