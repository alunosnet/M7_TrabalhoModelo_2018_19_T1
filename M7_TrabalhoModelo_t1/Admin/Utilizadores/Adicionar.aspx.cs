using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_TrabalhoModelo_t1.Admin.Utilizadores
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se tem sessão iniciada?
            if (Session["perfil"] == null)
                Response.Redirect("~/index.aspx");
            //verificar se é admin?
            if (Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");
        }
    }
}