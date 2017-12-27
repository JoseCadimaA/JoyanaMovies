using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Transaction_ListFavoritos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM obj = (UserADM)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }

        cargarFavoritas();
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void GridFavoritos_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    public void cargarFavoritas()
    {
        List<Favoritos> listFavoritos = Like_BRL.GetFavoritos();
        GridFavoritos.DataSource = listFavoritos;
        GridFavoritos.DataBind();
    }
}