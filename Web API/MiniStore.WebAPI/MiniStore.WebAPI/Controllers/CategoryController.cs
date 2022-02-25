using MiniStore.WebAPI.Models;
using MiniStore.WebAPI.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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

        [HttpGet]
        [Route("")]
        public JArray GetCategories()
        {
            List<Category> data = db.Categories.ToList();
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
            { ContractResolver = IgnorePropertiesResolver.CategoryIgnoreProperites }));
        }
    }
}
