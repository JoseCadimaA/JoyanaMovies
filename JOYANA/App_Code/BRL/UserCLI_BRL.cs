using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserCLI_DSTableAdapters;

/// <summary>
/// Summary description for UserCLI_BRL
/// </summary>
public class UserCLI_BRL
{
    public UserCLI_BRL()
    {        
    }

    public static int insertUserCLI(UserCLI obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto no debe ser nul");
        }

        int? userCLI_ID = null;
        UserCLITableAdapter adapter = new UserCLITableAdapter();
        adapter.Insert(obj.Nombre, obj.Apellido, obj.Email, obj.Password, ref userCLI_ID);

        if (userCLI_ID == null || userCLI_ID.Value <= 0)
        {
            throw new ArgumentException("La llave primaria no se generó correctamente");
        }

        return userCLI_ID.Value;

    }

    public static void updateUserCLI(UserCLI obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto no debe ser nul");
        }

        UserCLITableAdapter adapter = new UserCLITableAdapter();
        adapter.Update(obj.Nombre, obj.Apellido, obj.Email, obj.UserId);
    }

    public static UserCLI getUserById(int userId)
    {
        UserCLITableAdapter adapter = new UserCLITableAdapter();
        UserCLI_DS.UserCLIDataTable table = adapter.GetUserCLIByID(userId);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        UserCLI_DS.UserCLIRow row = table[0];    
        UserCLI obj = new UserCLI()
        {
            UserId = row.UserId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Password = row.password
        };

        return obj;
    }

    public static UserCLI getUserByEmail(string email)
    {
        UserCLITableAdapter adapter = new UserCLITableAdapter();
        UserCLI_DS.UserCLIDataTable table = adapter.GetUserCLIByEmail(email);

        if (table.Rows.Count == 0)
        {
            return null;
        }

        UserCLI_DS.UserCLIRow row = table[0];       
        UserCLI obj = new UserCLI()
        {
            UserId = row.UserId,
            Nombre = row.nombre,
            Apellido = row.apellido,
            Email = row.email,
            Password = row.password
        };

        return obj;
    }

    
}