using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MelodyADMIN_LoginAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["User"] = null;
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string password = txtPassword.Text;

        if (String.IsNullOrEmpty(email))
        {
            lbValidator.Text = "El campo Email no debe estar Vacío";
            return;
        }

        if (String.IsNullOrEmpty(password))
        {
            lbValidator.Text = "El campo Contraseña no debe estar Vacío";
            return;
        }

        UserCLI obj = UserCLI_BRL.getUserByEmail(email);
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

        Response.Redirect("~/JoyanaUSER/Home.aspx");        

    }
}