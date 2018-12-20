using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;
using WebApplication.Web.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using WebApplication.Web.Providers.Auth;

namespace WebApplication.Web.DAL
{
    public class MealPlanDAL : IMealPlanDAL
    {
        private readonly string connectionString;

        public MealPlanDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string AddMealPlanString = " INSERT INTO mealPlans (mealPlanName, mealPlanImage,userID) " +
            "values (@MealPlanName, @MealPlanImage, @userID);" +
            "select cast(SCOPE_Identity() as int);";



        const string GetAllMealPlans = "Select * from mealPlans where userID=@userID";
        const string GetAllRecipiesForMealPlan = "SELECT * from recipes as r join mealPlans_recipes as mr on r.recipeId = mr.recipeId where mr.mealPlanId = @mealPlanId";
        const string GetRecipeIDFromName = "SELECT recipeId from recipes where recipeName = @RecipeName;";
        const string AddToMealPlanRecipes = "INSERT INTO mealPlans_recipes (mealPlanId, recipeId) values (@mealPlanId, @recipeId);";

        const string RemoveRecipeFromMealPlan = "DELETE from mealPlans_recipes where recipeId = @RecipeId and mealPlanId = @MealPlanId";

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
                dynamicParameterArgsMealPlan.Add("@userID", newPlan.User.UserId);

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


        public void RemoveRecipeFromPlan (int MealPlanId, int RecipeId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                //Dictionary<string, object> dynamicParameterArgs = new Dictionary<string, object>();
                //int theRecipeId = connection.Query<int>(GetRecipeIDFromName, new DynamicParameters(dynamicParameterArgs)).ToList().FirstOrDefault();

                connection.Query<Recipes>(RemoveRecipeFromMealPlan, new { mealPlanId = MealPlanId, recipeId = RecipeId });

            }


        }

        public void AddRecipeToPlan (int MealPlanId, int RecipeId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                connection.Query<Recipes>(AddToMealPlanRecipes, new { mealPlanId = MealPlanId, recipeId = RecipeId });
            }
        }
        public IList<MealPlans> GetMealPlans(int userID)
        {

            
            IList<MealPlans> allRecipes = new List<MealPlans>();

            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<MealPlans> results = connection.Query<MealPlans>(GetAllMealPlans,new { userID }).ToList();
                    foreach (var item in results)
                    {
                        item.Recipes = connection.Query<Recipes>(GetAllRecipiesForMealPlan, new { mealPlanId = item.MealPlanId }).ToList();
                    }
                    return results;

                }
            }
        }
        public AwesomeModel GetMealPlanByID(int id)
        {

            AwesomeModel returnModel = new AwesomeModel();
            const string GetMealPlanByID = "Select * from mealPlans where mealPlanId = @MealPlanId;";
            const string GetMealPlanByIDWithRecipeIDs = "Select recipeId from mealPlans_recipes where mealPlanId = @MealPlanId;";
            const string CreateRecipesFromMealPlan = "Select * from recipes where recipeId = @recipeId;";
            Dictionary<string, object> dynamicParameterArgsMealPlan = new Dictionary<string, object>();
            dynamicParameterArgsMealPlan.Add("@MealPlanId", id);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                MealPlans results = connection.Query<MealPlans>(GetMealPlanByID, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList().FirstOrDefault();
                returnModel.MealPlan = results;
             

                List<int> resultsRecipes = connection.Query<int>(GetMealPlanByIDWithRecipeIDs, new DynamicParameters(dynamicParameterArgsMealPlan)).ToList();
                returnModel.MealPlan.RecipeId = resultsRecipes;
                returnModel.MealPlan.RecipesList = new List<Recipes>();
                foreach (int recipeId in resultsRecipes)
                {
                    Recipes recipeToAddToModel = connection.Query<Recipes>(CreateRecipesFromMealPlan, new { recipeId }).ToList().FirstOrDefault();
                    returnModel.MealPlan.RecipesList.Add(recipeToAddToModel);
                }

                return returnModel;

            }

        }
    }
}