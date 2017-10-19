using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_UserPerfil : System.Web.UI.Page
{
    UserCLI usuarioLogeado;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        UserCLI obj = (UserCLI)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaUSER/LoginUser.aspx");
            return;
        }

        usuarioLogeado = obj;

        txtNombre.Text = obj.Nombre;
        txtApellido.Text = obj.Apellido;
        txtEmail.Text = obj.Email;

        lbValidator.Text = "";
        txtNombre.Enabled = false;
        txtApellido.Enabled = false;
        txtEmail.Enabled = false;        

        pnCurrentPassword.Visible = false;
        PnBtnOptions.Visible = true;
        PnBtnConrfirmation.Visible = false;

        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
            return;
        }
    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";

        txtNombre.Visible = false;
        txtApellido.Visible = false;
        txtEmail.Visible = false;

        txtNewNombre.Visible = true;
        txtNewApellido.Visible = true;
        txtNewEmail.Visible = true;

        txtNewNombre.Text = usuarioLogeado.Nombre;
        txtNewApellido.Text = usuarioLogeado.Apellido;
        txtNewEmail.Text = usuarioLogeado.Email;

        pnCurrentPassword.Visible = true;
        PnBtnOptions.Visible = false;
        PnBtnConrfirmation.Visible = true;        
    }

    protected void btnSaveChange_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";

        string nombre = txtNewNombre.Text;
        string apellido = txtNewApellido.Text;
        string email = txtNewEmail.Text;

        lbValidator.ForeColor = System.Drawing.Color.Red;
        
        if (String.IsNullOrEmpty(nombre.Trim()))
        {
            lbValidator.Text = "Falla al Editar Perfil por que se dejo el campo Nombre Vacío";
            txtNombre.Visible = true;
            txtApellido.Visible = true;
            txtEmail.Visible = true;

            txtNewNombre.Visible = false;
            txtNewApellido.Visible = false;
            txtNewEmail.Visible = false;

            pnCurrentPassword.Visible = false;
            PnBtnOptions.Visible = true;
            PnBtnConrfirmation.Visible = false;
            return;
        }

        if (String.IsNullOrEmpty(apellido.Trim()))
        {
            lbValidator.Text = "Falla al Editar Perfil por que se dejo el campo Apellido Vacío";
            txtNombre.Visible = true;
            txtApellido.Visible = true;
            txtEmail.Visible = true;

            txtNewNombre.Visible = false;
            txtNewApellido.Visible = false;
            txtNewEmail.Visible = false;

            pnCurrentPassword.Visible = false;
            PnBtnOptions.Visible = true;
            PnBtnConrfirmation.Visible = false;
            return;
        }

        if (String.IsNullOrEmpty(email.Trim()))
        {
            lbValidator.Text = "Falla al Editar Perfil por que se dejo el campo Email Vacío";
            txtNombre.Visible = true;
            txtApellido.Visible = true;
            txtEmail.Visible = true;

            txtNewNombre.Visible = false;
            txtNewApellido.Visible = false;
            txtNewEmail.Visible = false;

            pnCurrentPassword.Visible = false;
            PnBtnOptions.Visible = true;
            PnBtnConrfirmation.Visible = false;
            return;
        }

        if (!txtConfirmPass.Text.Equals(usuarioLogeado.Password.Trim()))
        {
            lbValidator.Text = "Falla al Editar Perfil por que la Contraseña es Incorrecta";
            txtNombre.Visible = true;
            txtApellido.Visible = true;
            txtEmail.Visible = true;

            txtNewNombre.Visible = false;
            txtNewApellido.Visible = false;
            txtNewEmail.Visible = false;

            pnCurrentPassword.Visible = false;
            PnBtnOptions.Visible = true;
            PnBtnConrfirmation.Visible = false;
            return;
        }


        usuarioLogeado.Nombre = nombre;
        usuarioLogeado.Apellido = apellido;
        usuarioLogeado.Email = email;

        UserCLI_BRL.updateUserCLI(usuarioLogeado);

        lbValidator.ForeColor = System.Drawing.Color.Green;
        lbValidator.Text = "Perfil Editado Correctamente";

        Response.Redirect("~/JoyanaUSER/UserPerfil.aspx");
        txtNombre.Text = usuarioLogeado.Nombre;
        txtApellido.Text = usuarioLogeado.Apellido;
        txtEmail.Text = usuarioLogeado.Email;

        txtNombre.Visible = true;
        txtApellido.Visible = true;
        txtEmail.Visible = true;

        txtNewNombre.Visible = false;
        txtNewApellido.Visible = false;
        txtNewEmail.Visible = false;

        pnCurrentPassword.Visible = false;
        PnBtnOptions.Visible = true;
        PnBtnConrfirmation.Visible = false;
        
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        txtNombre.Enabled = false;
        txtApellido.Enabled = false;
        txtEmail.Enabled = false;        

        pnCurrentPassword.Visible = false;
        PnBtnOptions.Visible = true;
        PnBtnConrfirmation.Visible = false;
    }
}