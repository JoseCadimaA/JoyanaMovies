using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_CatalogoPelicula : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cadGeneroId = Request.Params["Id"];
        if (String.IsNullOrEmpty(cadGeneroId))
        {
            return;
        }

        int idGenero = Convert.ToInt32(cadGeneroId);
        Genero obj = Genero_BRL.GetGeneroByID(idGenero);
        lbTitle.InnerText = obj.Nombre;

        cargarPeliculas(idGenero);
        if (!IsPostBack)
        {
            
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    public void cargarPeliculas(int idGenero)
    {
        List<Pelicula> listPeliculas = PeliculaGenero_BRL.GetPeliculasByGenero(idGenero);
        ListPeliculas.DataSource = listPeliculas;
        ListPeliculas.DataBind();
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