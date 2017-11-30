using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Transaction_ListAlquileres : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM obj = (UserADM)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }

        cargarAlquileres();
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void GridAlquileres_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int AlquilerID = 0;
        try
        {
            AlquilerID = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (AlquilerID <= 0)
            return;

        if (e.CommandName == "Report")
        {
            Response.Redirect("ImpReportAlquiler.aspx?Id=" + AlquilerID);
        }
    }

    public void cargarAlquileres()
    {
        List<Alquiler> listAlquileres = Alquiler_BRL.GetAllAlquileres();
        GridAlquileres.DataSource = listAlquileres;
        GridAlquileres.DataBind();
    }
}