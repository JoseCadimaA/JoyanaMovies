using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_UsersAdmin_AdmiPerfil : System.Web.UI.Page
{
    UserADM admiLogeado;
    protected void Page_Load(object sender, EventArgs e)
    {
        admiLogeado = (UserADM)Session["User"];
        if (admiLogeado == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
        }

        txtCI.Text = admiLogeado.CI;
        txtNombre.Text = admiLogeado.Nombre;
        txtApellido.Text = admiLogeado.Apellido;
        txtEmail.Text = admiLogeado.Email;
        txtTelefono.Text = admiLogeado.Telefono;
        txtDireccion.Text = admiLogeado.Direccion;

        pnPassword.Visible = false;
        pnBtnConfirm.Visible = false;

        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void btnEditInfo_Click(object sender, EventArgs e)
    {
        txtCI.Visible = false;
        txtNombre.Visible = false;
        txtApellido.Visible = false;
        txtEmail.Visible = false;
        txtTelefono.Visible = false;
        txtDireccion.Visible = false;

        txtNewCI.Visible = true;
        txtNewNombre.Visible = true;
        txtNewApellido.Visible = true;
        txtNewEmail.Visible = true;                
        txtNewTelefono.Visible = true;
        txtNewDireccion.Visible = true;

        txtNewCI.Text = admiLogeado.CI;
        txtNewNombre.Text = admiLogeado.Nombre;
        txtNewApellido.Text = admiLogeado.Apellido;
        txtNewEmail.Text = admiLogeado.Email;
        txtNewTelefono.Text = admiLogeado.Telefono;
        txtNewDireccion.Text = admiLogeado.Direccion;


        pnPassword.Visible = true;
        pnBtnConfirm.Visible = true;
        btnEditInfo.Visible = false;
    }

    protected void btnSaveChange_Click(object sender, EventArgs e)
    {
        string ci = txtNewCI.Text;
        string nombre = txtNewNombre.Text;
        string apellido = txtNewApellido.Text;
        string email = txtNewEmail.Text;
        string telefono = txtNewTelefono.Text;
        string direccion = txtNewDireccion.Text;
        string password = txtPassword.Text.Trim();

        if (String.IsNullOrEmpty(ci))
        {
            lbValidator.Text = "El campo CI no debe estar Vacío";
            goToPerfilInfo();

            return;
        }
        if (String.IsNullOrEmpty(nombre))
        {
            lbValidator.Text = "El campo Nombre no debe estar Vacío";
            goToPerfilInfo();
            return;
        }
        if (String.IsNullOrEmpty(apellido))
        {
            lbValidator.Text = "El campo Apellido no debe estar Vacío";
            goToPerfilInfo();
            return;
        }

        if (String.IsNullOrEmpty(email))
        {
            lbValidator.Text = "El campo Email no debe estar Vacío";
            goToPerfilInfo();
            return;
        }

        if (String.IsNullOrEmpty(telefono))
        {
            lbValidator.Text = "El campo Telefono no debe estar Vacío";
            goToPerfilInfo();
            return;
        }
        if (String.IsNullOrEmpty(direccion))
        {
            lbValidator.Text = "El campo Dirección no debe estar Vacío";
            goToPerfilInfo();
            return;
        }
        if (!password.Equals(admiLogeado.Password.Trim()))
        {
            lbValidator.Text = "Contraseña Incorrecta";
            goToPerfilInfo();
            return;
        }

        admiLogeado.CI = ci;
        admiLogeado.Nombre = nombre;
        admiLogeado.Apellido = apellido;
        admiLogeado.Email = email;
        admiLogeado.Telefono = telefono;
        admiLogeado.Direccion = direccion;

        UserADM_BRL.updateUserADM(admiLogeado);
        Response.Redirect("~/JoyanaADMI/UsersAdmin/AdmiPerfil.aspx");

        goToPerfilInfo();
    }


    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        txtCI.Enabled = false;
        txtNombre.Enabled = false;
        txtApellido.Enabled = false;
        txtEmail.Enabled = false;
        txtTelefono.Enabled = false;
        txtDireccion.Enabled = false;

        pnPassword.Visible = false;
        pnBtnConfirm.Visible = false;
        btnEditInfo.Visible = true;
    }

    public void goToPerfilInfo()
    {
        txtCI.Visible = true;
        txtNombre.Visible = true;
        txtApellido.Visible = true;
        txtEmail.Visible = true;
        txtTelefono.Visible = true;
        txtDireccion.Visible = true;

        txtNewCI.Visible = false;
        txtNewNombre.Visible = false;
        txtNewApellido.Visible = false;
        txtNewEmail.Visible = false;
        txtNewTelefono.Visible = false;
        txtNewDireccion.Visible = false;


        pnPassword.Visible = false;
        pnBtnConfirm.Visible = false;
        btnEditInfo.Visible = true;
    }
}


    