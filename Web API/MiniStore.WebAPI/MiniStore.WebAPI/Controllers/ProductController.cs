using MiniStore.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniStore.WebAPI.Controllers
{
    [RoutePrefix("api/products")]
    public class ProductController : ApiController
    {
        VANPHONGPHAMEntities db = new VANPHONGPHAMEntities();

        private Product ToJsonProduct(Product product)
        {
            if (product.Brand != null)
            {
                product.Brand.Products.Clear();
            }
            product.Brand = null;
            product.Carts.Clear();
            if (product.Category != null)
            {
                product.Category.Products.Clear();
            }
            product.Category = null;
            product.Feedbacks.Clear();
            product.Order_detail.Clear();
            return product;
        }

        [HttpGet]
        [Route("new/{quantity}")]
        public IEnumerable<Product> GetNewProducts(int quantity)
        {
            List<Product> list = new List<Product>();
            if (quantity <= 0)
            {
                return list;
            }
            List<Product> newProducts = db.Products.
                OrderByDescending(p => p.product_id).Take(quantity).ToList();
            for (int i = 0; i < newProducts.Count; i++)
            {
                list.Add(ToJsonProduct(newProducts[i]));
            }
            return list;
        }

        [HttpGet]
        [Route("product-id/{id}")]
        public Product GetProductsById(int id)
        {
            Product product = db.Products.Find(id);
            if (product != null)
            {
                return ToJsonProduct(product);
            }
            return new Product();
        }

        [HttpGet]
        [Route("category-id/{categoryId}")]
        public List<Product> GetProductsByCategoryId(int categoryId)
        {
            List<Product> products = new List<Product>();
            Category category = db.Categories.Find(categoryId);
            if (category != null)
            {
                List<Product> list = category.Products.ToList();
                for (int i = 0; i < list.Count; i++)
                {
                    products.Add(ToJsonProduct(list[i]));
                }
            }
            return products;
        }

    }
}
