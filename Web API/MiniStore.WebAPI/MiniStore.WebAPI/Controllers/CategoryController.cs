using MiniStore.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/categories")]
    public class CategoryController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        private Category ToJsonCategory(Category category)
        {
            category.Products.Clear();
            return category;
        }

        [HttpGet]
        [Route("")]
        public IEnumerable<Category> GetCategories()
        {
            List<Category> list = db.Categories.ToList();
            for (int i = 0; i < list.Count; i++)
            {
                yield return ToJsonCategory(list[i]);
            }
        }
    }
}
