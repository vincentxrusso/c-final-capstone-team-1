using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;
using WebApplication.Web.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace WebApplication.Web.DAL
{
    public class MealPlanDAL : IMealPlanDAL
    {
        private readonly string connectionString;

        public MealPlanDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string AddMealPlanString = " INSERT INTO mealPlans (mealPlanName, mealPlanImage) " +
            "values (@MealPlanName, @MealPlanImage);" +
            "select cast(SCOPE_Identity() as int);";



        const string GetAllMealPlans = "Select * from mealPlans";
        const string GetRecipeIDFromName = "SELECT recipeId from recipes where recipeName = @RecipeName;";
        const string AddToMealPlanRecipes = "INSERT INTO mealPlans_recipes (mealPlanId, recipeId) values (@mealPlanId, @recipeId);";
        const string GetAllUserRecipesString = " ";

        public AwesomeModel AddMealPlan(AwesomeModel newPlan)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                //newPlan.MealPlan = new MealPlans();
                newPlan.MealPlan.RecipeId = new List<int>();
                //newPlan.Recipe = new Recipes();

                connection.Open();
                Dictionary<string, object> dynamicParameterArgs = new Dictionary<string, object>();
                dynamicParameterArgs.Add("@RecipeName", newPlan.Recipe.RecipeName);
                int theRecipeId = connection.Query<int>(GetRecipeIDFromName, new DynamicParameters(dynamicParameterArgs)).ToList().FirstOrDefault();
                newPlan.MealPlan.RecipeId.Add(theRecipeId);

                Dictionary<string, object> dynamicParameterArgsMealPlan = new Dictionary<string, object>();


                dynamicParameterArgsMealPlan.Add("@MealPlanName", newPlan.MealPlan.MealPlanName);
                dynamicParameterArgsMealPlan.Add("@MealPlanImage", "https://image.flaticon.com/icons/svg/93/93104.svg");

                newPlan.MealPlan.MealPlanId = connection.Query<int>(AddMealPlanString, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList().FirstOrDefault();
                foreach (int recipeId in newPlan.MealPlan.RecipeId)
                {
                    dynamicParameterArgsMealPlan.Add("@mealPlanID", newPlan.MealPlan.MealPlanId);
                    dynamicParameterArgsMealPlan.Add("@RecipeId", newPlan.MealPlan.RecipeId);
                    int affectedRows = connection.Execute(AddToMealPlanRecipes, new DynamicParameters(dynamicParameterArgsMealPlan));

                }




            }
            return newPlan;
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
        public AwesomeModel GetMealPlanByID(AwesomeModel userModel)
        {
            

            const string GetMealPlanByID = "Select * from mealPlans where mealPlanId = @MealPlanId;";
            const string GetMealPlanByIDWithRecipeIDs = "Select recipeId from mealPlans_recipes where mealPlanId = @MealPlanId;";
            const string CreateRecipesFromMealPlan = "Select * from recipes where recipeId = @recipeId;";
            Dictionary<string, object> dynamicParameterArgsMealPlan = new Dictionary<string, object>();
            dynamicParameterArgsMealPlan.Add("@MealPlanId", userModel.MealPlan.MealPlanId);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                MealPlans results = connection.Query<MealPlans>(GetMealPlanByID, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList().FirstOrDefault();
                userModel.MealPlan = results;
             

                List<int> resultsRecipes = connection.Query<int>(GetMealPlanByIDWithRecipeIDs, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList();
                userModel.MealPlan.RecipeId = resultsRecipes;
                userModel.MealPlan.RecipesList = new List<Recipes>();
                foreach (int recipeId in resultsRecipes)
                {
                    dynamicParameterArgsMealPlan.Add("@recipeid", recipeId);
                    Recipes recipeToAddToModel = connection.Query<Recipes>(CreateRecipesFromMealPlan, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList().FirstOrDefault();
                    userModel.MealPlan.RecipesList.Add(recipeToAddToModel);
                }

                return userModel;

            }

        }
    }
}