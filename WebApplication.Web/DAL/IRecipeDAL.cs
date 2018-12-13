using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;

namespace WebApplication.Web.DAL
{
    interface IRecipeDAL
    {
        IList<Recipes> GetRecipes();
        IList<Recipes> RecipesTop5();
    }
}
