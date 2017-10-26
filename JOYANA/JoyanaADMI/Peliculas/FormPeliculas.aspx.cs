using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Peliculas_FormPeliculas : System.Web.UI.Page
{
    Pelicula objSelected;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            objSelected = null;
            List<Genero> generos = Genero_BRL.GetGeneros();
            GenerosList.DataSource = generos;
            GenerosList.DataBind();

            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();

        }

        string cadPeliculaId = Request.Params["Id"];
        if (String.IsNullOrEmpty(cadPeliculaId))
        {
            return;
        }

        int idPelicula = Convert.ToInt32(cadPeliculaId);
        objSelected = Pelicula_BRL.GetPeliculaByID(idPelicula);
        if (!IsPostBack)
        {
            imgPelicula.ImageUrl = objSelected.Foto;

            txtNombrePel.Text = objSelected.Nombre;
            txtPrecio.Text = objSelected.Precio.ToString(CultureInfo.InvariantCulture);
            txtDirector.Text = objSelected.Director;
            txtElenco.Text = objSelected.Elenco;
            txtDescripción.Text = objSelected.Descripcion;

            for (int i = 0; i < GenerosList.Items.Count; i++)
            {
                PeliculaGenero pelGen = new PeliculaGenero()
                {
                    PeliculaId = objSelected.PeliculaId,
                    GeneroId = Convert.ToInt32(GenerosList.Items[i].Value)
                };

                if (PeliculaGenero_BRL.tieneGenero(pelGen))
                {
                    GenerosList.Items[i].Selected = true;
                }
            }
        }
        lbVal.Text = "";
        lbValFile.Text = "";
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            lbVal.Text = "";
            lbValFile.Text = "";
            string nombre = txtNombrePel.Text.Trim();
            decimal precio = Convert.ToDecimal(txtPrecio.Text.Trim(), CultureInfo.InvariantCulture);
            string descripcion = txtDescripción.Text.Trim();
            string director = txtDirector.Text.Trim();
            string elenco = txtElenco.Text.Trim();
            string urlFoto = imgPelicula.ImageUrl;

            bool estado = true;

            if (String.IsNullOrEmpty(nombre))
            {
                lbVal.Text = "La casilla Nombre no debe de estar vacía";
                return;
            }
            if (String.IsNullOrEmpty(director))
            {
                lbVal.Text = "La casilla Director no debe de estar vacía";
                return;
            }
            if (String.IsNullOrEmpty(elenco))
            {
                lbVal.Text = "La casilla Elenco no debe de estar vacía";
                return;
            }
            if (String.IsNullOrEmpty(descripcion))
            {
                lbVal.Text = "La casilla Descripcion no debe de estar vacía";
                return;
            }
            if (String.IsNullOrEmpty(urlFoto))
            {
                lbVal.Text = "Debe cargar una foto de portada";
                return;
            }

            //Insertando la Pelicula
            if (objSelected == null)
            {
                objSelected = new Pelicula();
            }
            objSelected.Nombre = nombre;
            objSelected.Precio = precio;
            objSelected.Descripcion = descripcion;
            objSelected.Director = director;
            objSelected.Elenco = elenco;
            objSelected.Foto = urlFoto;
            objSelected.Estado = estado;

            int idPelicula = 0;
            if (objSelected.PeliculaId <= 0) //Insertando
            {
                idPelicula = Pelicula_BRL.InsertPelicula(objSelected);
            } else //Actualiza
            {
                idPelicula = objSelected.PeliculaId;
                Pelicula_BRL.UpdatePelicula(objSelected);
            }
            

            //Insertando Generos a la Pelicula

            for (int i = 0; i < GenerosList.Items.Count; i++)
            {
                PeliculaGenero pelGen = new PeliculaGenero()
                {
                    PeliculaId = idPelicula,
                    GeneroId = Convert.ToInt32(GenerosList.Items[i].Value)
                };

                if (GenerosList.Items[i].Selected)
                {
                    if (!PeliculaGenero_BRL.tieneGenero(pelGen))
                    {
                        PeliculaGenero_BRL.InsertPeliculaGenero(pelGen);
                    }
                }
                else
                {
                    if (PeliculaGenero_BRL.tieneGenero(pelGen))
                    {
                        PeliculaGenero_BRL.DeletePeliculaGenero(pelGen);
                    }
                }
            }
            Response.Redirect("~/JoyanaADMI/Peliculas/ListPeliculas.aspx");
        }
        catch (Exception ex)
        {
            lbVal.Text = ex.Message;
        }
    }


    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        lbValFile.Text = "";
        if (btnFile.HasFile)
        {
            string extention = System.IO.Path.GetExtension(btnFile.FileName);
            if (extention == ".jpg" || extention == ".png")
            {
                imgPelicula.ImageUrl = "~/Images/" + btnFile.FileName;
                string path = Server.MapPath("~/Images/");
                btnFile.SaveAs(path + btnFile.FileName);
            }
            else
            {
                lbValFile.Text = "Solo puede seleccionar archivos JPG y PNG";
            }

        }
        else
        {
            if (String.IsNullOrEmpty(imgPelicula.ImageUrl))
            {
                lbValFile.Text = "Debe Seleccionar un Archivo";
            }

        }
    }
}