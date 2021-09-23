using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace PRUEBA_SOLICITUD
{
    public partial class Aprobacion : System.Web.UI.Page
    {
        string IdProceso;
        string IdSolicitud;
       static string aprobador;
       static string correoEmpleado;

        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["IDPROCESS"] != null && Session["IDSOLICITUD"] != null)
                {

                    IdProceso = Session["IDPROCESS"].ToString();
                    IdSolicitud = Session["IDSOLICITUD"].ToString();


                }



                Label1.Text = IdProceso;
                ListarProceso(IdSolicitud);
                CorreoEmpleado();
                Aprobador();
            }


        }
        void ListarProceso(string id)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_ListarSolicitud", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", id);

            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();

            tbNoSolicitud.Text = table.Rows[0]["ID_SOLICITUD"].ToString();
            tbNoEmpleado.Text = table.Rows[0]["IDEMPLEADO"].ToString();
            tbTitulo.Text = table.Rows[0]["TITULO"].ToString();
            tbDescripcion.Text = table.Rows[0]["DESCRIPCION"].ToString();
            listArea.Items.Add(table.Rows[0]["AREA"].ToString());
            listTipo.Items.Add(table.Rows[0]["TIPO"].ToString());
            tbPosicion.Text = table.Rows[0]["POSICION"].ToString();
            tbMonto.Text = table.Rows[0]["MONTO"].ToString();
            lbEstado.Text = table.Rows[0]["ESTATUS"].ToString();



        }

        void CorreoEmpleado()
        {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_BuscarEmpleado", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", tbNoEmpleado.Text.Trim());

            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();


            correoEmpleado = table.Rows[0]["CORREO"].ToString();
        }
        void Aprobador() {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_ListarProceso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", IdSolicitud);

            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();

           

              aprobador = table.Rows[0]["APROBADOR"].ToString();
           

        }



        void ActualizarProceso(int idProceso, string Estado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SP_ActualizarProceso", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();

                cmd.Parameters.AddWithValue("@IDPROCESO", idProceso);
                cmd.Parameters.AddWithValue("@ESTADO", Estado);



                cmd.ExecuteNonQuery();
                conexion.Close();

            }
            catch { conexion.Close(); };
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            ActualizarProceso(Convert.ToInt32(Label1.Text), "APROBADA");
            string mensaje = "<body>" +
                                      "<h1>Tienes una aprobación</h1>" +
                                      "<br/>" +
                                      "<span> <strong>Tu solicitud ha sido aprobada por :</strong> " + aprobador.ToString() + "</span> <br/>" +

                                        "<p>Continue en el proceso</p>" +
                                     "</body>"


                        ;
            Correo objCorreo = new Correo();
            objCorreo.EnviarCorreo(correoEmpleado, "Tienes una Aprobación", mensaje);

            Response.Write("La solicitud fue aprobada");
            btnAprobar.Enabled = false;
            btnDeclinar.Enabled = false;
        }

        protected void btnDeclinar_Click(object sender, EventArgs e)
        {
            ActualizarProceso(Convert.ToInt32(Label1.Text), "DECLINADA");
            string mensaje = "<body>" +
                                     "<h1>Tienes una Declinación</h1>" +
                                     "<br/>" +
                                     "<span> <strong>Tu solicitud ha sido declinada por :</strong> " + aprobador.ToString() + "</span> <br/>" +

                                       "<p>Continue en el proceso</p>" +
                                    "</body>"


                       ;
            Correo objCorreo = new Correo();
            objCorreo.EnviarCorreo(correoEmpleado, "Tienes una declinación", mensaje);
            Response.Write("La solicitud fue declinada");
            btnAprobar.Enabled = false;
            btnDeclinar.Enabled = false;
        }


    }
}