<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ImpReportAlquiler.aspx.cs" Inherits="JoyanaADMI_Transaction_ImpReportAlquiler" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div id="formRegist" class="col-md-10 col-md-offset-1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="500px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="900px">
                <LocalReport ReportPath="JoyanaADMI\Reportes\ReportAlquiler.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="AlquilerODS" Name="DataSet5" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="AlquilerODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlquilerByID" TypeName="Alquiler_DSTableAdapters.AlquilerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="AlquilerId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TotalPago" Type="Decimal" />
                    <asp:Parameter Name="FechaAlqui" Type="DateTime" />
                    <asp:Parameter Name="FechaDevol" Type="DateTime" />
                    <asp:Parameter Name="TarjetaCredito" Type="String" />
                    <asp:Parameter Name="CodigoTarjeta" Type="String" />
                    <asp:Parameter Name="Estado" Type="Boolean" />
                    <asp:Parameter Name="UserId" Type="Int32" />
                    <asp:Parameter Name="PeliculaId" Type="Int32" />
                    <asp:Parameter Direction="InputOutput" Name="AlquilerId" Type="Object" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter DefaultValue="" ControlID="AlquilerIdHiddenField" Name="AlquilerId" Type="Int32" PropertyName="Value" />
                    <%--<asp:Parameter DefaultValue="10" Name="AlquilerId" Type="Int32" />--%>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TotalPago" Type="Decimal" />
                    <asp:Parameter Name="FechaAlqui" Type="DateTime" />
                    <asp:Parameter Name="FechaDevol" Type="DateTime" />
                    <asp:Parameter Name="TarjetaCredito" Type="String" />
                    <asp:Parameter Name="CodigoTarjeta" Type="String" />
                    <asp:Parameter Name="Estado" Type="Boolean" />
                    <asp:Parameter Name="AlquilerId" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>

            <asp:HiddenField ID="AlquilerIdHiddenField" runat="server" Value="0" />
        </div>
    </form>
    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

