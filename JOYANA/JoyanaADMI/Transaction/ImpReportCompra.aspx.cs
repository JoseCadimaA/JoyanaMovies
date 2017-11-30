using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoyanaADMI_Transaction_ImpReportCompra : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int CompraId = Convert.ToInt32(Request.QueryString["Id"]);
        CompraIdHiddenField.Value = CompraId.ToString();
    }
}