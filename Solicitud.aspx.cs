using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

using System.Net.Mail;
using System.Net;


namespace PRUEBA_SOLICITUD
{
    public partial class Solicitud : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

       static string correo;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack) {
                ListarAprobadores();
                ListarNoSolicitud();
                ListarArea();
                ListarTipo();
            }
          

        }
        void ListarAprobadores()
        {

            DataTable table = new DataTable();
            SqlDataReader readRows;
            SqlCommand cmd = new SqlCommand("SP_ListarAprobador", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            readRows = cmd.ExecuteReader();
            table.Load(readRows);

            readRows.Close();
            conexion.Close();

            CheckBoxList1.DataSource = table;
            CheckBoxList1.DataTextField = "NOMBRE";
            CheckBoxList1.DataValueField = "ID_APROBADOR";
            CheckBoxList1.DataBind();

        }

        void ListarNoSolicitud()
        {
            string id;
            int no;

            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_NoSolicitud", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();


            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();

            id = table.Rows[0]["ID"].ToString();

            no = Convert.ToInt32(id);

            tbNoSolicitud.Text = Convert.ToString(no+1);

        }
        void BuscarPosicion(){
           
                
                DataTable table = new DataTable();
                SqlCommand cmd = new SqlCommand("SP_BuscarEmpleado", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();

                cmd.Parameters.AddWithValue("@BUSCAR", tbNoEmpleado.Text.Trim());

                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DA.Fill(table);

                conexion.Close();

                tbPosicion.Text = table.Rows[0]["POSICION"].ToString();
                correo = table.Rows[0]["CORREO"].ToString();
        }

        void ListarArea() {
            DataTable table = new DataTable();
            SqlDataReader readRows;
            SqlCommand cmd = new SqlCommand("SP_ListarArea", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            readRows = cmd.ExecuteReader();
            table.Load(readRows);

            readRows.Close();
            conexion.Close();

            listArea.DataSource = table;
          
            listArea.DataTextField = "NOMBRE";
            listArea.DataValueField = "ID_AREA";
            listArea.DataBind();

            listArea.SelectedIndex = -1;
        }


        void ListarTipo() {
            DataTable table = new DataTable();
            SqlDataReader readRows;
            SqlCommand cmd = new SqlCommand("SP_ListarTipo", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            readRows = cmd.ExecuteReader();
            table.Load(readRows);

            readRows.Close();
            conexion.Close();

            listTipo.DataSource = table;

            listTipo.DataTextField = "NOMBRE";
            listTipo.DataValueField = "ID_TIPO_SOLICITUD";
            listTipo.DataBind();

            listTipo.SelectedIndex = -1;

        }


        protected void tbNoEmpleado_TextChanged(object sender, EventArgs e)
        {
            BuscarPosicion();
        }

        void InsertarSolicitud() {
            try
            {
                SqlCommand cmd = new SqlCommand("SP_CrearSolicitud", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();

                cmd.Parameters.AddWithValue("@IDEMPLEADO", Convert.ToInt32(tbNoEmpleado.Text.Trim()));
                cmd.Parameters.AddWithValue("@TITULO", tbTitulo.Text);
                cmd.Parameters.AddWithValue("@DESCRIPCION", tbDescripcion.Text);
                cmd.Parameters.AddWithValue("@IDAREA", Convert.ToInt32(listArea.SelectedValue));
                cmd.Parameters.AddWithValue("@IDTIPO", Convert.ToInt32(listTipo.SelectedValue));
                cmd.Parameters.AddWithValue("@POSICION", tbPosicion.Text);
                cmd.Parameters.AddWithValue("@MONTO", Convert.ToDecimal(tbMonto.Text));



                cmd.ExecuteNonQuery();
                conexion.Close();

            }
            catch { conexion.Close();
                lbError.Text = "Ocurrio un error";
            };

        }

        void InsertarProceso() {
            using (SqlCommand cmd = new SqlCommand("SP_CrearProcesos", conexion))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();
                SqlTransaction transaction;
                transaction = conexion.BeginTransaction();
                cmd.Connection = conexion;
                cmd.Transaction = transaction;
                //recorremos el objeto List

                try
                {



                    for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                    {
                        if (CheckBoxList1.Items[i].Selected == true)
                        {

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@IDAPROBADOR", Convert.ToInt32(CheckBoxList1.Items[i].Value.ToString()));
                            cmd.Parameters.AddWithValue("@IDSOLICITUD", Convert.ToInt32(tbNoSolicitud.Text));
                            cmd.Parameters.AddWithValue("@ESTADO", "PENDIENTE");
                            //Alguna accion al encontrar un check seleccionado
                            cmd.ExecuteNonQuery();
                        }
                    }

                    transaction.Commit();
                    conexion.Close();
                }
                catch
                {
                    transaction.Rollback();
                    conexion.Close();
                    lbError.Text = "Ocurrio un error";
                }
            }
        }

     
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
    


            try
            {
                if (tbMonto.Text != "") {
                    InsertarSolicitud();
                    InsertarProceso();


                   

                            string mensaje = "<body>"+
                                      "<h1>Su Solicitud ha sido sometida</h1>"+
                                      "<br/>"+
                                        "<span> <strong>No. Solicitud:</strong> " + tbNoSolicitud.Text+"</span> <br/>"+
                                        "<span> <strong>ID Empleado: </strong>" + tbNoEmpleado.Text + "</span> <br/>" +
                                        "<span> <strong>Titulo: </strong>" + tbTitulo.Text + "</span> <br/>" +
                                        "<span> <strong>Descripcion:</strong> " + tbDescripcion.Text + "</span> <br/>" +
                                        "<span> <strong>Area Solicitante: </strong>" + listArea.Text + "</span> <br/>" +
                                        "<span> <strong>Tipo de Solictud: </strong>" + listArea.Text + "</span> <br/>" +
                                        "<span> <strong>Posicion del Solicitante: </strong>" + tbPosicion.Text + "</span> <br/>" +
                                        "<span> <strong>Monto:</strong> $" + tbMonto.Text + "</span> <br/>" +
                                         "<span> <strong>Estatus de la solicitud:</strong>PENDIENTE</span> <br/>" +
                                        "<p>Continue en el proceso</p>" +
                                     "</body>"
                        
                        
                        ;
                    Correo objCorreo = new Correo();
                    objCorreo.EnviarCorreo(correo, "Ha sometido una solicitud", mensaje);
                    Response.Redirect("Index.aspx?parametro=" + tbNoSolicitud.Text);
                }
            }
            catch {
               
            }

            





        }

      
    }
}