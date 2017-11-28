<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="AdmiPerfil.aspx.cs" Inherits="JoyanaADMI_UsersAdmin_AdmiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formRegist" class="col-md-6  col-md-offset-3" runat="server">
        <h2>Perfil de Administrador</h2>
        <br />
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">CI:</span>
                <asp:TextBox ID="txtCI" runat="server" Enabled="false" CssClass="form-control" placeholder="Ingrese su Cédula de Identidad"> </asp:TextBox>
                <asp:TextBox ID="txtNewCI" runat="server" CssClass="form-control" placeholder="Ingrese su Cédula de Identidad" Visible="false"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Nombre:</span>
                <asp:TextBox ID="txtNombre" runat="server" Enabled="false" CssClass="form-control" placeholder="Ingrese su Nombre"> </asp:TextBox>
                <asp:TextBox ID="txtNewNombre" runat="server" CssClass="form-control" placeholder="Ingrese su Nombre" Visible="false"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Apellido:</span>
                <asp:TextBox ID="txtApellido" runat="server" Enabled="false" CssClass="form-control" placeholder="Ingrese su Apellido"> </asp:TextBox>
                <asp:TextBox ID="txtNewApellido" runat="server" CssClass="form-control" placeholder="Ingrese su Apellido" Visible="false"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Email:</span>
                <asp:TextBox ID="txtEmail" runat="server" Enabled="false" TextMode="Email" CssClass="form-control" placeholder="Ingrese su Email"> </asp:TextBox>
                <asp:TextBox ID="txtNewEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Ingrese su Email" Visible="false"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Telefono:</span>
                <asp:TextBox ID="txtTelefono" runat="server" Enabled="false" CssClass="form-control" placeholder="Ingrese su Nro de Telefono"> </asp:TextBox>
                <asp:TextBox ID="txtNewTelefono" runat="server" CssClass="form-control" placeholder="Ingrese su Nro de Telefono" Visible="false"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Dirección:</span>
                <asp:TextBox ID="txtDireccion" runat="server" Enabled="false" CssClass="form-control" placeholder="Ingrese su Dirección"> </asp:TextBox>
                <asp:TextBox ID="txtNewDireccion" runat="server" CssClass="form-control" placeholder="Ingrese su Dirección" Visible="false"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group" id="pnPassword" runat="server">
            <div class="input-group">
                <label>Ingrese su Contraseña para confirmar los Cambios:</label>                
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Ingrese su Contraseña" TextMode="Password"> </asp:TextBox>
            </div>
        </div>



        <asp:Label ID="lbValidator" ForeColor="Red" runat="server" Text=""></asp:Label><br />

        <asp:Button ID="btnEditInfo" runat="server" Text="Editar Información" 
            CssClass="btn btn-primary" OnClick="btnEditInfo_Click"/>

        <div id="pnBtnConfirm" runat="server">
            <asp:Button ID="btnSaveChange" runat="server" Text="Guardar Cambios" 
            CssClass="btn btn-primary" OnClick="btnSaveChange_Click"/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            CssClass="btn btn-default" OnClick="btnCancelar_Click"/>
        </div>

        <br /><br />
    </form>
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

