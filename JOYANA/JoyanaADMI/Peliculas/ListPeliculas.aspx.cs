using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Productos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM obj = (UserADM)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }
        //Validacion si puede registrar admins
        Permiso permAddAdmin = Permiso_BRL.getPermisoByDescription("Añadir Peliculas");


        if (!AdmiPermiso_BRL.tienePermiso(obj.UserId, permAddAdmin.PermisoId))
        {
            itemAddPelicula.Visible = false;
        }
        else
        {
            itemAddPelicula.Visible = true;
        }

        //Validacion si puede Editar Admins
        permAddAdmin = Permiso_BRL.getPermisoByDescription("Editar Peliculas");
        if ((!AdmiPermiso_BRL.tienePermiso(obj.UserId, permAddAdmin.PermisoId)))
        {
            GridPeliculas.Columns[4].Visible = false;
        }
        else
        {
            GridPeliculas.Columns[4].Visible = true;
        }

        //Validacion si puede eliminar Admins
        permAddAdmin = Permiso_BRL.getPermisoByDescription("Eliminar Peliculas");
        if ((!AdmiPermiso_BRL.tienePermiso(obj.UserId, permAddAdmin.PermisoId)))
        {
            GridPeliculas.Columns[5].Visible = false;
        }
        else
        {
            GridPeliculas.Columns[5].Visible = true;
        }



        cargarPeliculas();
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void GridPeliculas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int peliculaId = 0;
        try
        {
            peliculaId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (peliculaId <= 0)
            return;

        if (e.CommandName == "Eliminar")
        {
            try
            {
                Pelicula_BRL.DeletePelicula(peliculaId);
                cargarPeliculas();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                throw new Exception("Error al eliminar");
            }
        }
        if (e.CommandName == "Editar")
        {
            Response.Redirect("~/JoyanaADMI/Peliculas/FormPeliculas.aspx?Id=" + peliculaId.ToString());
            return;
        }
    }

    public void cargarPeliculas()
    {
        List<Pelicula> listPeliculas = Pelicula_BRL.GetPeliculas();
        GridPeliculas.DataSource = listPeliculas;
        GridPeliculas.DataBind();
    }
}