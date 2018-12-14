using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;
using Dapper;

namespace WebApplication.Web.DAL
{
    public class MealPlanDAL :IMealPlanDAL
    {
        private readonly string connectionString;

        public MealPlanDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string AddMealPlanString = " INSERT INTO mealPlans (recipeId, mealPlanName, mealPlanImage) " +
            "@recipeId, @mealPlanName, @mealPlanImage)";
        const string GetAllMealPlans = "Select * from mealPlans";
        
        const string GetAllUserRecipesString = " ";
        

        public void AddMealPlan(MealPlans newPlan)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddMealPlanString, newPlan);
                

            }

        }

        public IList<MealPlans> GetMealPlans()
        {

            IList<MealPlans> allRecipes = new List<MealPlans>();

            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<MealPlans> results = connection.Query<MealPlans>(GetAllMealPlans).ToList();
                    return results;

                }
            }



        }













    }
}
