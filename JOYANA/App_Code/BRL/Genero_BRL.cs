using Genero_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Genero_BRL
/// </summary>
public class Genero_BRL
{
    public Genero_BRL()
    {        
    }

    public static List<Genero> GetGeneros()
    {
        GeneroTableAdapter adapter = new GeneroTableAdapter();
        Genero_DS.GeneroDataTable table = adapter.GetGeneros();

        List<Genero> resultado = new List<Genero>();
        foreach (var row in table)
        {
            Genero obj = new Genero()
            {
                GeneroId = row.generoId,
                Nombre = row.nombre
            };

            resultado.Add(obj);
        }
        return resultado;
    }

    public static Genero GetGeneroByID(int generoId) {
        if (generoId <= 0)
        {
            throw new ArgumentException("El GeneroId no debe ser negativo");
        }

        GeneroTableAdapter adapter = new GeneroTableAdapter();
        Genero_DS.GeneroDataTable table = adapter.GetGeneroByID(generoId);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        Genero_DS.GeneroRow row = table[0];
        Genero temp = new Genero()
        {
            GeneroId = row.generoId,
            Nombre = row.nombre
        };

        return temp;
    }
}