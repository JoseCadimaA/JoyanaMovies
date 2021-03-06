﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MelodyUSER_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            cargarPeliculas();
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
        }
    }


    public void cargarPeliculas()
    {
        List<Pelicula> listPeliculas = Pelicula_BRL.GetPeliculas();
        ListPeliculas.DataSource = listPeliculas;
        ListPeliculas.DataBind();
    }


    protected void ListPeliculas_ItemCommand(object source, RepeaterCommandEventArgs e)
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

        if (e.CommandName == "VerPelicula")
        {
            Response.Redirect("~/JoyanaUSER/DetallePelicula.aspx?Id=" + peliculaId.ToString());
            return;
        }
    }
}