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




    }
}
