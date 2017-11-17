using Alquiler_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Alquiler_BRL
/// </summary>
public class Alquiler_BRL
{
    public Alquiler_BRL(){ }

    public static int InsertAlquiler(Alquiler obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Alquiler no debe ser nulo");
        }

        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        int? AlquilerId = 0;
        adapter.Insert(obj.TotalPago, obj.FechaAlqui, obj.FechaDevol, obj.TarjetaCredito, obj.CodigoTarjeta, obj.Estado, obj.UserId, obj.PeliculaId, ref AlquilerId);

        if (AlquilerId <= 0)
        {
            throw new ArgumentException("Mala Inserción del Alquiler");
        }

        return AlquilerId.Value;
    }

    public static void UpdateAlquiler(Alquiler obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto alquiler no debe ser nulo");
        }

        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        adapter.Update(obj.TotalPago, obj.FechaAlqui, obj.FechaDevol, obj.TarjetaCredito, obj.CodigoTarjeta, obj.Estado, obj.AlquilerId);
    }

    public static void DeleteAlquiler(int AlquilerId)
    {
        if (AlquilerId <= 0)
        {
            throw new ArgumentException("El AlquilerId debe ser mayor a 0");
        }
        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        adapter.Delete(AlquilerId);
    }

    public static Alquiler GetTransactionAlq(int UserId, int PeliculaId)
    {
        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        Alquiler_DS.AlquilerDataTable table = adapter.ExistAlquiler(UserId, PeliculaId);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        Alquiler_DS.AlquilerRow row = table[0];
        Alquiler obj = new Alquiler()
        {
            AlquilerId = row.AlquilerId,
            TotalPago = row.totalPago,
            FechaAlqui = row.fechaAlqui,
            FechaDevol = row.fechaDevol,
            TarjetaCredito = row.tarjetaCredito,
            CodigoTarjeta = row.codigoTarjeta,
            Estado = row.estado,
            UserId = row.UserId,
            PeliculaId = row.peliculaId
        };

        return obj;
    }

    public static List<Alquiler> GetAllAlquileres()
    {
        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        Alquiler_DS.AlquilerDataTable table = adapter.GetAlquileres();

        List<Alquiler> result = new List<Alquiler>();
        Alquiler temp;
        foreach (var row in table)
        {
            temp = new Alquiler()
            {
                AlquilerId = row.AlquilerId,
                TotalPago = row.totalPago,
                FechaAlqui = row.fechaAlqui,
                FechaDevol = row.fechaDevol,
                TarjetaCredito = row.tarjetaCredito,
                CodigoTarjeta = row.codigoTarjeta,
                Estado = row.estado,
                UserId = row.UserId,
                PeliculaId = row.peliculaId
            };

            result.Add(temp);
        }

        return result;
    }

    public static Alquiler GetAlquilerByID(int AlquilerId)
    {
        if (AlquilerId <= 0)
        {
            throw new ArgumentException("El AlquilerId debe ser mayor a 0");
        }

        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        Alquiler_DS.AlquilerDataTable table = adapter.GetAlquilerByID(AlquilerId);

        if (table.Rows.Count == 0)
        {
            return null;
        }
        Alquiler_DS.AlquilerRow row = table[0];
        Alquiler obj = new Alquiler()
        {
            AlquilerId = row.AlquilerId,
            TotalPago = row.totalPago,
            FechaAlqui = row.fechaAlqui,
            FechaDevol = row.fechaDevol,
            TarjetaCredito = row.tarjetaCredito,
            CodigoTarjeta = row.codigoTarjeta,
            Estado = row.estado,
            UserId = row.UserId,
            PeliculaId = row.peliculaId
        };

        return obj;
    }

    public static List<Alquiler> GetAlquileresByUserId(int UserId)
    {
        if (UserId <= 0)
        {
            throw new ArgumentException("El UserId debe ser mayor a 0");
        }
        AlquilerTableAdapter adapter = new AlquilerTableAdapter();
        Alquiler_DS.AlquilerDataTable table = adapter.GetAlquileresByUserID(UserId);
        List<Alquiler> result = new List<Alquiler>();
        Alquiler temp;
        foreach (var row in table)
        {
            temp = new Alquiler()
            {
                AlquilerId = row.AlquilerId,
                TotalPago = row.totalPago,
                FechaAlqui = row.fechaAlqui,
                FechaDevol = row.fechaDevol,
                TarjetaCredito = row.tarjetaCredito,
                CodigoTarjeta = row.codigoTarjeta,
                Estado = row.estado,
                UserId = row.UserId,
                PeliculaId = row.peliculaId
            };

            result.Add(temp);

        }

        return result;
    }
}