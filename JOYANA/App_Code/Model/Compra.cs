using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Comprar
/// </summary>
public class Compra
{
    public int CompraId { get; set; }
    public DateTime Fecha { get; set; }
    public decimal TotalPago { get; set; }
    public string TarjetaCredito { get; set; }
    public string CodigoTarjeta { get; set; }
    public bool Estado { get; set; }
    public int UserId { get; set; }
    public int PeliculaId { get; set; }
    public Compra()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}