<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ListAdmins.aspx.cs" Inherits="JoyanaADMI_UsersAdmin_ListAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Lista de Colaboradores</h2>
                <asp:HyperLink runat="server"
                    ID="itemAddAdmi"
                    NavigateUrl="~/JoyanaADMI/UsersAdmin/RegistrarAdmin.aspx">
                AÑADIR NUEVO COLABORADOR +
                </asp:HyperLink>

                <asp:GridView ID="GridAdmins" runat="server"
                    OnRowCommand="GridAdmins_RowCommand"
                    AutoGenerateColumns="false"
                    CssClass="table"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server"
                                    CommandName="Editar"
                                    CommandArgument='<%# Eval("UserId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteButton" runat="server"
                                    CommandName="Eliminar"
                                    OnClientClick="return confirm('Esta seguro que desea eliminar el Administrador?')"
                                    CommandArgument='<%# Eval("UserId") %>'>
                                <i class="glyphicon glyphicon-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>

                <%--<asp:GridView ID="GridAdmins" runat="server" CssClass="table" GridLines="None">
                </asp:GridView>--%>
            </div>
        </div>
    </form>
    <br />
    <br />
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>

</asp:Content>

