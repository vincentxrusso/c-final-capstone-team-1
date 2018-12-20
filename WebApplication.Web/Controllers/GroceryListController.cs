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
    public class GroceryListController : Controller
    {
        IGroceryListDAL groceryListDAL = new GroceryListDAL(@"Data Source=maritom-dev.cgvcfmypecs9.us-east-1.rds.amazonaws.com,1433;Initial Catalog=MealPlanner;User ID=tise;Password=901Penn@v3");

        public IActionResult Index()
        {
            return View(groceryListDAL.GetGroceryLists());
        }

        [HttpGet]
        public IActionResult AddGroceryList()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddGroceryList(GroceryLists groceryList)
        {
            groceryListDAL.AddGroceryList(groceryList);

            return RedirectToAction("Index", "Home");
        }
    }
}