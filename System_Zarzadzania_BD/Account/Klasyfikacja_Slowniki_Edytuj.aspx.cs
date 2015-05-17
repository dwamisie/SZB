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
    public partial class Klasyfikacja_Slowniki_Edytuj : System.Web.UI.Page
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
                    comm2.CommandText = "select id_klasyfikacja,nazwa,status from dbo.sKlasyfikacjaWszystkie where id_klasyfikacja=" + id_pozycji + ";";
                    SqlDataReader rdr = comm2.ExecuteReader();

                    while (rdr.Read())
                    {
                        this.kod_klasyfikacji.Text = rdr[0].ToString();
                        this.nazwa.Text = rdr[1].ToString();
                        this.aktywny.Text = rdr[2].ToString();
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
                comm2.CommandText = "dbo.klasyfikacja_update";
                comm2.Parameters.AddWithValue("@id_klasyfikacja", this.kod_klasyfikacji.Text.Trim());
                comm2.Parameters.AddWithValue("@nazwa", this.nazwa.Text.Trim());

                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\Klasyfikacja_Slowniki.aspx");

            }
            catch (Exception ex)
            {

            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Klasyfikacja_Slowniki.aspx");
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
                if (this.aktywny.Text == "AKTYWNY")
                {
                    comm2.CommandText = "dbo.klasyfikacja_close";
                }
                else
                {
                    comm2.CommandText = "dbo.klasyfikacja_open";
                }
                comm2.Parameters.AddWithValue("@id_klasyfikacja", this.kod_klasyfikacji.Text.Trim());
                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\Klasyfikacja_Slowniki.aspx");

            }
            catch (Exception ex)
            {

            }
        }
    }
}