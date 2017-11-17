using Pelicula_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pelicula_BRL
/// </summary>
public class Pelicula_BRL
{
    public Pelicula_BRL()
    {        
    }

    public static int InsertPelicula(Pelicula obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Pelicula no debe ser Nulo");
        }

        int? peliculaId = 0;
        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        adapter.Insert(obj.Nombre, obj.PrecioVenta, obj.PrecioAlquiler, obj.Descripcion, obj.Director, obj.Elenco, obj.Foto, obj.TrailerCode, obj.MovieCode, obj.Estado, ref peliculaId);        

        if (peliculaId <= 0)
        {
            throw new ArgumentException("Mala Insercion de PeliculaId");
        }
        return peliculaId.Value;
    }

    public static List<Pelicula> GetPeliculas()
    {
        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        Pelicula_DS.PeliculasDataTable table = adapter.GetPeliculas();

        List<Pelicula> resultado = new List<Pelicula>();
        foreach (var row in table)
        {
            if (row.estado == true)
            {
                Pelicula obj = new Pelicula()
                {
                    PeliculaId = row.peliculaId,
                    Nombre = row.nombre,
                    PrecioVenta = row.precioVenta,
                    PrecioAlquiler = row.precioAlquiler,
                    Descripcion = row.descripcion,
                    Director = row.director,
                    Elenco = row.elenco,
                    Foto = row.foto,
                    TrailerCode = row.trailerCode,
                    MovieCode = row.movieCode,
                    Estado = row.estado
                };
                resultado.Add(obj);
            }
            
        }
        return resultado;
    }

    public static List<Pelicula> GetBusqueda(string nombre)
    {
        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        Pelicula_DS.PeliculasDataTable table = adapter.GetBusqueda(nombre);

        List<Pelicula> resultado = new List<Pelicula>();
        Pelicula temp; 
        foreach (var row in table)
        {
            temp = new Pelicula()
            {
                PeliculaId = row.peliculaId,
                Nombre = row.nombre,
                PrecioVenta = row.precioVenta,
                PrecioAlquiler = row.precioAlquiler,
                Descripcion = row.descripcion,
                Director = row.director,
                Elenco = row.elenco,
                Foto = row.foto,
                TrailerCode = row.trailerCode,
                MovieCode = row.movieCode,
                Estado = row.estado
            };

            resultado.Add(temp);
        }

        return resultado;
    }
    public static void UpdatePelicula(Pelicula obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Pelicula no debe ser nulo");
        }

        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        adapter.Update(obj.Nombre, obj.PrecioVenta, obj.PrecioAlquiler, obj.Descripcion, obj.Director, obj.Elenco, obj.Foto, obj.TrailerCode, obj.MovieCode, obj.PeliculaId);        
    }

    public static void DeletePelicula(int peliculaId)
    {
        if (peliculaId <= 0)
        {
            throw new ArgumentException("PeliculaId no existe y no se pude eliminar");
        }

        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        adapter.Delete(peliculaId);
    }

    public static Pelicula GetPeliculaByID(int peliculaId)
    {
        if (peliculaId <= 0)
        {
            throw new ArgumentException("PeliculaId no debe ser menor a 1, error al optener Pelicula por ID");
        }

        PeliculasTableAdapter adapter = new PeliculasTableAdapter();
        Pelicula_DS.PeliculasDataTable table = adapter.GetPeliculaByID(peliculaId);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        Pelicula_DS.PeliculasRow row = table[0];
        Pelicula obj = new Pelicula()
        {
            PeliculaId = row.peliculaId,
            Nombre = row.nombre,
            PrecioVenta = row.precioVenta,
            PrecioAlquiler = row.precioAlquiler,
            Descripcion = row.descripcion,
            Director = row.director,
            Elenco = row.elenco,
            Foto = row.foto,
            TrailerCode = row.trailerCode,
            MovieCode = row.movieCode,
            Estado = row.estado
        };

        return obj;
    }
}