using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System
{
    public static class ObjectExtensions
    {
        public static T CopyFrom<T>(this T o, object from)
        {
            var props = o.GetType().GetProperties();
            var fromType = from.GetType();
            foreach (var prop in props)
            {
                var fromProp = fromType.GetProperty(prop.Name);
                if (fromProp != null)
                {
                    prop.SetValue(o, fromProp.GetValue(from));
                }

            }
            return o;
            
        }

        public static T CopyTo<T>(this object o, T to)
        {
            return to.CopyFrom(o);

        }

    }
}