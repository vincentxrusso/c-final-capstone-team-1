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
        IMealPlanDAL mealPlanDAL = new MealPlanDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");
        IRecipeDAL recipeDAL = new RecipeDAL(@"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True");

        public IActionResult Index()
        {
            var user = authProvider.GetCurrentUser();
            return View(mealPlanDAL.GetMealPlans(user.UserId));
        }

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
            model = mealPlanDAL.GetMealPlanByID(model);
            return View( "MealPlanDetail", model);
        }
        [HttpGet]
        public IActionResult MealPlanDetail(AwesomeModel model)
        {
          
            return View(model);
        }
    }
}
