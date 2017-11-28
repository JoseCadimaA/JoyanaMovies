using Comentario_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Comentario_BRL
/// </summary>
public class Comentario_BRL
{
    public Comentario_BRL()
    {
    }

    public static int InsertComentario(Comentario obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Comentario no puede ser nulo");
        }

        int? ComentarioId = 0;
        ComentarioTableAdapter adapter = new ComentarioTableAdapter();        
        adapter.Insert(obj.textComent, obj.Fecha, obj.UserID, obj.PeliculaID, ref ComentarioId);

        if (ComentarioId <= 0)
        {
            throw new ArgumentException("Mala Inserción de ComentarioID");
        }

        return ComentarioId.Value;
    }

    public static List<Comentario> GetComentariosByPeliculaID(int peliculaId)
    {
        ComentarioTableAdapter adapter = new ComentarioTableAdapter();
        Comentario_DS.ComentarioDataTable table = adapter.GetComentariosByPeliculaID(peliculaId);

        List<Comentario> ListComents = new List<Comentario>();
        Comentario temp;
        foreach (var row in table)
        {
            temp = new Comentario()
            {
                ComentarioId = row.ComentarioId,
                textComent = row.texto,
                Fecha = row.fecha,
                UserID = row.UserId,
                UserName = row.userName,
                PeliculaID = row.peliculaId
            };

            ListComents.Add(temp);
        }

        return ListComents;
    }
}