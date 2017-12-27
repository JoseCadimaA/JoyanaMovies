<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ListFavoritos.aspx.cs" Inherits="JoyanaADMI_Transaction_ListFavoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h2 class="text-center">Top 10</h2>
                <asp:GridView ID="GridFavoritos" runat="server"
                    OnRowCommand="GridFavoritos_RowCommand"
                    AutoGenerateColumns="false"
                    CssClass="table"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="NombrePelicula" HeaderText="Nombre de Película" />
                        <asp:BoundField DataField="CantLikes" HeaderText="# de Likes" />
                                                                        

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

