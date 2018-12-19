using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Web.Models
{
    public class Ingredients
    {
        public int IngredientId { get; set; }
        public string IngredientName { get; set; }
        public string IngredientImage { get; set; }

        public static List<SelectListItem> IngredientsInGroceryList = new List<SelectListItem>()
        {
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Tapioca Flour", Value = "Tapioca Flour"},
            new SelectListItem() { Text = "Potato Starch", Value = "Potato Starch"},
            new SelectListItem() { Text = "Sweet Cream Buttermilk Powder", Value = "Sweet Cream Buttermilk Powder"},
            new SelectListItem() { Text = "Sugar", Value = "Sugar"},
            new SelectListItem() { Text = "Sugar Substitute", Value = "Sugar Substitute"},
            new SelectListItem() { Text = "Baking Powder", Value = "Baking Powder"},
            new SelectListItem() { Text = "Baking Soda", Value = "Baking Soda"},
            new SelectListItem() { Text = "Salt", Value = "Salt"},
            new SelectListItem() { Text = "Xanthan Gum", Value = "Xanthan Gum"},
            new SelectListItem() { Text = "Eggs", Value = "Eggs"},
            new SelectListItem() { Text = "Canola Oil", Value = "Canola Oil"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
            new SelectListItem() { Text = "Rice Flour", Value = "Rice Flour"},
        };


    }
}