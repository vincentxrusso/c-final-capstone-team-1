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
    public class GroceryListDAL : IGroceryListDAL
    {
        private readonly string connectionString;

        public GroceryListDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string GetAllGroceryListsString = "Select * from groceryLists;";

        public IList<GroceryLists> GetGroceryLists()
        {
            IList<GroceryLists> allRecipes = new List<GroceryLists>();
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    IList<GroceryLists> result = connection.Query<GroceryLists>(GetAllGroceryListsString).ToList();
                    return result;
                }
            }
        }

        public void AddGroceryList(GroceryLists newGroceryList)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = $"INSERT INTO groceryLists (item, groceryListImage, quantity) values (@item, @groceryListImage, @quantity);";

                    SqlCommand command = new SqlCommand(sql, connection);
                    
                    command.Parameters.AddWithValue("@item", newGroceryList.Item);
                    command.Parameters.AddWithValue("@groceryListImage", newGroceryList.GroceryListImage);
                    command.Parameters.AddWithValue("@quantity", newGroceryList.Quantity);

                    command.ExecuteNonQuery();
                }
            }
            catch (SqlException exception)
            {
                throw;
            }
        }
    }
}
