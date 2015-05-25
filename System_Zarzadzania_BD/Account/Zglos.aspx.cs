﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace System_Zarzadzania_BD.Account
{
    public partial class Zglos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Administrator") && !User.IsInRole("Klient"))
            {
                Response.Redirect("~\\Account\\BrakUprawnien.aspx");
            }
        }
    }
}