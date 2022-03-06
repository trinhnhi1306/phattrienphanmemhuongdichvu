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
using System.Web.Http.Results;

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/products")]
    public class ProductController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        [HttpGet]
        [Route("")]
        public JArray GetNewProducts(int quantity)
        {
            List<Product> data = new List<Product>();
            if (quantity > 0)
            {
                data = db.Products.OrderByDescending(p => p.product_id).Take(quantity).ToList();
            }
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
            { ContractResolver = IgnorePropertiesResolver.ProductIgnoreProperites }));
        }

        [HttpGet]
        [Route("getAllProducts")]
        public JArray GetAllProducts()
        {
            List<Product> data = db.Products.ToList();

            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
            { ContractResolver = IgnorePropertiesResolver.ProductIgnoreProperites }));
        }

        [HttpGet]
        [Route("getProductsById/{productId}")]
        public JArray GetProductsById(int productId)
        {
            List<Product> data = new List<Product>();
            Product product = db.Products.Find(productId);
            if (product != null)
            {
                data.Add(product);
            }
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
                { ContractResolver = IgnorePropertiesResolver.ProductIgnoreProperites }));
        }

        [HttpGet]
        [Route("getProductsByCategoryId/{categoryId}")]
        public JArray GetProductsByCategoryId(int categoryId)
        {
            List<Product> data;
            Category category = db.Categories.Find(categoryId);
            if (category != null)
            {
                data = category.Products.ToList();
            }
            else
            {
                data = new List<Product>();
            }
            return JArray.Parse(JsonConvert.SerializeObject(data, new JsonSerializerSettings()
            { ContractResolver = IgnorePropertiesResolver.ProductIgnoreProperites }));
        }

        [HttpPost]
        [Route("addProduct")]
        public string AddProduct([FromBody] Product product)
        {
            product.sold_quantity = 0;
            product.status = true;
            try
            {
                db.Products.Add(product);
                db.SaveChanges();
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [HttpPut]
        [Route("{id}")]
        public string UpdateProduct(int id, [FromBody] Product productEdit)
        {

            Product product = db.Products.Find(id);
            if (product != null)
                return "Put method success";
           
            return "Không tìm thấy sản phẩm này";
        }

        [HttpDelete]
        [Route("{id}")]
        public string DeleteProduct(int id)
        {

            Product product = db.Products.Find(id);
            if (product != null)
                return "Delete method success";

            return "Không tìm thấy sản phẩm này";
        }
    }
}
