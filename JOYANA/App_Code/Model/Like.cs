using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Like
/// </summary>
public class Like
{
    public int LikeID { get; set; }
    public bool IsLike { get; set; }
    public int UserID { get; set; }
    public int PeliculaID { get; set; }
    public Like()
    {        
    }
}