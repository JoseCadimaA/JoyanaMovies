using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_MovieView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }

        string cadPeliculaId = Request.Params["Id"];
        if (String.IsNullOrEmpty(cadPeliculaId))
        {
            lbNombrePeli.InnerText = "Error 404 Not Found";
            return;
        }

        int idPelicula = Convert.ToInt32(cadPeliculaId);
        Pelicula objSelected = Pelicula_BRL.GetPeliculaByID(idPelicula);

        Youtube.Src = "https://www.youtube.com/embed/" + objSelected.MovieCode;
        lbNombrePeli.InnerText = objSelected.Nombre;
        txtDecripcion.InnerText = objSelected.Descripcion;
    }
}