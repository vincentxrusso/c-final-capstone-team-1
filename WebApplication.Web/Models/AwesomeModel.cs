using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class AwesomeModel
    {
        public Recipes Recipe { get; set; }
      
        public Users User { get; set; }
        public MealPlans MealPlan { get; set; }
        public Ingredients Ingredient { get; set; }
        public GroceryLists GroceryList { get; set; }
        public IList<Ingredients> Ingredients { get; set; }
        // need to use AwesomeModel for meal plan display so we get the recipe dropdown for add
        public IList<MealPlans> MealPlans { get; set; }
    }
}
