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
    public class RecipeDAL : IRecipeDAL
    {
        private readonly string connectionString;

        public RecipeDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }   

        const string RecipeListTop5String = "Select * from recipes;";
        const string GetAllRecipesString = "SELECT * from recipes;";
        const string GetRecipeString = "Select * from recipes where RecipeId = @recipeId";
        const string GetAllUserRecipesString = "Select * from recipes where user ;";     

        public void AddRecipe(Recipes newRecipe)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = $"INSERT INTO recipes(recipeDescription, recipeName, instructions, cookTime, prepTime, recipeType, glutenFree, vegetarianFriendly, dairyFree, nutFree, veganFriendly, servings, caloriesPerServing, fat, carbohydrates, protein, fiber, cholesterol, sodium, recipeImage) " +
            "values (@recipeDescription, @recipeName, @instructions, @cookTime, @prepTime, @recipeType, @glutenFree, @vegetarianFriendly, @dairyFree, @nutFree, @veganFriendly, @servings, @caloriesPerServing, @fat, @carbohydrates, @protein, @fiber, @cholesterol, @sodium, @recipeImage);";

                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@recipeDescription", newRecipe.RecipeDescription);
                    command.Parameters.AddWithValue("@recipeName", newRecipe.RecipeName);
                    command.Parameters.AddWithValue("@instructions", newRecipe.Instructions);
                    command.Parameters.AddWithValue("@cookTime", newRecipe.CookTime);
                    command.Parameters.AddWithValue("@prepTime", newRecipe.PrepTime);
                    command.Parameters.AddWithValue("@recipeType", newRecipe.RecipeType);
                    command.Parameters.AddWithValue("@glutenFree", newRecipe.GlutenFree);
                    command.Parameters.AddWithValue("@vegetarianFriendly", newRecipe.VegetarianFriendly);
                    command.Parameters.AddWithValue("@dairyFree", newRecipe.DairyFree);
                    command.Parameters.AddWithValue("@nutFree", newRecipe.NutFree);
                    command.Parameters.AddWithValue("@veganFriendly", newRecipe.VeganFriendly);
                    command.Parameters.AddWithValue("@servings", newRecipe.Servings);
                    command.Parameters.AddWithValue("@caloriesPerServing", newRecipe.CaloriesPerServing);
                    command.Parameters.AddWithValue("@fat", newRecipe.Fat);
                    command.Parameters.AddWithValue("@carbohydrates", newRecipe.Carbohydrates);
                    command.Parameters.AddWithValue("@protein", newRecipe.Protein);
                    command.Parameters.AddWithValue("@fiber", newRecipe.Fiber);
                    command.Parameters.AddWithValue("@cholesterol", newRecipe.Cholesterol);
                    command.Parameters.AddWithValue("@sodium", newRecipe.Sodium);
                    command.Parameters.AddWithValue("@recipeImage", newRecipe.RecipeImage);

                    command.ExecuteNonQuery();
                }
            }
            catch(SqlException exception)
            {
                throw;
            }
        }
        
        public AwesomeModel DropDownRecipeGet()
        {
            AwesomeModel result =new AwesomeModel();
            result.Recipe = new Recipes();
            result.Recipe.RecipeDropDown = new List<SelectListItem>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                
                List<Recipes> DropDownRecipeList = connection.Query<Recipes>(GetAllRecipesString).ToList();

                foreach (Recipes recipe in DropDownRecipeList)
                {
                    SelectListItem choice = new SelectListItem() { Text = recipe.RecipeName, Value = recipe.RecipeName.ToString() };
                    result.Recipe.RecipeDropDown.Add(choice);
                }
                
            }
            return result;
        }

        //This method is to display top 5 recipes for the home index below the log in and register for aesthetics
        public IList<Recipes> RecipesTop5()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                List<Recipes> result = connection.Query<Recipes>(RecipeListTop5String).ToList();
                return result;
            }
        }

        // This method is to retrieve all the recipes so that the user can choose which ones to join to their meal plan organizer.
        public IList<Recipes> GetRecipes()
        {
            IList<Recipes> allRecipes = new List<Recipes>();
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<Recipes> result = connection.Query<Recipes>(GetAllRecipesString).ToList();
                    return result;
                }
            }
        }

        //this method is to get individual recipe for recipe details page where recipe id = ?
        public Recipes GetRecipe(int recipeId)
        {
            Recipes oneRecipe = new Recipes();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Dictionary<string, object> dynamicParameterArgs = new Dictionary<string, object>();
                dynamicParameterArgs.Add("@recipeId", recipeId);

                oneRecipe = connection.Query<Recipes>(GetRecipeString, new DynamicParameters(dynamicParameterArgs)).ToList().FirstOrDefault();
                
                return oneRecipe;
            }
        }

        // join sql query between recipes and user and ingredients
        public IList<Recipes> GetRecipesForUser(int userId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                List<Recipes> result = connection.Query<Recipes>(GetAllUserRecipesString).ToList();
                return result;
            }
        }
    }
}