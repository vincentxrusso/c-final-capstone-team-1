using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;
using Dapper;

namespace WebApplication.Web.DAL
{
    public class MealPlanDAL : IMealPlanDAL
    {


        const string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True";
        const string AddMealPlanString = " INSERT INTO mealPlans (recipeId, mealPlanName, mealPlanImage) " +
            "@recipeId, @mealPlanName, @mealPlanImage)";
        const string GetAllMealPlans = "Select * from mealPlan";
        const string GetAllRecipesString = "SELECT * from mealPlan";
        const string GetAllUserRecipesString = " ";
        

        public int addMealPlan(MealPlans newPlan)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddMealPlanString, newPlan);
                return affectRows;

            }

        }















    }
}
