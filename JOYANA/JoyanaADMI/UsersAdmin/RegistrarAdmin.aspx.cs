using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_UsersAdmin_RegistrarAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM obj = (UserADM)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }
        if (!IsPostBack)
        {            
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
        lbValidator.Text = "";
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        string nombre = txtNombre.Text;
        string apellido = txtApellido.Text;
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string rePassword = txtRePassword.Text;
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
        if (String.IsNullOrEmpty(email))
        {
            lbValidator.Text = "La casilla Email no puede estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(password))
        {
            lbValidator.Text = "La casilla Contraseña no puede estar Vacía";
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
        if (!password.Equals(rePassword))
        {
            lbValidator.Text = "Las Contraseñas colocadas no coinciden";
            return;
        }
        UserADM temp = UserADM_BRL.getUserAdmByCI(ci);
        if (temp != null)
        {
            lbValidator.Text = "Ya existe un Administrador registrado con ese CI";
            return;
        }

        temp = UserADM_BRL.getUserAdmByEmail(email);
        if (temp != null)
        {
            lbValidator.Text = "Ya existe un Administrador registrado con ese Email";
            return;
        }

        UserADM obj = new UserADM()
        {
            Nombre = nombre,
            Apellido = apellido,
            Email = email,
            Password = password,
            CI = ci,
            Telefono = telefono,
            Direccion = direccion
        };


        int codigoAdmi = UserADM_BRL.insertUserADM(obj);
        AdmiPermiso admPerm;
        Permiso tempPerm;
        //Le inserto los permisos
        
        for (int i = 0; i < checkPermisos.Items.Count; i++)
        {
            if (checkPermisos.Items[i].Selected)
            {
                tempPerm = Permiso_BRL.getPermisoByDescription(checkPermisos.Items[i].Text);
                admPerm = new AdmiPermiso()
                {
                    UserAdmId = codigoAdmi,
                    PermisoId = tempPerm.PermisoId
                };

                AdmiPermiso_BRL.insertAdmiPermiso(admPerm);
            }                    
        }

               
        lbValidator.Text = "";
        Response.Redirect("~/JoyanaADMI/UsersAdmin/ListAdmins.aspx");
        
    }
    
}