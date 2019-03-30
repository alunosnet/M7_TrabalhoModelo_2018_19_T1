using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_TrabalhoModelo_t1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se existe o cookie
            HttpCookie cookie = Request.Cookies["M7_T1"];
            if (cookie != null)
            {
                divAviso.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //criar um cookie
            HttpCookie cookie = new HttpCookie("M7_T1");
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
            //esconder a div
            divAviso.Visible = false;
        }
    }
}