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
    Like tempLike;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        userLogeado = (UserCLI)Session["User"];
        
        LikeIcon.Text = "<i class='fa fa-thumbs-o-up'></i>"; //No selected
        DislikeIcon.Text = "<i class='fa fa-thumbs-o-down'></i>"; //No selected
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
        cargarComentarios();

        lbCantLikes.Text = Like_BRL.GetCantLikes(objSelected.PeliculaId) + " ";
        lbCantDislikes.Text = Like_BRL.GetCantDisLikes(objSelected.PeliculaId) + "";

        Youtube.Src = "https://www.youtube.com/embed/" + objSelected.TrailerCode;
        lbNombrePeli.InnerText = objSelected.Nombre;
        txtDecripcion.InnerText = objSelected.Descripcion;
        txtDirector.InnerText = objSelected.Director;
        txtElenco.InnerText = objSelected.Elenco;
        txtPrecioVenta.InnerText = objSelected.PrecioVenta + " BS";
        txtPrecioAlquiler.InnerText = objSelected.PrecioAlquiler + " BS";        
        if (userLogeado == null)
        {
            btnLike.Enabled = false;
            btnDislike.Enabled = false;
            btnAlquilarSel.Visible = false;
            btnComprarSel.Visible = false;
            FormComent.Visible = false;
            btnVerPelicula.Visible = false;
            return;
        }

        //CODE THE LIKE VALIDATION        

        btnLike.Enabled = true;
        btnDislike.Enabled = true;

        tempLike = Like_BRL.GetLikeByUserPeliculaID(userLogeado.UserId, objSelected.PeliculaId);
        
        if (tempLike == null)
        {            
            LikeIcon.Text = "<i class='fa fa-thumbs-o-up'></i>"; //No selected
            DislikeIcon.Text = "<i class='fa fa-thumbs-o-down'></i>"; //No selected
        } else
        {
            
            if (tempLike.IsLike)
            {
                LikeIcon.Text = "<i class='fa fa-thumbs-up'></i>"; //SELECTED
                DislikeIcon.Text = "<i class='fa fa-thumbs-o-down'></i>"; //No selected
            } else
            {
                LikeIcon.Text = "<i class='fa fa-thumbs-o-up'></i>"; //No selected
                DislikeIcon.Text = "<i class='fa fa-thumbs-down'></i>"; //SELECCIONADO
            }
        }        

        FormComent.Visible = true;

        tempCompra = Compra_BRL.GetTransaction(userLogeado.UserId, objSelected.PeliculaId);
        if (tempCompra != null)
        {
            if (tempCompra.Estado)
            {
                btnAlquilarSel.Visible = false;
                btnComprarSel.Visible = false;
                btnVerPelicula.Visible=true;
            }
        }

        tempAlquiler = Alquiler_BRL.GetTransactionAlq(userLogeado.UserId, objSelected.PeliculaId);
        if (tempAlquiler != null)
        {
            if (tempAlquiler.Estado)
            {
                btnAlquilarSel.Visible = false;
                btnComprarSel.Visible = false;
                btnVerPelicula.Visible = true;
            }
        }

        txtNombrePropie.Text = userLogeado.Nombre + " " + userLogeado.Apellido;
        alq_txtNomPropie.Text = userLogeado.Nombre + " " + userLogeado.Apellido;        
        alq_txtCostoAlquixDia.Text = objSelected.PrecioAlquiler + " BS";
        
    }

    public void cargarComentarios()
    {
        List<Comentario> listComents = Comentario_BRL.GetComentariosByPeliculaID(objSelected.PeliculaId);
        ListComents.DataSource = listComents;
        ListComents.DataBind();
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

    protected void btnLike_Click(object sender, EventArgs e)
    {        
        if (tempLike == null) //Si nunca le dio like
        {
            tempLike = new Like()
            {
                IsLike = true,
                UserID = userLogeado.UserId,
                PeliculaID = objSelected.PeliculaId
            };

            Like_BRL.InsertLike(tempLike);
        } else //Si ya le doy like antes
        {
            if (tempLike.IsLike) //Si es like eliminar
            {                
                Like_BRL.DeleteLike(tempLike.LikeID);
                tempLike = null;
            } else //Si ya le habian dado dislike pues actualizo y lo vuelvo like
            {
                tempLike.IsLike = true;
                Like_BRL.UpdateLike(tempLike);
            }
        }
        Response.Redirect("DetallePelicula.aspx?Id=" + objSelected.PeliculaId);
    }

    protected void btnDislike_Click(object sender, EventArgs e)
    {
        if (tempLike == null)
        {
            tempLike = new Like()
            {
                IsLike = false,
                UserID = userLogeado.UserId,
                PeliculaID = objSelected.PeliculaId
            };
            Like_BRL.InsertLike(tempLike);
        } else
        {
            if (tempLike.IsLike)
            {
                tempLike.IsLike = false;
                Like_BRL.UpdateLike(tempLike);
            } else
            {
                Like_BRL.DeleteLike(tempLike.LikeID);
                tempLike = null;
            }
        }

        Response.Redirect("DetallePelicula.aspx?Id=" + objSelected.PeliculaId);
    }


    protected void btnComent_Click(object sender, EventArgs e)
    {
        string coment = txtComent.Text.Trim();
        if (string.IsNullOrEmpty(coment))
        {
            return;
        }

        Comentario obj = new Comentario()
        {
            textComent = coment,
            Fecha = DateTime.Now,
            UserID = userLogeado.UserId,
            PeliculaID = objSelected.PeliculaId,
        };
        

        Comentario_BRL.InsertComentario(obj);

        txtComent.Text = "";
        cargarComentarios();
    }

    protected void btnVerPelicula_Click(object sender, EventArgs e)
    {
        Response.Redirect("MovieView.aspx?Id=" + objSelected.PeliculaId);
    }
}