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
    public partial class moje_incydenty_edytuj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_incydent = this.Request.QueryString["id"].ToString();
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                try
                {
                    conn.Open();

                    SqlCommand comm2 = new SqlCommand();
                    comm2.Connection = conn;
                    comm2.CommandType = CommandType.StoredProcedure;
                    comm2.CommandText = "incydent_szczegoly";
                    comm2.Parameters.AddWithValue("@id_incydent", id_incydent.Trim());
                    SqlDataReader rdr = comm2.ExecuteReader();

                    rdr.Read();

                    this.Id_incydent.Text = rdr["id_incydent"].ToString().Trim();
                    this.nazwa_klienta.Text = rdr["nazwa"].ToString().Trim();
                    this.DropDownList1.SelectedValue = rdr["id_produkt"].ToString().Trim();
                    this.TytulIncydentu.Text = rdr["tytul"].ToString().Trim();
                    this.OpisIncydentu.Text = rdr["opis"].ToString().Trim();
                    this.DropDownList2.SelectedValue = rdr["id_klasyfikacja"].ToString().Trim();
                    this.DropDownList3.SelectedValue = rdr["id_status"].ToString().Trim();


                    rdr.Dispose();
                    comm2.Dispose();

                    conn.Close();

                }
                catch (Exception ex)
                {
                    this.DiagnozaIncydentu.Text = ex.Message;
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
                comm2.CommandText = "dbo.incydent_update";
                comm2.Parameters.AddWithValue("@id_incydent", this.Id_incydent.Text.Trim());
                comm2.Parameters.AddWithValue("@id_produkt", this.DropDownList1.Text.Trim());
                comm2.Parameters.AddWithValue("@id_klasyfikacja", this.DropDownList2.Text.Trim());
                comm2.Parameters.AddWithValue("@id_status", this.DropDownList3.Text.Trim());
                comm2.Parameters.AddWithValue("@diagnoza", this.DiagnozaIncydentu.Text.Trim());
        
                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\moje_incydenty.aspx");

            }
            catch (Exception ex)
            {

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\moje_incydenty.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\kontakt_ze_zglaszajacym.aspx?id=" + this.Id_incydent.Text.Trim());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Eskalacja.aspx?id=" + this.Id_incydent.Text.Trim());
        }
    }
}