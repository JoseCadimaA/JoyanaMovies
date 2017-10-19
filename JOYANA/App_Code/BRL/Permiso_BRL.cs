using Permiso_DSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Permiso_BRL
/// </summary>
public class Permiso_BRL
{
    public Permiso_BRL()
    {
    }

    public static Permiso getPermisoByDescription(string descripcion)
    {
        PermisosTableAdapter adapter = new PermisosTableAdapter();
        Permiso_DS.PermisosDataTable tabla = adapter.GetPermisoByDescription(descripcion);

        if (tabla.Rows.Count == 0)
        {
            return null;
        }

        Permiso_DS.PermisosRow row = tabla[0];
        Permiso obj = new Permiso()
        {
            PermisoId = row.PermisosId,
            Descripcion = row.descripcion
        };

        return obj;
    }
}