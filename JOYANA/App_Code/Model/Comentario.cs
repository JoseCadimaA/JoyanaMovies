using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Comentario
/// </summary>
public class Comentario
{
    public int ComentarioId { get; set; }
    public string textComent { get; set; }
    public DateTime Fecha { get; set; }
    public int UserID { get; set; }
    public int PeliculaID { get; set; }
    public string UserName { get; set; }
    public Comentario()
    {        
    }
}