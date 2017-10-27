<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="CatalogoBusqueda.aspx.cs" Inherits="JoyanaUSER_CatalogoBusqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h1 runat="server" id="lbTitle"></h1>
    <br />

    <asp:Repeater ID="ListPeliculas" runat="server" OnItemCommand="ListPeliculas_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="itemShowPelicula" runat="server"
                CommandName="VerPelicula"
                CommandArgument='<%# Eval("PeliculaId") %>'>
                <div runat="server" align="center" class="divItem"
                    style="display: inline-flex; margin: 5px; border-radius: 4px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Foto")%>' Width="190" Height="300" /><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbNombrePel" runat="server" Text='<%# Eval("Nombre")%>' ForeColor="#0e3fe0"></asp:Label><br />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:LinkButton>

        </ItemTemplate>
    </asp:Repeater>

    <style>
        .divItem {
            border: 1px solid #1245be;
        }

            .divItem:hover {
                border: 2px solid #ff0000;
                cursor: pointer;
            }
    </style>
</asp:Content>

