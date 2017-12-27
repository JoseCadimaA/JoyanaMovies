using Like_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Like_BRL
/// </summary>
public class Like_BRL
{
    public Like_BRL()
    {
    }

    public static int InsertLike(Like obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto LIKE no debe ser nulo");        
        }

        int? LikeId = 0;
        LikeTableAdapter adapter = new LikeTableAdapter();        
        adapter.Insert(obj.IsLike, obj.UserID, obj.PeliculaID, ref LikeId);

        if (LikeId <= 0)
        {
            throw new ArgumentException("Error de llave primaria LikeId");
        }

        return LikeId.Value;
    }

    public static void UpdateLike(Like obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto LIKE no debe ser nulo");
        }

        LikeTableAdapter adapter = new LikeTableAdapter();
        adapter.Update(obj.IsLike, obj.UserID, obj.PeliculaID, obj.LikeID);
    }

    public static void DeleteLike(int likeID)
    {
        if (likeID <= 0)
        {
            throw new ArgumentException("LikeID debe ser mayor a 0");
        }

        LikeTableAdapter adapter = new LikeTableAdapter();
        adapter.Delete(likeID);
    }

    public static Like GetLikeByUserPeliculaID(int userID, int peliculaID)
    {
        LikeTableAdapter adapter = new LikeTableAdapter();        
        Like_DS.LikeDataTable table = adapter.GetLikeByUserPeliculaID(userID, peliculaID);

        if (table.Rows.Count <= 0)
        {
            return null;
        }

        Like_DS.LikeRow row = table[0];

        Like obj = new Like()
        {
            LikeID = row.LikeId,
            IsLike = row.isLike,
            UserID = row.UserId,
            PeliculaID = row.peliculaId,
        };

        return obj;
    }

    public static int GetCantLikes(int peliculaID)
    {
        if (peliculaID <= 0)
        {
            throw new ArgumentException("PeliculaID debe ser mayor a 0");
        }

        LikeTableAdapter adapter = new LikeTableAdapter();
        Like_DS.LikeDataTable table = adapter.GetCantLikes(peliculaID);

        return table.Rows.Count;    
                                    
    }

    public static int GetCantDisLikes(int peliculaID)
    {
        if (peliculaID <= 0)
        {
            throw new ArgumentException("PeliculaID debe ser mayor a 0");
        }

        LikeTableAdapter adapter = new LikeTableAdapter();
        Like_DS.LikeDataTable table = adapter.GetCantDislikes(peliculaID);

        return table.Rows.Count;
    }

    public static List<Favoritos> GetFavoritos()
    {
        FavoritosTableAdapter adapter = new FavoritosTableAdapter();
        Like_DS.FavoritosDataTable table = adapter.GetFavoritos();

        List<Favoritos> listFavoritos = new List<Favoritos>();
        Favoritos temp;
        foreach (var row in table)
        {
            temp = new Favoritos()
            {
                NombrePelicula = row.nombre,
                CantLikes = row.likes
            };

            listFavoritos.Add(temp);
        }
        return listFavoritos;
    }
}