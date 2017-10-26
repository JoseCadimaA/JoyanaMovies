using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_DetallePelicula : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Pelicula objSelected;
        if (!IsPostBack)
        {
            objSelected = null;
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }

        string cadPeliculaId = Request.Params["Id"];
        if (String.IsNullOrEmpty(cadPeliculaId))
        {
            lbPrueba.InnerText = "Error 404 Not Found";
            return;
        }

        int idPelicula = Convert.ToInt32(cadPeliculaId);
        objSelected = Pelicula_BRL.GetPeliculaByID(idPelicula);
        lbPrueba.InnerText = objSelected.Nombre;
    }
}