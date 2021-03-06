﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;

namespace WebApplication.Web.DAL
{
    public interface IMealPlanDAL
    {
        IList<MealPlans> GetMealPlans(int userID);
        AwesomeModel AddMealPlan(AwesomeModel newPlan);
        AwesomeModel GetMealPlanByID(int id);
        void RemoveRecipeFromPlan(int MealPlanId, int RecipeId);
        void AddRecipeToPlan(int MealPlanId, int RecipeId);

    }

}