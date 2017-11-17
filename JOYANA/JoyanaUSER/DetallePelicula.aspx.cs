using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaUSER_DetallePelicula : System.Web.UI.Page
{
    UserCLI userLogeado;
    Pelicula objSelected;
    Compra tempCompra;
    Alquiler tempAlquiler;
    protected void Page_Load(object sender, EventArgs e)
    {
        userLogeado = (UserCLI)Session["User"];
        //lbValidator.Visible = false;        
        if (!IsPostBack)
        {
            objSelected = null;
            tempCompra = null;
            tempAlquiler = null;
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }       

        string cadPeliculaId = Request.Params["Id"];
        if (String.IsNullOrEmpty(cadPeliculaId))
        {
            lbNombrePeli.InnerText = "Error 404 Not Found";
            return;
        }

        int idPelicula = Convert.ToInt32(cadPeliculaId);
        objSelected = Pelicula_BRL.GetPeliculaByID(idPelicula);

        Youtube.Src = "https://www.youtube.com/embed/" + objSelected.TrailerCode;
        lbNombrePeli.InnerText = objSelected.Nombre;
        txtDecripcion.InnerText = objSelected.Descripcion;
        txtDirector.InnerText = objSelected.Director;
        txtElenco.InnerText = objSelected.Elenco;
        txtPrecioVenta.InnerText = objSelected.PrecioVenta + " BS";
        txtPrecioAlquiler.InnerText = objSelected.PrecioAlquiler + " BS";
        if (userLogeado == null)
        {
            btnAlquilarSel.Visible = false;
            btnComprarSel.Visible = false;
            return;
        }

        tempCompra = Compra_BRL.GetTransaction(userLogeado.UserId, objSelected.PeliculaId);
        if (tempCompra != null)
        {
            if (tempCompra.Estado)
            {
                btnAlquilarSel.Visible = false;
                btnComprarSel.Visible = false;
            }
        }

        tempAlquiler = Alquiler_BRL.GetTransactionAlq(userLogeado.UserId, objSelected.PeliculaId);
        if (tempAlquiler != null)
        {
            if (tempAlquiler.Estado)
            {
                btnAlquilarSel.Visible = false;
                btnComprarSel.Visible = false;
            }
        }

        txtNombrePropie.Text = userLogeado.Nombre + " " + userLogeado.Apellido;
        alq_txtNomPropie.Text = userLogeado.Nombre + " " + userLogeado.Apellido;        
        alq_txtCostoAlquixDia.Text = objSelected.PrecioAlquiler + " BS";
    }

    protected void btnConfirmCompra_Click(object sender, EventArgs e)
    {
        DateTime fechaActual = DateTime.Now;
        string numTarjeta = txtNumTarjeta.Text.Trim();
        string codigoTarjeta = txtCodeTarjeta.Text.Trim();

        if (tempCompra == null)
        {
            Compra obj = new Compra()
            {
                Fecha = fechaActual,
                TotalPago = objSelected.PrecioVenta,
                TarjetaCredito = numTarjeta,
                CodigoTarjeta = codigoTarjeta,
                Estado = true,
                PeliculaId = objSelected.PeliculaId,
                UserId = userLogeado.UserId
            };

            Compra_BRL.InsertCompra(obj);
        } else
        {
            tempCompra.Fecha = fechaActual;
            tempCompra.TarjetaCredito = numTarjeta;
            tempCompra.CodigoTarjeta = codigoTarjeta;
            tempCompra.Estado = true;
            Compra_BRL.UpdateCompra(tempCompra);
        }

        tempCompra = null;
        Response.Redirect("DetallePelicula.aspx?Id=" + objSelected.PeliculaId);
    }

    protected void btnConfirmAlquiler_Click(object sender, EventArgs e)
    {
        int diasxAlquilar = Convert.ToInt32(alq_txtDiasxAlquilar.Text.Trim(), CultureInfo.InvariantCulture);
        decimal totalPago = objSelected.PrecioAlquiler * diasxAlquilar;
        DateTime fechaAlqui = DateTime.Now;
        DateTime fechaDevol = fechaAlqui.AddDays(diasxAlquilar);
        string tarjetaCredit = alq_txtNumTarjeta.Text.Trim(); 
        string codigoTarjeta = alq_txtCodigoTarjeta.Text.Trim();

        if (tempAlquiler == null)
        {
            Alquiler obj = new Alquiler()
            {
                TotalPago = totalPago,
                FechaAlqui = fechaAlqui,
                FechaDevol = fechaDevol,
                TarjetaCredito = tarjetaCredit,
                CodigoTarjeta = codigoTarjeta,
                Estado = true,
                UserId = userLogeado.UserId,
                PeliculaId = objSelected.PeliculaId
            };

            Alquiler_BRL.InsertAlquiler(obj);
        }
        else
        {
            tempAlquiler.TotalPago = totalPago;
            tempAlquiler.FechaAlqui = fechaAlqui;
            tempAlquiler.FechaDevol = fechaDevol;
            tempAlquiler.TarjetaCredito = tarjetaCredit;
            tempAlquiler.CodigoTarjeta = codigoTarjeta;
            tempAlquiler.Estado = true;

            Alquiler_BRL.UpdateAlquiler(tempAlquiler);
        }

        tempAlquiler = null;
        Response.Redirect("DetallePelicula.aspx?Id=" + objSelected.PeliculaId);
    }
}