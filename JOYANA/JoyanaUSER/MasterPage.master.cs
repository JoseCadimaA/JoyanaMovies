using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MelodyADMIN_MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

        UserCLI obj = (UserCLI)Session["User"];

        if (obj == null)
        {
            itemLogout.Visible = false;
            itemPerfil.Visible = false;

            itemIngresar.Visible = true;
            itemRegistrar.Visible = true;
        }
        else
        {
            itemLogout.Visible = true;
            itemPerfil.Visible = true;
            txtPerfil.InnerText = obj.Nombre;

            itemIngresar.Visible = false;
            itemRegistrar.Visible = false;
        }

        List<Genero> listGeneros = Genero_BRL.GetGeneros();
        string cad = "";
        for (int i = 0; i < listGeneros.Count; i++)
        {
            cad = cad + "<li> <a href='CatalogoPelicula.aspx?Id=" + listGeneros[i].GeneroId + "'>" + listGeneros[i].Nombre + "</a> </li> ";
        }

        LitCategories.Text = cad;
    }


}
