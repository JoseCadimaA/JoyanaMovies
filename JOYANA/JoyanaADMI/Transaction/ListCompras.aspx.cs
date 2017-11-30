using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Transaction_ListCompras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserADM obj = (UserADM)Session["User"];
        if (obj == null)
        {
            Response.Redirect("~/JoyanaADMI/UsersAdmin/LoginAdmin.aspx");
            return;
        }

        cargarCompras();
        if (!IsPostBack)
        {
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }

    protected void GridCompras_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int CompraId = 0;
        try
        {
            CompraId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (CompraId <= 0)
            return;

        if (e.CommandName == "Report")
        {
            Response.Redirect("ImpReportCompra.aspx?Id=" + CompraId);
        }
    }

    public void cargarCompras()
    {
        List<Compra> listCompras = Compra_BRL.GetAllCompras();
        GridCompras.DataSource = listCompras;
        GridCompras.DataBind();
    }
}