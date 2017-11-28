<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaUSER/MasterPage.master" AutoEventWireup="true" CodeFile="DetallePelicula.aspx.cs" Inherits="JoyanaUSER_DetallePelicula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 20px; width: 95%;" runat="server">
        <iframe width="1013" height="500" frameborder="0" allowfullscreen runat="server" id="Youtube"></iframe>

        <div class="col-md-6" style="margin-top: 20px; background: #eeeeee; border-radius: 4px; padding-top: 5px;" runat="server">
            <div style="overflow: hidden">
                <div class="pull-left">
                    <h3 runat="server" id="lbNombrePeli" style="margin-bottom: 10px" class="text-left"></h3>
                </div>

                <div class="pull-right">
                    
                    <asp:LinkButton runat="server" ID="btnLike" CssClass="btn btn-primary" OnClick="btnLike_Click">
                        <%--<i class="fa fa-thumbs-up"></i>--%>
                        <asp:Literal runat="server" ID="LikeIcon"></asp:Literal>
                    </asp:LinkButton>
                    <asp:Label runat="server" id="lbCantLikes"></asp:Label>

                    
                    <asp:LinkButton runat="server" ID="btnDislike" CssClass="btn btn-primary" style="margin-left: 5px" OnClick="btnDislike_Click">
                        <%--<i class="fa fa-thumbs-o-down"></i>--%>
                        <asp:Literal runat="server" ID="DislikeIcon"></asp:Literal>
                    </asp:LinkButton>
                    <asp:Label runat="server" id="lbCantDislikes"></asp:Label>

                </div>
            </div>

            <div>
                <asp:Label ID="lbDescricion" runat="server" Text="DESCRIPCIÓN:" Font-Bold="true"></asp:Label>
                <p runat="server" id="txtDecripcion"></p>

                <asp:Label ID="lbDirector" runat="server" Text="DIRECTOR:" Font-Bold="true"></asp:Label>
                <p runat="server" id="txtDirector"></p>

                <asp:Label ID="lbElenco" runat="server" Text="ELENCO PARTICIPANTE:" Font-Bold="true"></asp:Label>
                <p runat="server" id="txtElenco"></p>

                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lbPrecioVenta" runat="server" Text="PRECIO DE VENTA:" Font-Bold="true"></asp:Label>
                        <p runat="server" id="txtPrecioVenta"></p>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbPrecioAlquiler" runat="server" Text="PRECIO DE ALQUILER:" Font-Bold="true"></asp:Label>
                        <p runat="server" id="txtPrecioAlquiler"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div runat="server" id="btnComprarSel">
                            <asp:Button class="btn btn-dark btn-block" data-target="#detalleCompra" data-toggle="modal">COMPRAR</asp:Button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div runat="server" id="btnAlquilarSel">
                            <asp:Button class="btn btn-danger btn-block" data-target="#detalleAlquiler" data-toggle="modal">ALQUILAR</asp:Button>
                        </div>
                    </div>
                </div>
            </div>

            <br />
        </div>

        <div style="margin-right: auto; margin-top: 20px; width: 70%; background: #f3f3f3; border-radius: 4px; padding-top: 5px;" class="col-md-6" runat="server">
            <h4>Comentarios</h4>
            <div id="FormComent" runat="server">
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" placeholder="Añadir comentario público ..." runat="server" ID="txtComent" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
                <asp:Button runat="server" ID="btnComent" CssClass="btn btn-primary pull-right" OnClick="btnComent_Click" Text="Comentar" />
                <br />
                <br />
            </div>

            <div class="row">
                <asp:Repeater ID="ListComents" runat="server">
                    <ItemTemplate>
                        <div class="container" style="border-bottom: 1px solid #c4c4c4; padding-top: 10px">
                            <%--<asp:Label ID="nameUser" runat="server" Font-Bold="true" Text='<%# Eval("UserName")%>'></asp:Label>--%>
                            <p><strong><%# Eval("UserName")%>: </strong><%# Eval("textComent")%></p>
                            <small class="pull-right"><%# Eval("Fecha")%></small>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>

    </div>

    <br />

    <div class="container" runat="server">
        <div class="row">
            <div class="col-md-8">
                <div class="modal" id="detalleCompra" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <br />
                                <h4>Formulario de Compra</h4>
                                <button class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Nombre del Propietario de Tarjeta:" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="txtNombrePropie" runat="server"
                                            CssClass="form-control" Enabled="false"
                                            placeholder="Ingrese el Nombre del Propietario"> </asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="Número de Tarjeta:" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="txtNumTarjeta" runat="server"
                                                    CssClass="form-control" TextMode="Number"
                                                    placeholder="XXXX-XXXX-XXXX-XXXX"> </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ValidationGroup="formCompra"
                                                    ControlToValidate="txtNumTarjeta"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ErrorMessage="Ingrese su Tarjeta">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" Text="Código de Seguridad" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="txtCodeTarjeta" runat="server"
                                                    CssClass="form-control" TextMode="Number"
                                                    placeholder="Código"> </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ValidationGroup="formCompra"
                                                    ControlToValidate="txtCodeTarjeta"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ErrorMessage="Ingrese su Codigo">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<asp:Label ID="lbValidator" runat="server" Text="No deja Ningun Campo Vacio" Visible="false"></asp:Label>--%>
                                    <asp:LinkButton CssClass="btn btn-dark btn-block" ID="btnConfirmCompra" runat="server"
                                        Text="CONFIRMAR COMPRA" OnClick="btnConfirmCompra_Click" ValidationGroup="formCompra"></asp:LinkButton>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <small>Copyright © JOYANA 2017</small>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="container" runat="server">
        <div class="row">
            <div class="col-md-8">
                <div class="modal" id="detalleAlquiler" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <br />
                                <h4>Formulario de Alquiler</h4>
                                <button class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                                <div class="container" runat="server">
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Nombre del Propietario de Tarjeta:" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="alq_txtNomPropie" runat="server"
                                            CssClass="form-control" Enabled="false"
                                            placeholder="Ingrese el Nombre del Propietario"> </asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" Text="Número de Tarjeta:" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="alq_txtNumTarjeta" runat="server"
                                                    CssClass="form-control" TextMode="Number"
                                                    placeholder="XXXX-XXXX-XXXX-XXXX"> </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ValidationGroup="formAlquiler"
                                                    ControlToValidate="alq_txtNumTarjeta"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ErrorMessage="Ingrese su Tarjeta">
                                                </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <asp:Label ID="Label6" runat="server" Text="Código de Seguridad" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="alq_txtCodigoTarjeta" runat="server"
                                                    CssClass="form-control" TextMode="Number"
                                                    placeholder="Código"> </asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ValidationGroup="formAlquiler"
                                                    ControlToValidate="alq_txtCodigoTarjeta"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ErrorMessage="Ingrese su Codigo">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="Label7" runat="server" Text="Costo x Día:" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="alq_txtCostoAlquixDia" runat="server"
                                                    CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="Label8" runat="server" Text="Días por Alquilar:" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="alq_txtDiasxAlquilar" runat="server"
                                                    CssClass="form-control" TextMode="Number"
                                                    placeholder="Días"> </asp:TextBox>
                                                <asp:CompareValidator runat="server"
                                                    ControlToValidate="alq_txtDiasxAlquilar"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValueToCompare="1"
                                                    Operator="GreaterThanEqual"
                                                    ErrorMessage="Seleccione más de 1 Día">
                                                </asp:CompareValidator>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ValidationGroup="formAlquiler"
                                                    ControlToValidate="alq_txtDiasxAlquilar"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ErrorMessage="Ingrese los días de Alquiler">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<asp:Label ID="lbValidator" runat="server" Text="No deja Ningun Campo Vacio" Visible="false"></asp:Label>--%>
                                    <asp:LinkButton CssClass="btn btn-danger btn-block" ID="btnConfirmAlquiler" runat="server"
                                        Text="CONFIRMAR ALQUILER" OnClick="btnConfirmAlquiler_Click" ValidationGroup="formAlquiler"></asp:LinkButton>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <small>Copyright © JOYANA 2017</small>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <%--<script type="text/javascript" src="../JoyanaADMI/Style/js/bootstrap.js"></script>--%>
</asp:Content>

