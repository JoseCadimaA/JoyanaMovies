using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserADM
/// </summary>
public class UserADM
{
    public int UserId { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string CI { get; set; }
    public string Telefono { get; set; }
    public string Direccion { get; set; }

    public UserADM()
    {
    }
}