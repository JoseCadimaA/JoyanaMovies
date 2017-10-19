<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="UserPerfil.aspx.cs" Inherits="JoyanaUSER_UserPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-left: auto; margin-top: 20px; width: 50%" runat="server">
        <h2>Perfil de Usuario</h2>
        <br />

        <div runat="server" id="pnPerfil">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Nombre:</span>
                    <asp:TextBox ID="txtNombre" runat="server" Enabled="false" CssClass="form-control" Visible="true"></asp:TextBox>
                    <asp:TextBox ID="txtNewNombre" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Apellido:</span>
                    <asp:TextBox ID="txtApellido" runat="server" Enabled="false" CssClass="form-control" Visible="true"></asp:TextBox>
                    <asp:TextBox ID="txtNewApellido" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Email:</span>
                    <asp:TextBox ID="txtEmail" runat="server" Enabled="false" CssClass="form-control" TextMode="Email" Visible="true"></asp:TextBox>
                    <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" TextMode="Email" Visible="false"></asp:TextBox>
                </div>
            </div>            
        </div>      

        <div class="form-group" runat="server" id="pnCurrentPassword" visible="false">
            <label>Ingrese su Contraseña actual para confirmar cambios: </label>
            <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" TextMode="Password" Visible="true"></asp:TextBox>
        </div>
        <asp:Label ID="lbValidator" runat="server" Text="ww" ForeColor="Red"></asp:Label>
        <div runat="server" id="PnBtnOptions" visible="true">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary btn-block" Text="Editar Información" OnClick="btnEditar_Click" />            
        </div>

        <div runat="server" id="PnBtnConrfirmation" visible="false">
            
            <asp:Button ID="btnSaveChange" runat="server" CssClass="btn btn-primary" Text="Guardar Cambio" OnClick="btnSaveChange_Click"/>
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="btnCancelar_Click" />            
        </div>

    </div>

</asp:Content>

