<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="PRUEBA_SOLICITUD.Solicitud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="Recursos/css/Style.css" rel="stylesheet" />
    <title>Solicitud</title>
</head>
<body class="bg-light">
    <nav class="navbar sticky-top navbar-dark bg-dark ">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 mx-auto">Aprobaciones de solicitudes</span>
  </div>
</nav>
    <div class="wrapper">
       <div class="formcontent p-3">
          <form id="formulario_login" runat="server">
         <div class="form-control">
           
             <div class="row">
                 <div class="col-6">
              <div>
                 <asp:Label ID="lbNoSolicitud" runat="server" Text="No. Solicitud:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbNoSolicitud" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>
             <div>
                 <asp:Label ID="lbIDemplaedo" runat="server" Text="ID Empleado:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbNoEmpleado" CssClass="form-control form-control-sm" type="number" runat="server" placeholder="Ingrese su ID" OnTextChanged="tbNoEmpleado_TextChanged"></asp:TextBox>
             </div>
           

              <div>
                 <asp:Label ID="lbTitulo" runat="server" Text="Título:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbTitulo" CssClass="form-control form-control-sm" runat="server" placeholder="Ingrese el título"></asp:TextBox>
             </div>

              <div>
                 <asp:Label ID="lbDescripcion" runat="server" Text="Descripción:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbDescripcion" CssClass="form-control form-control-sm" runat="server" placeholder="Ingrese la descripción"></asp:TextBox>
             </div>


                <div>
                 <asp:Label ID="lbArea" runat="server" Text="Área solicitante:" Font-Bold="True"></asp:Label>
                    <asp:DropDownList ID="listArea"  CssClass="form-select form-select-sm" runat="server" EnableTheming="True"></asp:DropDownList>
                  
             </div>
              <div>
                 <asp:Label ID="lbTipo" runat="server" Text="Tipo de solicitud:" Font-Bold="True"></asp:Label>
                 <asp:DropDownList ID="listTipo"  CssClass="form-select form-select-sm" runat="server" ></asp:DropDownList>
               </div>

              <div>
                 <asp:Label ID="lbPosicion" runat="server" Text="Posición del solicitante:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbPosicion" CssClass="form-control form-control-sm" runat="server" placeholder="" Enabled="False"></asp:TextBox>
             </div>

              <div>
                 <asp:Label ID="lbMonto" runat="server" Text="Monto:" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="tbMonto" CssClass="form-control form-control-sm" type="number" runat="server" placeholder="$ 0.00"></asp:TextBox>
             </div>

             <div>
                 <asp:Label ID="lbEstatus" runat="server" Text="Estatus de la solicitud:" Font-Bold="True"></asp:Label>

             </div>
                 </div>

                 <div class="col-6">
                      <asp:Label ID="Label1" runat="server" Text="Seleccione los Aprobadores:" Font-Bold="True"></asp:Label>
                   
                     <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                       
                 </div>





             </div>


             <hr />

             <div class="row"> 
                 <asp:Label ID="lbError" runat="server" CssClass="alert-danger"></asp:Label>

             </div>
             <div class="w-100">
                 <asp:Button ID="btnEnviar" CssClass="form-control btn btn-primary btn-dark" runat="server" Text="Enviar"  OnClick="btnEnviar_Click"/>
             </div>
        </div>
         </form>
       </div>
    </div>
   
</body>
</html>
