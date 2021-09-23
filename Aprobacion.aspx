<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aprobacion.aspx.cs" Inherits="PRUEBA_SOLICITUD.Aprobacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="Recursos/css/Style.css" rel="stylesheet" />
    <title>Aprobacion</title>
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
                 <asp:Label class="h4" ID="lbBienvenida" runat="server" Text="Aprobación"></asp:Label>
             </div>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

              <div>
                 <asp:Label ID="lbNoSolicitud" runat="server" Text="No. Solicitud:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbNoSolicitud" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>
             <div>
                 <asp:Label ID="lbIDemplaedo" runat="server" Text="Empleado:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbNoEmpleado" CssClass="form-control form-control-sm"  runat="server" placeholder="" Enabled="False" ></asp:TextBox>
             </div>
           

              <div>
                 <asp:Label ID="lbTitulo" runat="server" Text="Título:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbTitulo" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>

              <div>
                 <asp:Label ID="lbDescripcion" runat="server" Text="Descripción:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbDescripcion" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>


                <div>
                 <asp:Label ID="lbArea" runat="server" Text="Área solicitante:" Font-Bold="True"></asp:Label>
                    <asp:DropDownList ID="listArea"  CssClass="form-select form-select-sm" runat="server" Enabled="False" ></asp:DropDownList>
                  
             </div>
              <div>
                 <asp:Label ID="lbTipo" runat="server" Text="Tipo de solicitud:" Font-Bold="True"></asp:Label>
                 <asp:DropDownList ID="listTipo"  CssClass="form-select form-select-sm" runat="server" Enabled="False" ></asp:DropDownList>
               </div>

              <div>
                 <asp:Label ID="lbPosicion" runat="server" Text="Posición del solicitante:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbPosicion" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>

              <div>
                 <asp:Label ID="lbMonto" runat="server" Text="Monto:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbMonto" CssClass="form-control form-control-sm" type="number" runat="server" Enabled="False"></asp:TextBox>
             </div>
                <div>
                 <asp:Label ID="lbEstatus" runat="server" Text="Estatus de la solicitud:" Font-Bold="True"></asp:Label>
                  <asp:Label ID="lbEstado" runat="server"  Font-Bold="false"></asp:Label>
             </div>
                <br />
                <div class="d-grid gap-2">
                    <asp:Button ID="btnAprobar" CssClass="btn btn-success" runat="server" OnClick="btnAprobar_Click" Text="Aprobar" />
                    
                    <asp:Button ID="btnDeclinar"  CssClass="btn btn-danger" runat="server" OnClick="btnDeclinar_Click"  Text="Declinar" />
               </div>


                </form>
       </div>
    </div>
        
   
</body>
</html>
