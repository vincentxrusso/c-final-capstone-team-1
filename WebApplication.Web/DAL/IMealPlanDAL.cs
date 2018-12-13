using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Web.Models;

namespace WebApplication.Web.DAL
{
    interface IMealPlanDAL
    {
        IList<MealPlans> GetMealPlans();
    }
}
