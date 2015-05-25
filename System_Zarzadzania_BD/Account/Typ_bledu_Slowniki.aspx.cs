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
    public partial class Typ_bledu_Slowniki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nowe_id = "";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = "dbo.typ_bledu_insert";
                comm.Parameters.AddWithValue("@nazwa", "Nowy typ błędu");
                comm.ExecuteNonQuery();
                comm.Dispose();

                SqlCommand comm2 = new SqlCommand();
                comm2.Connection = conn;
                comm2.CommandType = CommandType.Text;
                comm2.CommandText = "select max(id_typ_bledu) from slo.typ_bledu";
                SqlDataReader rdr = comm2.ExecuteReader();

                while (rdr.Read())
                {
                    nowe_id = rdr[0].ToString();
                }
                rdr.Dispose();
                comm2.Dispose();

                conn.Close();

                Response.Redirect("~\\Account\\Typ_bledu_Slowniki_Edytuj.aspx?id=" + nowe_id);

            }
            catch (Exception ex)
            {

            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Typ_bledu_Slowniki_Edytuj.aspx?id=" + this.GridView1.SelectedRow.Cells[0].Text.Trim());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\Slowniki.aspx");
        }
    }
}