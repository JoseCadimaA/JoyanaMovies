<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginAdmin.aspx.cs" Inherits="JoyanaADMI_UsersAdmin_LoginAdmin" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Iniciar Sesión</title>
    <!-- Bootstrap core CSS-->
    <link href="../../JoyanaUSER/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../../JoyanaUSER/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../../JoyanaUSER/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Login Administrador</div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese su Email" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Ingrese su Contraseña" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Label ID="lbValidator" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary btn-block" OnClick="btnIngresar_Click" />
                </form>
                
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="../../JoyanaUSER/vendor/jquery/jquery.min.js"></script>
    <script src="../../JoyanaUSER/vendor/popper/popper.min.js"></script>
    <script src="../../JoyanaUSER/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../../JoyanaUSER/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
