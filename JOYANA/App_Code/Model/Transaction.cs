using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Transaction
/// </summary>
public class Transaction
{
    public decimal TotalPago { get; set; }
    public DateTime FechaTransaction { get; set; }
    public int UserId { get; set; }
    public string UserName { get; set; }
    public string EmailUser { get; set; }
    public string TarjetaCredito { get; set; }
    public string CodigoTarjeta { get; set; }
    public int PeliculaId { get; set; }    
    public string NombrePelicula { get; set; }
    public string Foto { get; set; }
    public string Description { get; set; }
    public string Director { get; set; }
    public string Elenco { get; set; }
    public Transaction()
    {
    }
}