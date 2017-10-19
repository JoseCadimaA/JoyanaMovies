using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserADM_DSTableAdapters;

/// <summary>
/// Summary description for UserADM_BRL
/// </summary>
public class UserADM_BRL
{
    public UserADM_BRL()
    {
    }

    public static int insertUserADM(UserADM obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto Admi no debe ser nulo");
        }

        int? userADM_Id = null;
        UserADMTableAdapter adapter = new UserADMTableAdapter();
        adapter.Insert(obj.Nombre, obj.Apellido, obj.Email, obj.Password, obj.CI, obj.Telefono, obj.Direccion, ref userADM_Id);

        if (userADM_Id == null || userADM_Id <= 0)
        {
            throw new ArgumentException("La llave primaria no se generó correctamente");
        }
        return userADM_Id.Value;
    }
    public static void updateUserADM(UserADM obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El Administrador no puede ser nulo");
        }

        UserADMTableAdapter adapter = new UserADMTableAdapter();
        adapter.Update(obj.Nombre, obj.Apellido, obj.Email, obj.Password, obj.CI, obj.Telefono, obj.Direccion, obj.UserId);
    }
    public static void deleteUserADM(int userAdmId)
    {
        if (userAdmId <= 0)
            throw new ArgumentException("El id del Aministrador no puede ser menor que cero");

        UserADMTableAdapter adapter = new UserADMTableAdapter();
        adapter.Delete(userAdmId);
    }
    public static List<UserADM> GetAdmins()
    {
        UserADMTableAdapter adapter = new UserADMTableAdapter();
        UserADM_DS.UserADMDataTable table = adapter.GetUserADM();

        List<UserADM> resultado = new List<UserADM>();
        foreach (var row in table)
        {
            UserADM obj = new UserADM();
            obj.UserId = row.UserId;
            obj.CI = row.CI;
            obj.Nombre = row.nombre;
            obj.Apellido = row.apellido;
            obj.Email = row.email;
            obj.Password = row.password;
            obj.Telefono = row.telefono;
            obj.Direccion = row.direccion;
            resultado.Add(obj);
        }
        return resultado;
    }
    public static UserADM getUserAdmByID(int userAdmID)
    {
        UserADMTableAdapter adapter = new UserADMTableAdapter();
        UserADM_DS.UserADMDataTable table = adapter.GetUserADMByID(userAdmID);
        if (table.Rows.Count == 0)
        {
            return null;
        }

        UserADM_DS.UserADMRow row = table[0];
        UserADM obj = new UserADM()
        {
            UserId = row.UserId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Password = row.password,
            CI = row.CI,
            Telefono = row.telefono,
            Direccion = row.direccion
        };

        return obj;
    }
    public static UserADM getUserAdmByCI(string CI)
    {
        UserADMTableAdapter adapter = new UserADMTableAdapter();
        UserADM_DS.UserADMDataTable table = adapter.GetUserADMByCI(CI);
        if (table.Rows.Count == 0)
        {
            return null;
        }

        UserADM_DS.UserADMRow row = table[0];
        UserADM obj = new UserADM()
        {
            UserId = row.UserId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Password = row.password,
            CI = row.CI,
            Telefono = row.telefono,
            Direccion = row.direccion
        };

        return obj;
    }
    public static UserADM getUserAdmByEmail(string email)
    {
        UserADMTableAdapter adapter = new UserADMTableAdapter();
        UserADM_DS.UserADMDataTable table = adapter.GetUserADMByEmail(email);
        if (table.Rows.Count == 0)
        {
            return null;
        }

        UserADM_DS.UserADMRow row = table[0];
        UserADM obj = new UserADM()
        {
            UserId = row.UserId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Password = row.password,
            CI = row.CI,
            Telefono = row.telefono,
            Direccion = row.direccion
        };

        return obj;
    }
}