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
            dapperDemoRecipe.name = "Pancakes";
            dapperDemoRecipe.description = "How to make some Gluten Free Pancakes that adam doesnt feel like eating";
            dapperDemoRecipe.instructions = "Adam Brings in the mix and we read the package";
            dapperDemoRecipe.cookTime = 20;
            dapperDemoRecipe.prepTime = 10;
            dapperDemoRecipe.recipeType = "breakfast";
            dapperDemoRecipe.gluten = false;
            dapperDemoRecipe.vegetarian = true;
            dapperDemoRecipe.dairy = true;
            dapperDemoRecipe.nuts = false;
            dapperDemoRecipe.vegan = false;
            dapperDemoRecipe.servings = 4;
            dapperDemoRecipe.caloriesPerServing = 300;
            dapperDemoRecipe.fat = 4;
            dapperDemoRecipe.carbohydrates = 39;
            dapperDemoRecipe.protein = 5;
            dapperDemoRecipe.fiber = 2;
            dapperDemoRecipe.cholesterol = 10;
            dapperDemoRecipe.sodium = 1;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int affectRows = connection.Execute(AddRecipeString, dapperDemoRecipe);
                return affectRows;

            }
        }
        

        



    }
}
