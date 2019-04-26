using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_TrabalhoModelo_t1.Aluno
{
    public partial class notas_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se tem sessão iniciada?
            if (Session["perfil"] == null)
                Response.Redirect("~/index.aspx");
            //verificar se é aluno?
            if (Session["perfil"].Equals("1") == false)
                Response.Redirect("~/index.aspx");
        }
    }
}