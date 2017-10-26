<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="FormPeliculas.aspx.cs" Inherits="JoyanaADMI_Peliculas_FormPeliculas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formRegist" class="col-md-6  col-md-offset-3" runat="server">
        <h2 runat="server" id="lbTitle" class="text-center">Registrar Película</h2>
        <br />

        <div class="form-group">
            <div class="col-md-offset-2">
                <asp:Image ID="imgPelicula" runat="server" Height="400px" ImageAlign="Middle" Width="400px" />
                <br /> 
                <asp:Label ID="lbValFile" runat="server" Text="" ForeColor="Red"></asp:Label>               
                <asp:FileUpload ID="btnFile" runat="server" />
                <asp:Button ID="btnUploadImage" runat="server" Text="Cargar Imagen" OnClick="btnUploadImage_Click"/>
            </div>
        </div>


        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Nombre de Película:</span>
                <asp:TextBox ID="txtNombrePel" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese el Nombre de la Película"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Precio de la Película:</span>
                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"
                    CssClass="form-control"
                    placeholder="Ingrese el Precio de la Película"> 
                </asp:TextBox>
            </div>
            <asp:CompareValidator runat="server"
                ControlToValidate="txtPrecio"
                Display="Dynamic"
                ForeColor="Red"
                ValueToCompare="0"
                Operator="GreaterThanEqual"
                ErrorMessage="El precio debe ser Positivo">
            </asp:CompareValidator>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Director de Película:</span>
                <asp:TextBox ID="txtDirector" runat="server"
                    CssClass="form-control"
                    placeholder="Ingrese el Director de la Película"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Elenco Participante:</span>
                <asp:TextBox ID="txtElenco" runat="server" TextMode="MultiLine"
                    Height="100"
                    CssClass="form-control"
                    placeholder="Ingrese el Elenco de la Película"> </asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Descripción:</span>
                <asp:TextBox ID="txtDescripción" runat="server" TextMode="MultiLine"
                    Height="200"
                    CssClass="form-control"
                    placeholder="Ingrese la Descripción de la Película"> </asp:TextBox>
            </div>
        </div>

        <h4>Géneros de la Película</h4>

        <asp:CheckBoxList ID="GenerosList" runat="server" CssClass=""
            DataValueField="GeneroId"
            DataTextField="Nombre">
        </asp:CheckBoxList>
        <br />

        <asp:Label ID="lbVal" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Película"
            CssClass="btn btn-block btn-primary"
            OnClick="btnRegistrar_Click" />

        <br />
    </form>
</asp:Content>

