<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrarAdmin.aspx.cs" Inherits="JoyanaADMI_UsersAdmin_RegistrarAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formRegist" class="col-md-6  col-md-offset-3" runat="server">
        <h2>Registrar Administradores</h2>
        <br />
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">CI:</span>
                <asp:TextBox ID="txtCI" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese su Cédula de Identidad"> </asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Nombre:</span>
                <asp:TextBox ID="txtNombre" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese su Nombre"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Apellido:</span>
                <asp:TextBox ID="txtApellido" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese su Apellido"> </asp:TextBox>
            </div>
        </div>
        
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Email:</span>
                <asp:TextBox ID="txtEmail" runat="server"
                    TextMode="Email"
                    CssClass="form-control"
                    placeholder="Ingrese su Email"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Contraseña:</span>
                <asp:TextBox ID="txtPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Ingrese su Contraseña"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Re-Contraseña:</span>
                <asp:TextBox ID="txtRePassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Confirme su Contraseña"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Telefono:</span>
                <asp:TextBox ID="txtTelefono" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese su Nro de Telefono"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Dirección:</span>
                <asp:TextBox ID="txtDireccion" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese su Dirección"> </asp:TextBox>
            </div>
        </div>

        <h4>Asignar Permisos</h4>
        

        <asp:CheckBoxList ID="checkPermisos" runat="server">
            <asp:ListItem>Añadir Peliculas</asp:ListItem>
            <asp:ListItem>Editar Peliculas</asp:ListItem>
            <asp:ListItem>Eliminar Peliculas</asp:ListItem>
            <asp:ListItem>Registrar Administrador</asp:ListItem>
            <asp:ListItem>Editar Administrador</asp:ListItem>
            <asp:ListItem>Eliminar Administrador</asp:ListItem>
            <%--<asp:ListItem>Ver Reportes</asp:ListItem>--%>
        </asp:CheckBoxList>
        

        <asp:Label ID="lbValidator" ForeColor="Red" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnRegistrar" runat="server" 
            Text="Registrar"             
            CssClass="btn btn-primary btn-block" OnClick="btnRegistrar_Click"/>        
        
        <br /><br /><br />
    </form>

    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>

</asp:Content>

