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
    public partial class Eskalacja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "dbo.incydent_powiaz_blad";
                comm.Parameters.AddWithValue("@id_incydent", this.Request.QueryString["id"].ToString().Trim());
                comm.Parameters.AddWithValue("@id_blad", this.DropDownList1.Text.Trim());

                comm.ExecuteNonQuery();
                comm.Dispose();

                conn.Close();

                Response.Redirect("~\\Account\\moje_incydenty.aspx?id=" + this.Request.QueryString["id"].ToString().Trim());

            }
            catch (Exception ex)
            {
                this.Literal1.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "dbo.nowy_blad";
                comm.Parameters.AddWithValue("@id_incydent", this.Request.QueryString["id"].ToString().Trim());
                comm.Parameters.AddWithValue("@tytul", this.nBlad_tytul.Text);
                comm.Parameters.AddWithValue("@opis", this.nBlad_opis.Text);
                comm.ExecuteNonQuery();
                comm.Dispose();

                
                conn.Close();

                Response.Redirect("~\\Account\\moje_incydenty.aspx?id=" + this.Request.QueryString["id"].ToString().Trim());

            }
            catch (Exception ex)
            {

            }
        }

    }
}