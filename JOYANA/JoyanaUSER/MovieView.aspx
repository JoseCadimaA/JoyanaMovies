<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="MovieView.aspx.cs" Inherits="JoyanaUSER_MovieView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-left: auto; margin-top: 20px; width: 95%;" runat="server">
        <iframe width="990" height="500" frameborder="0" allowfullscreen runat="server" id="Youtube"></iframe>

        <div class="container" style="margin-left: auto; margin-top: 20px; width: 70%; background: #dedada; border-radius: 4px; padding-top: 5px;" runat="server">
            <h3 runat="server" id="lbNombrePeli" style="margin-bottom: 10px" class="text-center"></h3>
            <asp:Label ID="lbDescricion" runat="server" Text="DESCRIPCIÓN:" Font-Bold="true"></asp:Label>
            <p runat="server" id="txtDecripcion"></p><br />
        </div>
    </div>
</asp:Content>

