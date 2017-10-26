using PeliculaGenero_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PeliculaGenero_BRL
/// </summary>
public class PeliculaGenero_BRL
{
    public PeliculaGenero_BRL()
    {        
    }

    public static bool tieneGenero(PeliculaGenero obj)
    {
        PeliculaGeneroTableAdapter adapter = new PeliculaGeneroTableAdapter();
        PeliculaGenero_DS.PeliculaGeneroDataTable table = adapter.GetPeliculaGenero(obj.PeliculaId, obj.GeneroId);
        if (table.Rows.Count == 0)
        {
            return false;
        }
        return true;
    }

    public static void InsertPeliculaGenero(PeliculaGenero obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El obj PeliculaGenero no debe ser nulo");
        }

        PeliculaGeneroTableAdapter adapter = new PeliculaGeneroTableAdapter();
        adapter.Insert(obj.PeliculaId, obj.GeneroId);
    }

    public static void DeletePeliculaGenero(PeliculaGenero obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El obj PeliculaGenero no debe ser nulo");
        }

        PeliculaGeneroTableAdapter adapter = new PeliculaGeneroTableAdapter();
        adapter.Delete(obj.PeliculaId, obj.GeneroId); 
    }

    public static List<Pelicula> GetPeliculasByGenero(int generoId)
    {
        PeliculaGeneroTableAdapter adapter = new PeliculaGeneroTableAdapter();
        PeliculaGenero_DS.PeliculaGeneroDataTable table = adapter.GetPeliculasByGenero(generoId);

        List<Pelicula> resultado = new List<Pelicula>();
        Pelicula temp;
        foreach (var row in table)
        {
            temp = Pelicula_BRL.GetPeliculaByID(row.peliculaId);
            resultado.Add(temp);
        }

        return resultado;
    }
}