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
        const string AddRecipeString = " INSERT INTO recipes(description, name, instructions, cookTime, prepTime, recipeType, gluten, vegetarian, dairy, nuts, vegan, servings, caloriesPerServing, fat, carbohydrates, protein, fiber, cholesterol, sodium) "+
            "values(@description, @name, @instructions, @cookTime, @prepTime, @recipeType, @gluten, @vegetarian, @dairy, @nuts, @vegan, @servings, @caloriesPerServing, @fat, @carbohydrates, @protein, @fiber, @cholesterol, @sodium)";

        public Recipes dapperDemoRecipe = new Recipes();

        public int addRecipes(Recipes newRecipe)
        {
            dapperDemoRecipe.Name = "Pancakes";
            dapperDemoRecipe.Description = "How to make some Gluten Free Pancakes that adam doesnt feel like eating";
            dapperDemoRecipe.Instructions = "Adam Brings in the mix and we read the package";
            dapperDemoRecipe.CookTime = 20;
            dapperDemoRecipe.PrepTime = 10;
            dapperDemoRecipe.RecipeType = "breakfast";
            dapperDemoRecipe.Gluten = false;
            dapperDemoRecipe.Vegetarian = true;
            dapperDemoRecipe.Dairy = true;
            dapperDemoRecipe.Nuts = false;
            dapperDemoRecipe.Vegan = false;
            dapperDemoRecipe.Servings = 4;
            dapperDemoRecipe.CaloriesPerServing = 300;
            dapperDemoRecipe.Fat = 4;
            dapperDemoRecipe.Carbohydrates = 39;
            dapperDemoRecipe.Protein = 5;
            dapperDemoRecipe.Fiber = 2;
            dapperDemoRecipe.Cholesterol = 10;
            dapperDemoRecipe.Sodium = 1;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddRecipeString, dapperDemoRecipe);
                return affectRows;

            }
        }
        

        



    }
}
