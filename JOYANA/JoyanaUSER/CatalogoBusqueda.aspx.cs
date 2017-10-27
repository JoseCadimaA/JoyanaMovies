using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_CatalogoBusqueda : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string nombre = Request.Params["Name"];
        if (String.IsNullOrEmpty(nombre))
        {
            return;
        }

        lbTitle.InnerText = "Busqueda: " + nombre;
        List<Pelicula> listPeliculas = Pelicula_BRL.GetBusqueda(nombre);
        ListPeliculas.DataSource = listPeliculas;
        ListPeliculas.DataBind();

        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }    

    protected void ListPeliculas_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int peliculaId = 0;
        try
        {
            peliculaId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        if (peliculaId <= 0)
            return;

        if (e.CommandName == "VerPelicula")
        {
            Response.Redirect("~/JoyanaUSER/DetallePelicula.aspx?Id=" + peliculaId.ToString());
            return;
        }
    }
}