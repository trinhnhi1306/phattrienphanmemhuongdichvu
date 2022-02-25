using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace MiniStore.WebAPI.Utils
{
    //short helper class to ignore some properties from serialization
    public class IgnorePropertiesResolver : DefaultContractResolver
    {
        public static readonly IgnorePropertiesResolver UserIgnoreProperites
            = new IgnorePropertiesResolver("Address", "Carts", "Feedbacks", "Orders", "Permission");
        public static readonly IgnorePropertiesResolver CategoryIgnoreProperites
            = new IgnorePropertiesResolver("Products");
        public static readonly IgnorePropertiesResolver ProductIgnoreProperites
            = new IgnorePropertiesResolver("Carts", "Feedbacks", "Order_detail", "Products");
        public static readonly IgnorePropertiesResolver FeedbackIgnoreProperites
            = new IgnorePropertiesResolver("Product", "Address", "Carts", "Feedbacks", "Orders", "Permission");

        private readonly HashSet<string> ignoreProps;
        public IgnorePropertiesResolver(params string[] propNamesToIgnore)
        {
            this.ignoreProps = new HashSet<string>(propNamesToIgnore);
        }

        protected override JsonProperty CreateProperty(MemberInfo member, MemberSerialization memberSerialization)
        {
            JsonProperty property = base.CreateProperty(member, memberSerialization);
            if (this.ignoreProps.Contains(property.PropertyName))
            {
                property.ShouldSerialize = _ => false;
            }
            return property;
        }
    }
}