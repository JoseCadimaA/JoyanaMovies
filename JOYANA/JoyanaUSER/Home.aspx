<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="MelodyUSER_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h1 runat="server" id="title">HOME</h1>

    <asp:Repeater ID="ListPeliculas" runat="server">
        <ItemTemplate>
            <div class="col-md-2" align="center" style="border: 1px solid #ddd; border-radius: 4px;">
                <div>
                    <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Foto")%>' Width="140" Height="140" BorderStyle="Double"/><br />
                    <asp:Label ID="lbNombrePel" runat="server" Text='<%# Eval("Nombre")%>'></asp:Label><br />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <%--<asp:Repeater runat="server" ID="C_Peliculas" OnItemCommand="C_Peliculas_ItemCommand" >
        <ItemTemplate>
            <div class="col-md-2 m-t-20 " align="center" style="border: 1px solid #ddd; border-radius: 4px; padding: 10px">
                <div>
                    <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Foto")%>' Width="140" Height="140" /><br />
                    <asp:Label ID="lbNombrePel" runat="server" Text='<%# Eval("Nombre")%>'></asp:Label><br />
                    <asp:Label ID="lbDirector" runat="server" Text='<%# Eval("Director")%>'></asp:Label><br />
                    <asp:Label ID="Label1" runat="server" Text="Precio(Bs): " CssClass="text-dark"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Precio")%>'></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>--%>
</asp:Content>

