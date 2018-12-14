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
    }
}
