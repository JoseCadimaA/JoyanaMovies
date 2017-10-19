using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MelodyADMIN_RegistUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

        if (String.IsNullOrEmpty(nombre))
        {
            lbValidator.Text = "La casilla Nombre no puede estar vacía";
            return;
        }

        if (String.IsNullOrEmpty(apellido))
        {
            lbValidator.Text = "La casilla Apellido no puede estar vacía";
            return;
        }

        if (String.IsNullOrEmpty(email))
        {
            lbValidator.Text = "La casilla Email no puede estar vacía";
            return;
        }

        if (String.IsNullOrEmpty(password))
        {
            lbValidator.Text = "La casilla Contraseña no puede estar vacía";
            return;
        }

        if (!password.Equals(rePassword))
        {
            lbValidator.Text = "Las casillas de Contraseña no coinciden";
            return;
        }

        UserCLI objTemp = UserCLI_BRL.getUserByEmail(email);
        if (objTemp != null)
        {
            lbValidator.Text = "Ya existe un Usuario con esa dirección de Email";
            return;
        }

        UserCLI obj = new UserCLI()
        {
            Nombre = nombre,
            Apellido = apellido,
            Email = email,
            Password = password
        };

        UserCLI_BRL.insertUserCLI(obj);
        lbValidator.Text = "";

        Session["User"] = obj;
        Response.Redirect("~/JoyanaUSER/Home.aspx");
    }
}