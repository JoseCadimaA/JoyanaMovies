<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistUsers.aspx.cs" Inherits="MelodyADMIN_RegistUsers" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Registrar</title>
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <div class="container">
        <div class="card card-register mx-auto mt-5">
            <div class="card-header">Registrar Nuevo Usuario</div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Nombre</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ingrese su Nombre"></asp:TextBox>
                                <!--input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter first name"-->
                            </div>
                            <div class="col-md-6">
                                <label>Apellidos</label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Ingrese su Apellido"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese su Email" TextMode="Email"></asp:TextBox>
                    </div>              
                    
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Contraseña</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Ingrese su Contraseña" TextMode="Password"></asp:TextBox>                                
                            </div>
                            <div class="col-md-6">
                                <label>Confirmar Contraseña</label>
                                <asp:TextBox ID="txtRePassword" runat="server" CssClass="form-control" placeholder="Confimar Contraseña" TextMode="Password"></asp:TextBox>                                
                            </div>
                            
                        </div>
                    </div>
                    <asp:Label ID="lbValidator" ForeColor="Red" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary btn-block" OnClick="btnRegistrar_Click"/>                    
                    
                </form>
                
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
