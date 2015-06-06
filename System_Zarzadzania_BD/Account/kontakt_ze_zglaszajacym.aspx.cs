using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace System_Zarzadzania_BD.Account
{
    public partial class kontakt_ze_zglaszajacym : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    this.id_incydentu.Text = this.Request.QueryString["id"].ToString().Trim();
                }
                catch
                {
                    this.id_incydentu.Text = "0";
                }
            }
        }

        protected void WyslijDiag_Click(object sender, EventArgs e)
        {
            SmtpClient SMClient = new SmtpClient(ConfigurationManager.AppSettings["SMTP_server"].ToString());
            MailMessage msg = new MailMessage(new MailAddress(ConfigurationManager.AppSettings["MAilMsgFrom"].ToString()), new MailAddress(Context.User.Identity.Name));

            msg.CC.Add(new MailAddress(ConfigurationManager.AppSettings["MAilMsgCC"].ToString()));
            msg.Subject = "[SZB] Prośba o dodatkowe informacje o incydencie.";
            msg.Body = this.Diagnosta.Text;

            msg.IsBodyHtml = true;
            NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTP_user"].ToString(), ConfigurationManager.AppSettings["SMTP_user"].ToString());
            SMClient.Credentials = nc;

            SMClient.Send(msg);
            SMClient.Dispose();
        }
    }
}