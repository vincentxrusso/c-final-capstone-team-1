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
        public IActionResult Index()
        {
            MealPlanDAL dal = new MealPlanDAL();
            return View(dal.GetMealPlans());
        }
    }
}
