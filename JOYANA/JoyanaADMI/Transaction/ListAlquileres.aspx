<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ListAlquileres.aspx.cs" Inherits="JoyanaADMI_Transaction_ListAlquileres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Lista de Alquileres </h2>


                <asp:GridView ID="GridAlquileres" runat="server"
                    OnRowCommand="GridAlquileres_RowCommand"
                    AutoGenerateColumns="false"
                    CssClass="table"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="FechaAlqui" HeaderText="Fecha Alquiler" />
                        <asp:BoundField DataField="FechaDevol" HeaderText="Fecha Devolución" />
                        <asp:BoundField DataField="Email" HeaderText="Correo de Comprador" />
                        <asp:BoundField DataField="TotalPago" HeaderText="Total Pago" />
                        <asp:BoundField DataField="NombrePelicula" HeaderText="Pelicula" />
                        <asp:TemplateField HeaderText="Reporte">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server"
                                    CommandName="Report"
                                    CommandArgument='<%# Eval("AlquilerId") %>'>
                                    <i class="glyphicon glyphicon-file"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

