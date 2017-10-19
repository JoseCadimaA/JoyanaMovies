using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_UsersAdmin_EditAdmi : System.Web.UI.Page
{
    UserADM admiLogeado;
    UserADM objSelected;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM admiLogeado = (UserADM)Session["User"];
        if (admiLogeado == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }


        string strId = Request.Params["Id"];
        int id = 0;
        try
        {
            id = Convert.ToInt32(strId);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        if (id <= 0)
        {
            return;
        }
        UserADM obj = UserADM_BRL.getUserAdmByID(id);
        objSelected = obj;
        if (!IsPostBack)
        {
            txtCI.Text = obj.CI.Trim();
            txtNombre.Text = obj.Nombre.Trim();
            txtApellido.Text = obj.Apellido.Trim();
            txtTelefono.Text = obj.Telefono.Trim();
            txtDireccion.Text = obj.Direccion.Trim();

            Permiso perm;
            for (int i = 0; i < checkPermisos.Items.Count; i++)
            {
                perm = Permiso_BRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                if (AdmiPermiso_BRL.tienePermiso(obj.UserId, perm.PermisoId))
                {
                    checkPermisos.Items[i].Selected = true;
                }
            }
        }



        
        


        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void btnSaveChange_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        string nombre = txtNombre.Text;
        string apellido = txtApellido.Text;
        string ci = txtCI.Text;
        string telefono = txtTelefono.Text;
        string direccion = txtDireccion.Text;

        if (String.IsNullOrEmpty(ci))
        {
            lbValidator.Text = "La casilla CI no puede estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(nombre))
        {
            lbValidator.Text = "La casilla Nombre no puede estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(apellido))
        {
            lbValidator.Text = "La casilla Apellido no puede estar Vacía";
            return;
        }

        if (String.IsNullOrEmpty(telefono))
        {
            lbValidator.Text = "La casilla Telefono no puede estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(direccion))
        {
            lbValidator.Text = "La casilla Dirección no puede estar Vacía";
            return;
        }

        objSelected.Nombre = nombre;
        objSelected.Apellido = apellido;
        objSelected.CI = ci;
        objSelected.Telefono = telefono;
        objSelected.Direccion = direccion;


        UserADM_BRL.updateUserADM(objSelected);

        Permiso perm;
        for (int i = 0; i < checkPermisos.Items.Count; i++)
        {

            if (checkPermisos.Items[i].Selected)
            {
                perm = Permiso_BRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                if (!AdmiPermiso_BRL.tienePermiso(objSelected.UserId, perm.PermisoId))
                {
                    //Actualizar
                    AdmiPermiso admPerm = new AdmiPermiso()
                    {
                        UserAdmId = objSelected.UserId,
                        PermisoId = perm.PermisoId
                    };

                    AdmiPermiso_BRL.insertAdmiPermiso(admPerm);
                }

            }
            else
            {
                perm = Permiso_BRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                if (AdmiPermiso_BRL.tienePermiso(objSelected.UserId, perm.PermisoId))
                {
                    //Eliminar
                    
                    AdmiPermiso_BRL.deleteAdmiPermiso(objSelected.UserId, perm.PermisoId);
                }
            }

        }
    }
}