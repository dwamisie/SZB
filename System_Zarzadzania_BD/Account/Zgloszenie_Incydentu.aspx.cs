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

namespace System_Zarzadzania_BD.Account
{
    public partial class Zgloszenie_Incydentu : System.Web.UI.Page
    {

        public string UserName="";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Administrator") && !User.IsInRole("Klient"))
            {
                Response.Redirect("~\\Account\\BrakUprawnien.aspx");
            }

            if(!IsPostBack)
            {
                this.UserName=Context.User.Identity.Name;

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                try
                {
                    conn.Open();

                    SqlCommand comm2 = new SqlCommand();
                    comm2.Connection = conn;
                    comm2.CommandType = CommandType.Text;
                    comm2.CommandText = "select Id from dbo.AspNetUsers where Email='" + this.UserName.Trim()+ "';";
                    SqlDataReader rdr = comm2.ExecuteReader();

                    rdr.Read();
                    this.UserID.Text = rdr[0].ToString();
                    rdr.Dispose();
                    comm2.Dispose();

                    SqlCommand comm = new SqlCommand();
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = "select k.id_klient from dbo.klient k inner join slo.AspNetUserKlient anuk on anuk.id_klient=k.id_klient where anuk.UserID='" + this.UserID.Text.Trim() + "';";
                    SqlDataReader rdr2 = comm.ExecuteReader();

                    rdr2.Read();
                    this.id_klient.Text = rdr2[0].ToString();
                    rdr2.Dispose();
                    comm.Dispose();

                    this.id_produkt.DataBind();

                    conn.Close();

                }
                catch (Exception ex)
                {
                    this.tytul.Text = ex.Message;
                }
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
             SqlConnection conn = new SqlConnection();
             conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
             try
             {
                 conn.Open();

                    SqlCommand comm2 = new SqlCommand();
                    comm2.Connection = conn;
                    comm2.CommandType = CommandType.StoredProcedure;
                    comm2.CommandText = "incydent_insert";
                    comm2.Parameters.AddWithValue("@id_klient", this.id_klient.Text.Trim());
                    comm2.Parameters.AddWithValue("@id_produkt", this.id_produkt.Text.Trim());
                    comm2.Parameters.AddWithValue("@opis", this.opis.Text.Trim());
                    comm2.Parameters.AddWithValue("@zglaszajacy", Context.User.Identity.Name);
                    comm2.Parameters.AddWithValue("@tytul", this.tytul.Text.Trim());
                    comm2.ExecuteNonQuery();
                    comm2.Dispose();

                    conn.Close();

                 //Redirect do strony z komunikatem

                    SmtpClient SMClient = new SmtpClient("poczta.o2.pl");
                    MailMessage msg = new MailMessage(new MailAddress("gruszczynska_katarzyna@o2.pl"), new MailAddress(Context.User.Identity.Name));


                    msg.CC.Add(new MailAddress("marty_w@wp.pl"));

                    msg.Subject = "[SZB] Zarejestrowano incydent.";
                    msg.Body = "<b>Witam! Właśnie został zarejestrowany incydent Pańskiego produktu.</b> <p>________________________________________________</p> <code>Pozdrawiam,Automatyczny system obsługi SZB</code>  <h4>http://www.szb.azurewebsites.net/</h4>";
                    msg.IsBodyHtml = true;

                    NetworkCredential nc = new NetworkCredential("gruszczynska_katarzyna@o2.pl", "7566436629632");
                    SMClient.Credentials = nc;

                    SMClient.Send(msg);

                    SMClient.Dispose();

                }
                catch (Exception ex)
                {
                    this.tytul.Text=ex.Message;
                }
            }
    }
}