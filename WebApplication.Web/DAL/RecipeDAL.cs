using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;
using WebApplication.Web.Models;

namespace WebApplication.Web.DAL
{
    public class RecipeDAL
    {

        const string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=MealPlanner;Integrated Security=True";
        const string AddRecipeString = " INSERT INTO recipes(recipeId, recipeDescription, recipeName, instructions, cookTime, prepTime, recipeType, glutenFree, vegetarianFriendly, dairyFree, nutFree, veganFriendly, servings, caloriesPerServing, fat, carbohydrates, protein, fiber, cholesterol, sodium, recipeImage) " +
            "@recipeId, @recipeDescription, @recipeName, @instructions, @cookTime, @prepTime, @recipeType, @glutenFree, @vegetarianFriendly, @dairyFree, @nutFree, @veganFriendly, @servings, @caloriesPerServing, @fat, @carbohydrates, @protein	fiber, @cholesterol, @sodium, @recipeImage)";
        const string RecipeListTop5String = "Select * from recipes";
        const string GetAllRecipesString = "SELECT * from recipes";
        const string GetAllUserRecipesString = "Select * from recipes where user ";
        public Recipes dapperDemoRecipe = new Recipes();

        public int addRecipes(Recipes newRecipe)
        {
            //dapperDemoRecipe.Name = "Pancakes";
            //dapperDemoRecipe.Description = "How to make some Gluten Free Pancakes that adam doesnt feel like eating";
            //dapperDemoRecipe.Instructions = "Adam Brings in the mix and we read the package";
            //dapperDemoRecipe.CookTime = 20;
            //dapperDemoRecipe.PrepTime = 10;
            //dapperDemoRecipe.RecipeType = "breakfast";
            //dapperDemoRecipe.Gluten = false;
            //dapperDemoRecipe.Vegetarian = true;
            //dapperDemoRecipe.Dairy = true;
            //dapperDemoRecipe.Nuts = false;
            //dapperDemoRecipe.Vegan = false;
            //dapperDemoRecipe.Servings = 4;
            //dapperDemoRecipe.CaloriesPerServing = 300;
            //dapperDemoRecipe.Fat = 4;
            //dapperDemoRecipe.Carbohydrates = 39;
            //dapperDemoRecipe.Protein = 5;
            //dapperDemoRecipe.Fiber = 2;
            //dapperDemoRecipe.Cholesterol = 10;
            //dapperDemoRecipe.Sodium = 1;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddRecipeString, newRecipe);
                return affectRows;

            }

        }

        //This method is to display top 5 recipes for the home index below the log in and register for aesthetics
        public List<Recipes> recipesTop5()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                List<Recipes> result = connection.Query<Recipes>(RecipeListTop5String).ToList();
                return result;
            }
        }

        // This method is to retrieve all the recipes so that the user can choose which ones to join to their meal plan organizer.
        public IList<Recipes> getRecipes()
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
        public IList<Recipes> getRecipesForUser(int userId)
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
