using AdmiPermisos_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdmiPermiso_BRL
/// </summary>
public class AdmiPermiso_BRL
{
    public AdmiPermiso_BRL()
    {       
    }

    public static void insertAdmiPermiso(AdmiPermiso obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto AdmiPermiso no debe ser nulo");
        }

        AdminPermisoTableAdapter adapter = new AdminPermisoTableAdapter();
        adapter.Insert(obj.UserAdmId, obj.PermisoId);
    }

    public static Boolean tienePermiso(int userAdmId, int permisoId)
    {
        AdminPermisoTableAdapter adapter = new AdminPermisoTableAdapter();
        AdmiPermisos_DS.AdminPermisoDataTable table = adapter.GetAdminPermiso(userAdmId, permisoId);
        if (table.Rows.Count == 0)
        {
            return false;
        }
        return true;
    }

    public static void deleteAdmiPermiso(int admiId, int permisoId)
    {
        if (admiId <= 0)
        {
            throw new ArgumentException("La llave del usuario es menor igual a 0");
        }

        AdminPermisoTableAdapter adapter = new AdminPermisoTableAdapter();
        adapter.Delete(permisoId, admiId);
    }

    public static void deleteAdmiPermisAll(int admiId)
    {
        if (admiId <= 0)
        {
            throw new ArgumentException("La llave del usuario es menor igual a 0");
        }

        AdminPermisoTableAdapter adapter = new AdminPermisoTableAdapter();
        adapter.DeleteAllAdminPerm(admiId);
    }

    public static void updateAdmiPermiso(int userAdmId, int permisoId)
    {
        AdminPermisoTableAdapter adapter = new AdminPermisoTableAdapter();
        adapter.Update(userAdmId, permisoId);
    }
    
}