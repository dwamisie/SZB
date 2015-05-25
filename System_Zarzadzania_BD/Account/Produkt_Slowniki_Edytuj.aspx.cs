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
    public partial class Produkt_Slowniki_Edytuj : System.Web.UI.Page
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
                    comm2.CommandText = "select id_produkt, nazwa, wersja, opis from dbo.produkt where id_produkt=" + id_pozycji + ";";
                    SqlDataReader rdr = comm2.ExecuteReader();

                    while (rdr.Read())
                    {
                        this.kod_produktu.Text = rdr[0].ToString();
                        this.nazwa.Text = rdr[1].ToString();
                        this.wersja.Text = rdr[2].ToString();
                        this.opis.Text = rdr[3].ToString();
                        this.data_produktu.Text = rdr[4].ToString();
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
                comm2.CommandText = "dbo.produkt_update";
                comm2.Parameters.AddWithValue("@id_produkt", this.kod_produktu.Text.Trim());
                comm2.Parameters.AddWithValue("@nazwa", this.nazwa.Text.Trim());
                comm2.Parameters.AddWithValue("@wersja", this.wersja.Text.Trim());
                comm2.Parameters.AddWithValue("@opis", this.opis.Text.Trim());

                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\Produkty_Slowniki.aspx");

            }
            catch (Exception ex)
            {
               
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Produkty_Slowniki.aspx");
        }

    }
}