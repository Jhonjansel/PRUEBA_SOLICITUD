using System;
using System.Net.Mail;


namespace PRUEBA_SOLICITUD
{
    public class Correo
    {
        Boolean estado = true;
        string merror;
        public void EnviarCorreo(string destinatario, string asunto, string mensaje) {

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("dulu.sotfw@gmail.com");
            mail.Sender = new MailAddress("dulu.sotfw@gmail.com");
            mail.To.Add(destinatario);
            mail.IsBodyHtml = true;
            mail.Subject = asunto;
            mail.Body = mensaje;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.UseDefaultCredentials = false;

            smtp.Credentials = new System.Net.NetworkCredential("dulu.sotfw@gmail.com", "@dmin2021");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;

            smtp.Timeout = 30000;

            try
            {

                smtp.Send(mail);
            }
            catch (Exception error)
            {
                estado = false;
                merror = error.Message.ToString();
            }


        }
        public Boolean Estado {
            get { return estado; }
        }
        public String Error {
            get { return merror; }
        }


    }
}