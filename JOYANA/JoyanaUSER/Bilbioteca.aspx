<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="Bilbioteca.aspx.cs" Inherits="JoyanaUSER_Bilbioteca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h1 runat="server" id="title">Biblioteca de Películas</h1>
    <br />

    <div class="container" style="margin-left: auto; margin-top: 20px; width: 95%" runat="server">
        <asp:Repeater ID="ListBiblioteca" runat="server" OnItemCommand="ListBiblioteca_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="itemViewMovie" runat="server" CommandName="ViewMovie" Font-Underline="false" ForeColor="Black"
                    CommandArgument='<%# Eval("PeliculaId") %>'>
                    <div runat="server" class="row" style="padding:10px 0; border-bottom:1px solid #808080;" id="divContent">
                        <div class="col-md-3">
                            <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# Eval("Foto")%>' Height="200px" Width="240px"/>
                        </div>                        
                        <div class="col-md-9">
                            <h4 style="color:black"><%# Eval("NombrePelicula")%></h4>
                            <p><strong>DIRECTOR: </strong><%# Eval("Director")%></p>
                            <p><strong>DESCRIPCIÓN: </strong><%# Eval("Description")%></p>
                        </div>
                    </div>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>        
    </div>

    <style>
        .row:hover{
            background-color :#f1f1f1;
            cursor: pointer;
        }
    </style>
</asp:Content>

