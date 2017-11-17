using Alquiler_DSTableAdapters;
using Compra_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Compra_BRL
/// </summary>
public class Compra_BRL
{
    public Compra_BRL() { }

    public static int InsertCompra(Compra obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Compra no debe ser nulo");
        }

        int? CompraId = 0;
        CompraTableAdapter adapter = new CompraTableAdapter();
        adapter.Insert(obj.Fecha, obj.TotalPago, obj.TarjetaCredito, obj.CodigoTarjeta, obj.Estado, obj.UserId, obj.PeliculaId, ref CompraId);

        if (CompraId <= 0)
        {
            throw new ArgumentException("Mala inserción de la compra");
        }
        return CompraId.Value;
    }

    public static List<Compra> GetAllCompras()
    {
        CompraTableAdapter adapter = new CompraTableAdapter();
        Compra_DS.CompraDataTable table = adapter.GetCompras();

        List<Compra> result = new List<Compra>();
        Compra temp;
        foreach (var row in table)
        {
            temp = new Compra()
            {
                CompraId = row.CompraId,
                Fecha = row.fecha,
                TotalPago = row.totalPago,
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

    public static Compra GetTransaction(int UserId, int PeliculaId)
    {
        CompraTableAdapter adapter = new CompraTableAdapter();
        Compra_DS.CompraDataTable table = adapter.ExistTransaction(UserId, PeliculaId);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        Compra_DS.CompraRow row = table[0];

        Compra obj = new Compra()
        {
            CompraId = row.CompraId,
            Fecha = row.fecha,
            TotalPago = row.totalPago,
            TarjetaCredito = row.tarjetaCredito,
            CodigoTarjeta = row.codigoTarjeta,
            Estado = row.estado,
            UserId = row.UserId,
            PeliculaId = row.peliculaId
        };

        return obj;
    }

    public static Compra GetCompraByID(int CompraId)
    {
        if (CompraId <= 0)
        {
            throw new ArgumentException("La CompraID debe ser mayor a 0");
        }

        CompraTableAdapter adapter = new CompraTableAdapter();
        Compra_DS.CompraDataTable table = adapter.GetCompraByID(CompraId);
        if (table.Rows.Count == 0)
        {
            return null;
        }

        Compra_DS.CompraRow row = table[0];

        Compra obj = new Compra()
        {
            CompraId = row.CompraId,
            Fecha = row.fecha,
            TotalPago = row.totalPago,
            TarjetaCredito = row.tarjetaCredito,
            CodigoTarjeta = row.codigoTarjeta,
            Estado = row.estado,
            UserId = row.UserId,
            PeliculaId = row.peliculaId
        };

        return obj;
    }

    public static List<Compra> GetComprasByUserID(int UserId)
    {
        if (UserId <= 0)
        {
            throw new ArgumentException("El UserId no debe ser menor igual a 0");
        }

        CompraTableAdapter adapter = new CompraTableAdapter();
        Compra_DS.CompraDataTable table = adapter.GetComprasByUserID(UserId);
        List<Compra> result = new List<Compra>();
        Compra temp;
        foreach (var row in table)
        {
            temp = new Compra()
            {
                CompraId = row.CompraId,
                Fecha = row.fecha,
                TotalPago = row.totalPago,
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

    public static void DeleteCompra(int CompraId)
    {
        if (CompraId <= 0)
        {
            throw new ArgumentException("La CompraId debe ser mayor a 0");
        }
        CompraTableAdapter adapter = new CompraTableAdapter();
        adapter.Delete(CompraId);
    }

    public static void UpdateCompra(Compra obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto de Compra no debe ser nulo");
        }

        CompraTableAdapter adapter = new CompraTableAdapter();
        adapter.Update(obj.Fecha, obj.TotalPago, obj.TarjetaCredito, obj.CodigoTarjeta, obj.Estado, obj.CompraId);
    }

    public static List<Transaction> GetAllTransactionByUserId(int UserId)
    {
        if (UserId <= 0)
        {
            throw new ArgumentException("El UserId debe ser mayor a 1");
        }
        List<Transaction> listTransaction = new List<Transaction>();
        //Obtieniendo Compras por UserID
        CompraTableAdapter adapterCompra = new CompraTableAdapter();
        Compra_DS.CompraDataTable tableCompra = adapterCompra.GetComprasByUserID(UserId);
        Transaction tempTransaction;
        UserCLI tempUser;
        Pelicula tempMovie;
        foreach (var row in tableCompra)
        {
            if (row.estado)
            {
                tempTransaction = new Transaction();
                tempTransaction.TotalPago = row.totalPago;
                tempTransaction.FechaTransaction = row.fecha;
                tempTransaction.UserId = row.UserId;
                tempUser = UserCLI_BRL.getUserById(row.UserId);
                tempTransaction.UserName = tempUser.Nombre;
                tempTransaction.EmailUser = tempUser.Email;
                tempTransaction.TarjetaCredito = row.tarjetaCredito;
                tempTransaction.CodigoTarjeta = row.codigoTarjeta;
                tempTransaction.PeliculaId = row.peliculaId;
                tempMovie = Pelicula_BRL.GetPeliculaByID(row.peliculaId);
                tempTransaction.NombrePelicula = tempMovie.Nombre;
                tempTransaction.Foto = tempMovie.Foto;
                tempTransaction.Description = tempMovie.Descripcion;
                tempTransaction.Director = tempMovie.Director;
                tempTransaction.Elenco = tempMovie.Elenco;

                listTransaction.Add(tempTransaction);
            }
        }

        AlquilerTableAdapter adapterAlquiler = new AlquilerTableAdapter();
        Alquiler_DS.AlquilerDataTable tableAlquiler = adapterAlquiler.GetAlquileresByUserID(UserId);

        foreach (var row in tableAlquiler)
        {
            if (row.estado)
            {
                TimeSpan ts = DateTime.Now - row.fechaDevol;
                int diference = ts.Days;
                if (diference > 0)
                {
                    Alquiler_BRL.DeleteAlquiler(row.AlquilerId);
                } else
                {
                    tempTransaction = new Transaction();
                    tempTransaction.TotalPago = row.totalPago;
                    tempTransaction.FechaTransaction = row.fechaAlqui;
                    tempTransaction.UserId = row.UserId;
                    tempUser = UserCLI_BRL.getUserById(row.UserId);
                    tempTransaction.UserName = tempUser.Nombre;
                    tempTransaction.EmailUser = tempUser.Email;
                    tempTransaction.TarjetaCredito = row.tarjetaCredito;
                    tempTransaction.CodigoTarjeta = row.codigoTarjeta;
                    tempTransaction.PeliculaId = row.peliculaId;
                    tempMovie = Pelicula_BRL.GetPeliculaByID(row.peliculaId);
                    tempTransaction.NombrePelicula = tempMovie.Nombre;
                    tempTransaction.Foto = tempMovie.Foto;
                    tempTransaction.Description = tempMovie.Descripcion;
                    tempTransaction.Director = tempMovie.Director;
                    tempTransaction.Elenco = tempMovie.Elenco;

                    listTransaction.Add(tempTransaction);
                }
                
            }
            
        }

        return listTransaction;
    }
}