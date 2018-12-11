using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class GroceryLists
    {
        public int GroceryListId { get; set; }
        public int IngredientId { get; set; }
        public string Item { get; set; }
        public string GroceryListImage { get; set; }
        public int Quantity { get; set; }
    }
}