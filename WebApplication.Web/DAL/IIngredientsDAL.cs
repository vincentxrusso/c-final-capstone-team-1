using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;

namespace WebApplication.Web.DAL
{
    public interface IIngredientsDAL
    {
        IList<Ingredients> GetIngredients();
        IList<Ingredients> GetIngredientsForRecipe(int RecipeId);
        void AddIngredient(Ingredients newIngredient);

    }
}
