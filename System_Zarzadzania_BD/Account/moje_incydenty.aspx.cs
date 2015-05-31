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
    public partial class moje_incydenty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Response.Redirect("~\\Account\\moje_incydenty_edytuj.aspx?id=" + this.GridView1.SelectedRow.Cells[0].Text.Trim()); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             Response.Redirect("~\\Account\\Incydent.aspx");
        }
    }
}