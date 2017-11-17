using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_Bilbioteca : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserCLI obj = (UserCLI)Session["User"];
        if (obj == null)
        {            
            return;
        }
        if (!IsPostBack)
        {
            cargarPeliculas(obj.UserId);
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }


    protected void ListBiblioteca_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int peliculaId = 0;
        try
        {
            peliculaId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        if (peliculaId <= 0)
            return;

        if (e.CommandName == "ViewMovie")
        {
            Response.Redirect("MovieView.aspx?Id=" + peliculaId.ToString());
            return;
        }
    }

    public void cargarPeliculas(int UserId)
    {
        List<Transaction> listTransact = Compra_BRL.GetAllTransactionByUserId(UserId);
        ListBiblioteca.DataSource = listTransact;
        ListBiblioteca.DataBind();
    }
}