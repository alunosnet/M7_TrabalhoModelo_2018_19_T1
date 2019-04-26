using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_TrabalhoModelo_t1
{
    public partial class detalhes_curso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //curso
                string curso = Request["q"].ToString();
                //criar cookie
                HttpCookie cookie = new HttpCookie("curso", curso);
                cookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cookie);
            }catch{
                Response.Redirect("index.aspx");
            }
        }
    }
}