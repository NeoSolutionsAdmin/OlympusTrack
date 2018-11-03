using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class Utilities
    {
        public static String DateTimeToSQLDateTime(DateTime p_date)
        {
            string Year = p_date.Year.ToString();
            string Month = p_date.Month.ToString();
            string Day = p_date.Day.ToString();
            string Hour = p_date.Hour.ToString();
            string Minute = p_date.Minute.ToString();

            return (Year + "-" + Month + "-" + Day + " " + Hour + ":" + Minute);

        }
    }
}
