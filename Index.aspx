<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PRUEBA_SOLICITUD.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="Recursos/css/Style.css" rel="stylesheet" />
    <title>Procesos de Solicitud</title>
</head>
<body class="bg-light">
    <nav class="navbar sticky-top navbar-dark bg-dark ">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 mx-auto">Aprobaciones de solicitudes</span>
  </div>
</nav>
    <div class="wrapper">
       <div class="formcontent p-3">
            <form id="formulario" runat="server">
              <div class="text-center mb-5">
                 <asp:Label class="h4" ID="lbBienvenida" runat="server" Text="Proceso de aprobación"></asp:Label>
             </div>
           <asp:GridView ID="GridView1" CssClass="table table-dark" runat="server" Font-Size="Small"></asp:GridView>
                <asp:Button ID="Button1"  CssClass="btn btn-dark" runat="server"  OnClick="Button1_Click" Text="Refresh" />
                
                </form>
       </div>
    </div>
   
</body>
</html>
