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
       


        const string AddRecipeString = " INSERT INTO recipes(recipeDescription, recipeName, instructions, cookTime, prepTime, recipeType, glutenFree, vegetarianFriendly, dairyFree, nutFree, veganFriendly, servings, caloriesPerServing, fat, carbohydrates, protein, fiber, cholesterol, sodium, recipeImage) " +
            "values (@recipeDescription, @recipeName, @instructions, @cookTime, @prepTime, @recipeType, @glutenFree, @vegetarianFriendly, @dairyFree, @nutFree, @veganFriendly, @servings, @caloriesPerServing, @fat, @carbohydrates, @protein, @fiber, @cholesterol, @sodium, @recipeImage);";
        const string RecipeListTop5String = "Select * from recipes;";
        const string GetAllRecipesString = "SELECT * from recipes;";
        const string GetAllUserRecipesString = "Select * from recipes where user ;";
     

        public void AddRecipe(Recipes newRecipe)
        {           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddRecipeString, newRecipe);                
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
                    List<Recipes> result = connection.Query<Recipes>(GetAllRecipesString).ToList();
                    return result;
                }
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