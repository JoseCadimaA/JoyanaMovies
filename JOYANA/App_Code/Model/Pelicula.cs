using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pelicula
/// </summary>
public class Pelicula
{
    public int PeliculaId { get; set; }
    public string Nombre { get; set; }
    public decimal PrecioVenta { get; set; }
    public decimal PrecioAlquiler { get; set; }
    public string Descripcion { get; set; }
    public string  Director { get; set; }
    public string Elenco { get; set; }
    public string Foto { get; set; }
    public string TrailerCode { get; set; }
    public string MovieCode { get; set; }
    public bool Estado { get; set; }
    public Pelicula()
    {        
    }
}