using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Configuration;
using ShopThoiTrang.Entity;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang
{
    public partial class Lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //MailMessage message = new MailMessage(txtemail.Text, "phamxuanduy1996@gmail.com", txtchude.Text, txtnoidung.Text);
            //message.IsBodyHtml = true;
            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;

        }
        public static void Email_Without_Attachment(String toEmail, String Subj, String Message)
        {
            string HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
            string FromEmailid = ConfigurationManager.AppSettings["FromMail"].ToString();
            string Pass = ConfigurationManager.AppSettings["Password"].ToString();
            MailMessage mailMessage = new MailMessage();

            mailMessage.From = new MailAddress(FromEmailid);
            mailMessage.Subject = Subj;
            mailMessage.Body = Message;
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(new MailAddress(toEmail));
            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;
            smtp.EnableSsl = true;
            NetworkCredential NetwordCred = new NetworkCredential();
            NetwordCred.UserName = mailMessage.From.Address;
            NetwordCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetwordCred;
            smtp.Port = 587;
            smtp.Send(mailMessage);
        }
        public void ResetControl()
        {
            txtten.Text = "";
            txtnoidung.Text = "";
            txtemail.Text = "";
            txtdienthoai.Text = "";
            txtdiachi.Text = "";
            txtchude.Text = "";
        }
        protected void btnGui_Click(object sender, EventArgs e)
        {
            //Email_Without_Attachment(txtemail.Text, txtchude.Text, txtnoidung.Text);


            //MailMessage mailMessage = new MailMessage();
            //mailMessage.To.Add("phamthuhuong82@gmail.com");
            //mailMessage.From = new MailAddress(txtemail.Text);
            //mailMessage.Subject = txtchude.Text;
            //mailMessage.Body = txtnoidung.Text;
            //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            //smtpClient.Port = 587;
            //smtpClient.EnableSsl = true;
            //smtpClient.Send(mailMessage);
            Entity.LienLac obj = new Entity.LienLac();
            obj.Ten = txtten.Text;
            obj.DiaChi = txtdiachi.Text;
            obj.DienThoai = txtdienthoai.Text;
            obj.Email = txtemail.Text;
            obj.ChuDe = txtchude.Text;
            obj.NoiDung = txtnoidung.Text;

            if (LienLacService.LienLac_Insert(obj) == true)
                Response.Write("<script>alert('Cám ơn bạn đã gửi phản hồi về cho chúng tối!!!')</script>");
            ResetControl();

        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            ResetControl();
            txtten.Focus();
        }
    }
}