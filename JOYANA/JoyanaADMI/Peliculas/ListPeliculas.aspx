<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ListPeliculas.aspx.cs" Inherits="JoyanaADMI_Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Lista de Películas </h2>
                <asp:HyperLink runat="server"
                    ID="itemAddPelicula"
                    NavigateUrl="~/JoyanaADMI/Peliculas/FormPeliculas.aspx">
                AÑADIR NUEVA PELICULA +
                </asp:HyperLink>

                <asp:GridView ID="GridPeliculas" runat="server"
                    OnRowCommand="GridPeliculas_RowCommand"                    
                    AutoGenerateColumns="false"
                    CssClass="table"
                    GridLines="None">
                    <Columns>
                        <asp:ImageField DataImageUrlField="Foto" HeaderText="Foto Portada" ControlStyle-Width="60px"></asp:ImageField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                        <asp:BoundField DataField="Director" HeaderText="Director" />                        
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server"
                                    CommandName="Editar"
                                    CommandArgument='<%# Eval("PeliculaId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteButton" runat="server"
                                    CommandName="Eliminar"
                                    OnClientClick="return confirm('Esta seguro que desea eliminar la Película?')"
                                    CommandArgument='<%# Eval("PeliculaId") %>'>
                                <i class="glyphicon glyphicon-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>


</asp:Content>

