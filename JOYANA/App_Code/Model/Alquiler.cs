using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Alquiler
/// </summary>
public class Alquiler
{
    public int AlquilerId { get; set; }
    public decimal TotalPago { get; set; }
    public DateTime FechaAlqui { get; set; }
    public DateTime FechaDevol { get; set; }
    public string TarjetaCredito { get; set; }
    public string CodigoTarjeta { get; set; }
    public bool Estado { get; set; }
    public int UserId { get; set; }
    public int PeliculaId { get; set; }
    public Alquiler()
    {        
    }
}