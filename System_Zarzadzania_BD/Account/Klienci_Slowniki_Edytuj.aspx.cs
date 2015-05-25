using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace System_Zarzadzania_BD.Account
{
    public partial class Klienci_Slowniki_Edytuj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_pozycji = this.Request.QueryString["id"].ToString();
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                try
                {
                    conn.Open();

                    SqlCommand comm2 = new SqlCommand();
                    comm2.Connection = conn;
                    comm2.CommandType = CommandType.Text;
                    comm2.CommandText = "select id_klient, NIP, nazwa, ulica, nr, miejscowosc, kod_pocztowy, poczta, wojewodztwo, kraj, telefon, email, uwagi from dbo.klient where id_klient=" + id_pozycji + ";";
                    SqlDataReader rdr = comm2.ExecuteReader();

                    while (rdr.Read())
                    {
                        this.kod_klienta.Text = rdr[0].ToString();
                        this.NIP.Text = rdr[1].ToString();
                        this.nazwa.Text = rdr[2].ToString();
                        this.ulica.Text = rdr[3].ToString();
                        this.numer.Text = rdr[4].ToString();
                        this.miejscowosc.Text = rdr[5].ToString();
                        this.kod_pocztowy.Text = rdr[6].ToString();
                        this.poczta.Text = rdr[7].ToString();
                        this.wojewodztwo.Text = rdr[8].ToString();
                        this.kraj.Text = rdr[9].ToString();
                        this.telefon.Text = rdr[10].ToString();
                        this.email.Text = rdr[11].ToString();
                        this.uwagi.Text = rdr[12].ToString();
                    }
                    rdr.Dispose();
                    comm2.Dispose();

                    conn.Close();

                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();

                SqlCommand comm2 = new SqlCommand();
                comm2.Connection = conn;
                comm2.CommandType = CommandType.StoredProcedure;
                //update
                comm2.CommandText = "dbo.klient_update";
                comm2.Parameters.AddWithValue("@id_klient", this.kod_klienta.Text.Trim());
                comm2.Parameters.AddWithValue("@NIP", this.NIP.Text.Trim());
                comm2.Parameters.AddWithValue("@nazwa", this.nazwa.Text.Trim());
                comm2.Parameters.AddWithValue("@ulica", this.ulica.Text.Trim());
                comm2.Parameters.AddWithValue("@nr", this.numer.Text.Trim());
                comm2.Parameters.AddWithValue("@miejscowosc", this.miejscowosc.Text.Trim());
                comm2.Parameters.AddWithValue("@kod_pocztowy", this.kod_pocztowy.Text.Trim());
                comm2.Parameters.AddWithValue("@poczta", this.poczta.Text.Trim());
                comm2.Parameters.AddWithValue("@wojewodztwo",  this.wojewodztwo.Text.Trim());
                comm2.Parameters.AddWithValue("@kraj", this.kraj.Text.Trim());
                comm2.Parameters.AddWithValue("@telefon",  this.telefon.Text.Trim());
                comm2.Parameters.AddWithValue("@email", this.email.Text.Trim());
                comm2.Parameters.AddWithValue("@uwagi", this.uwagi.Text.Trim());

                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\Klienci_Slowniki.aspx");

            }
            catch (Exception ex)
            {
                this.uwagi.Text = ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Klienci_Slowniki.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();

                SqlCommand comm2 = new SqlCommand();
                comm2.Connection = conn;
                comm2.CommandType = CommandType.StoredProcedure;
                comm2.CommandText = "dbo.klient_produkt_insert";
                comm2.Parameters.AddWithValue("@id_klient", this.kod_klienta.Text.Trim());
                comm2.Parameters.AddWithValue("@id_produkt", this.kod_produktu.SelectedValue.ToString().Trim());

                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                this.GridView1.DataBind();
                this.kod_produktu.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();

                SqlCommand comm2 = new SqlCommand();
                comm2.Connection = conn;
                comm2.CommandType = CommandType.StoredProcedure;
                comm2.CommandText = "dbo.klient_produkt_close";
                comm2.Parameters.AddWithValue("@id_klient", this.kod_klienta.Text.Trim());
                comm2.Parameters.AddWithValue("@id_produkt", this.GridView1.SelectedRow.Cells[0].Text.ToString().Trim());
                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                this.GridView1.DataBind();
                this.kod_produktu.DataBind();

            }
            catch (Exception ex)
            {
                this.Literal1.Text = ex.Message;
            }

        }

     }
}