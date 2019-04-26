using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_TrabalhoModelo_t1.Admin.Alunos
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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //if (args.Value.Contains("-") == true)
            //    args.IsValid = true;
            //else
            //    args.IsValid = false;
            if (args.Value.IndexOf('-') == 4)
                args.IsValid = true;
            else
            {
                args.IsValid = false;
                return;
            }
            //verificar se antes e depois temos numeros
            string[] valores = args.Value.Split('-');
            int n1 = 0, n2 = 0;
            if(int.TryParse(valores[0],out n1)==false)
            {
                args.IsValid = false;
                return;
            }
            if (int.TryParse(valores[1], out n2) == false)
            {
                args.IsValid = false;
                return;
            }
        }
    }
}