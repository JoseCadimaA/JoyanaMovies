using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_UsersAdmin_LoginAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        Session["User"] = null;
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        lbValidator.Text = "";
        string email = txtEmail.Text;
        string password = txtPassword.Text;

        if (String.IsNullOrEmpty(email))
        {
            lbValidator.Text = "La casilla Email no debe estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(password))
        {
            lbValidator.Text = "La casilla Contraseña no debe estar Vacía";
            return;
        }
        UserADM obj = UserADM_BRL.getUserAdmByEmail(email);
        if (obj == null)
        {
            lbValidator.Text = "El email no se encuentra registrado en el Sistema";
            return;
        }
        if (!password.Equals(obj.Password.Trim()))
        {
            lbValidator.Text = "Contraseña Incorrecta";
            return;
        }

        Session["User"] = obj;
        Response.Redirect("~/JoyanaADMI/UsersAdmin/ListAdmins.aspx");
        lbValidator.Text = "";
    }
}