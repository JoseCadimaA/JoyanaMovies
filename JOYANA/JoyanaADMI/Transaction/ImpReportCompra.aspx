<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ImpReportCompra.aspx.cs" Inherits="JoyanaADMI_Transaction_ImpReportCompra" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div id="formRegist" class="col-md-10 col-md-offset-1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="500px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="900px">
                <LocalReport ReportPath="JoyanaADMI\Reportes\ReportCompra.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="CompraODS" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="CompraODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCompraByID" TypeName="Compra_DSTableAdapters.CompraTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="CompraId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Fecha" Type="DateTime" />
                    <asp:Parameter Name="TotalPago" Type="Decimal" />
                    <asp:Parameter Name="TarjetaCredito" Type="String" />
                    <asp:Parameter Name="CodigoTarjeta" Type="String" />
                    <asp:Parameter Name="Estado" Type="Boolean" />
                    <asp:Parameter Name="UserId" Type="Int32" />
                    <asp:Parameter Name="PeliculaId" Type="Int32" />
                    <asp:Parameter Direction="InputOutput" Name="CompraId" Type="Object" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter DefaultValue="" ControlID="CompraIdHiddenField" Name="CompraId" Type="Int32" PropertyName="Value" />
<%--                    <asp:Parameter DefaultValue="14" Name="CompraId" Type="Int32" />--%>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Fecha" Type="DateTime" />
                    <asp:Parameter Name="TotalPago" Type="Decimal" />
                    <asp:Parameter Name="TarjetaCredito" Type="String" />
                    <asp:Parameter Name="CodigoTarjeta" Type="String" />
                    <asp:Parameter Name="Estado" Type="Boolean" />
                    <asp:Parameter Name="CompraId" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>

            <asp:HiddenField ID="CompraIdHiddenField" runat="server" Value="0" />
        </div>
    </form>
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

