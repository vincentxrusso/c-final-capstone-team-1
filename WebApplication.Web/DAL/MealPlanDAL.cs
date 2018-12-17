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
            "values (@RecipeId, @MealPlanName, @MealPlanImage);";
        const string GetAllMealPlans = "Select * from mealPlans";
        const string GetRecipeIDFromName = "SELECT recipeId from recipes where recipeName = @RecipeName;";
        
        const string GetAllUserRecipesString = " ";        

        public void AddMealPlan(AwesomeModel newPlan)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                if (newPlan.MealPlan.RecipeId == null)
                {
                    newPlan.MealPlan.RecipeId = new List<int>();
                }
                connection.Open();
                Dictionary<string, object> dynamicParameterArgs = new Dictionary<string, object>();
                dynamicParameterArgs.Add("@RecipeName", newPlan.Recipe.RecipeName);
                int theRecipeId = connection.Query<int>(GetRecipeIDFromName, new DynamicParameters(dynamicParameterArgs)).ToList().FirstOrDefault();
                newPlan.MealPlan.RecipeId.Add(theRecipeId);
                Dictionary<string, object> dynamicParameterArgsMealPlan = new Dictionary<string, object>();
                dynamicParameterArgsMealPlan.Add("@RecipeId", newPlan.MealPlan.RecipeId);
                dynamicParameterArgsMealPlan.Add("@MealPlanName", newPlan.MealPlan.MealPlanName);
                dynamicParameterArgsMealPlan.Add("@MealPlanImage", "https://image.flaticon.com/icons/svg/93/93104.svg");
                foreach (int recipeId in newPlan.MealPlan.RecipeId)
                {
                    int affectRows = connection.Execute(AddMealPlanString, new DynamicParameters(dynamicParameterArgsMealPlan));
                }
                

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