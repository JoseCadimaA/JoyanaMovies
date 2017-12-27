<%@ Page Title="" Language="C#" MasterPageFile="~/JoyanaADMI/MasterPage.master" AutoEventWireup="true" CodeFile="ImpReportFavoritos.aspx.cs" Inherits="JoyanaADMI_Transaction_ImpReportFavoritos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div id="formRegist" class="col-md-10 col-md-offset-1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="500px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="900px">
                <LocalReport ReportPath="JoyanaADMI\Reportes\ReportLikes.rdlc">
                </LocalReport>
            </rsweb:ReportViewer>
        </div>
    </form>

    <script type="text/javascript" src="../Style/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../Style/js/bootstrap.js"></script>
</asp:Content>

