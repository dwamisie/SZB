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
    public partial class Zarzadzanie_bledami_edytuj : System.Web.UI.Page
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
                    comm2.CommandText = "select id_blad, id_produkt, id_typ_bledu, id_warstwa_bledu, kod_bledu, tytul, opis from dbo.blad where id_blad=" + id_pozycji + ";";
                    SqlDataReader rdr = comm2.ExecuteReader();

                    while (rdr.Read())
                    {
                        this.Id_bledu.Text = rdr[0].ToString();
                        this.DropDownList1.SelectedValue = rdr[1].ToString();
                        this.DropDownList2.SelectedValue = rdr[2].ToString();
                        this.DropDownList3.SelectedValue = rdr[3].ToString();
                        this.kod_bledu.Text = rdr[4].ToString();
                        this.tytul.Text = rdr[5].ToString();
                        this.opis.Text = rdr[6].ToString();
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
                comm2.CommandText = "dbo.blad_update";
                comm2.Parameters.AddWithValue("@id_blad", this.Id_bledu.Text.Trim());
                comm2.Parameters.AddWithValue("@id_typ_bledu", this.DropDownList2.Text.Trim());
                comm2.Parameters.AddWithValue("@id_produkt", this.DropDownList1.Text.Trim());
                comm2.Parameters.AddWithValue("@id_warstwa_bledu", this.DropDownList3.Text.Trim());
                comm2.Parameters.AddWithValue("@kod_bledu", "Kod błędu");
                comm2.Parameters.AddWithValue("@opis", this.opis.Text.Trim());

                comm2.ExecuteNonQuery();

                comm2.Dispose();
                conn.Close();

                Response.Redirect("~\\Account\\Zarzadzanie_bledami.aspx" + this.Id_bledu.Text.Trim());

            }
            catch (Exception ex)
            {
                this.opis.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Zarzadzanie_bledami.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //zamkniecie bledu
        }
    }
}