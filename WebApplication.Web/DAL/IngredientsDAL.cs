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
    public class IngredientsDAL : IIngredientsDAL
    {
        private readonly string connectionString;

        public IngredientsDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string GetAllIngredientsForRecipeString = "select * from ingredients join recipes_ingredients on ingredients.ingredientId = recipes_ingredients.ingredientId where recipeId = @recipeId;";
        const string GetAllIngredientsString = "Select * from ingredients;";
        const string AddIngredientString = "insert into ingredients (ingredientName, ingredientImage) values (@ingredientName, @ingredientImage);";

        public IList<Ingredients> GetIngredients()
        {
            IList<Ingredients> allIngredients = new List<Ingredients>();
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<Ingredients> result = connection.Query<Ingredients>(GetAllIngredientsString).ToList();
                    return result;
                }
            }
        }

        public IList<Ingredients> GetIngredientsForRecipe(int RecipeId)
        {
            IList<Ingredients> ingredientsForRecipe = new List<Ingredients>();
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<Ingredients> result = connection.Query<Ingredients>(GetAllIngredientsForRecipeString, new { recipeId = RecipeId}).ToList();
                    return result;
                }
            }
        }

        public void AddIngredient(Ingredients newIngredient)
        {
            IList<Ingredients> addIngredient = new List<Ingredients>();
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<Ingredients> result = connection.Query<Ingredients>(AddIngredientString).ToList();
                }
            }
        }
    }
}