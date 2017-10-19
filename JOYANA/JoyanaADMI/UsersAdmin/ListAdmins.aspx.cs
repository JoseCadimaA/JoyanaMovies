using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_UsersAdmin_ListAdmins : System.Web.UI.Page
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
        Permiso permAddAdmin = Permiso_BRL.getPermisoByDescription("Registrar Administrador");

       
        if (!AdmiPermiso_BRL.tienePermiso(obj.UserId, permAddAdmin.PermisoId))
        {
            itemAddAdmi.Visible = false;
        } else
        {
            itemAddAdmi.Visible = true;
        }

        //Validacion si puede eliminar Admins
        permAddAdmin = Permiso_BRL.getPermisoByDescription("Eliminar Administrador");
        if ((!AdmiPermiso_BRL.tienePermiso(obj.UserId, permAddAdmin.PermisoId)))
        {
            GridAdmins.Columns[0].Visible = false;
        } else
        {
            GridAdmins.Columns[0].Visible = true;
        }

        cargarAdmins();

        if (!IsPostBack)
        {
            cargarAdmins();
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void GridAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int UserAdmId = 0;
        try
        {
            UserAdmId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (UserAdmId <= 0)
            return;

        if (e.CommandName == "Eliminar")
        {
            try
            {
                AdmiPermiso_BRL.deleteAdmiPermisAll(UserAdmId);
                UserADM_BRL.deleteUserADM(UserAdmId);
                cargarAdmins();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                throw new Exception("Error al eliminar");
            }
        }
        if (e.CommandName == "Editar")
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/EditAdmi.aspx?Id=" + UserAdmId.ToString());
            return;
        }
    }

    public void cargarAdmins()
    {
        List<UserADM> admins = UserADM_BRL.GetAdmins();
        GridAdmins.DataSource = admins;
        GridAdmins.DataBind();
    }
}