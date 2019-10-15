using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace Entities
{
    public static class staticFunctions
    {
        public static string ConvertDateTimeToFullString(DateTime p_d)
        {
            string date = p_d.Day + "/" + p_d.Month + "/" + p_d.Year;
            string time = p_d.Hour + ":" + p_d.Minute;
            return date + " " + time;
        }

        public static void sendMail(string toname,string toemail, string subject, string body)
        {
            MailAddress from = new MailAddress("olympussoftware.dev@gmail.com", "OLYMPUS SOFTWARE - TRACKER");
            MailAddress to = new MailAddress(toemail, toname);
            SmtpClient SMTPC = new SmtpClient("smtp.gmail.com", 587);
            SMTPC.EnableSsl = true;
            SMTPC.DeliveryMethod = SmtpDeliveryMethod.Network;
            SMTPC.UseDefaultCredentials = false;
            SMTPC.Credentials = new NetworkCredential(from.Address, "cloverfield161185");
            MailMessage MM = new MailMessage(from, to);
            MM.Subject = subject;
            MM.Body = body;
            SMTPC.Send(MM);

        }

    }
}
