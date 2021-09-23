using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace PRUEBA_SOLICITUD
{
    public partial class Index : System.Web.UI.Page
    {
        public int idProcess;
        public string idSolicitud;
        public string IdSolicitudProceso;
        static string correoEmpleado;
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {


                if (Request.Params["parametro"] != null)
                {
                    IdSolicitudProceso = Request.Params["parametro"].ToString();
                  

                }
                else
                {
                    Response.Redirect("Solicitud.apsx");

                }
                ListarProceso();
                EnviarCorreo();

            




        }
        void ListarProceso() {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_ListarProceso", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", IdSolicitudProceso);

            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();

            GridView1.DataSource = table;
            GridView1.DataBind();
           

        }
         void CorreoEmpleado(string idEmpleado)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_BuscarEmpleado", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", idEmpleado);

            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(table);

            conexion.Close();


            correoEmpleado = table.Rows[0]["CORREO"].ToString();
        }

        void EnviarCorreo()
        {
            /*int r = 0;
            while (r < GridView1.Rows.Count) {
                r++;*/

            foreach (GridViewRow row in GridView1.Rows)
            {

                if (row.Cells[6].Text.ToString() != "En Evaluacion")
                {

                    if (row.Cells[6].Text.ToString() == "PENDIENTE")
                    {

                        idProcess = Convert.ToInt32(row.Cells[0].Text.ToString());
                        idSolicitud = row.Cells[4].Text.ToString();
                        Session["IDPROCESS"] = idProcess;
                        Session["IDSOLICITUD"] = idSolicitud;

                        ActualizarProcesoEvaluacion(idProcess, "En Evaluacion");
                        string correo = row.Cells[3].Text.ToString();
                        string mensaje = "Aqui esta una solicitud para evaluar: https://localhost:44300/Aprobacion.aspx";
                        Correo objCorreo = new Correo();
                        objCorreo.EnviarCorreo(correo, "Evaluar Solicitud", mensaje);
                        ListarProceso();
                       /// ("Aprobacion.aspx");
                        break;
                    }else if (row.Cells[6].Text.ToString() == "DECLINADA")
                    {
                        CorreoEmpleado(row.Cells[7].Text.ToString());

                        string mensaje = "<body>" +
                                  "<h1>Solicitud Rechazada</h1>" +
                                  "<br/>" +
                                  "<span> <strong>Tu solicitud ha sido declinada totalmente</strong></span> <br/>" +

                                    "<p>El proceso ha finalizado</p>" +
                                     "<p>Puede iniciar el proceso accediendo aqui:https://localhost:44300/Solicitud.aspx </p>" +
                                 "</body>"


                    ;
                        Correo objCorreo = new Correo();
                        objCorreo.EnviarCorreo(correoEmpleado, "Solicitud", mensaje);

                        break;
                    }

                }
                else { 


                    break;
                }

                /*
                 if (row.Cells[6].Text.ToString() == "APROBADA")
                {
                    string correo = row.Cells[3].Text.ToString();
                    string mensaje = "Tu Solicitud ha sido aprobada por: ";
                    Correo objCorreo = new Correo();
                    objCorreo.EnviarCorreo(correo, "Evaluar Solicitud", mensaje);
                }*/





            }
      








            /* for(int i = 0; i <= GridView1.Rows.Count; i++ )
             {

                 var estado = GridView1.Rows[i].Cells[6].Text;

                     switch (estado.ToString()) {
                         case "Pendiente":
                             do {
                                 int id = Convert.ToInt32( GridView1.Rows[i].Cells[0].Text.ToString());
                                 ActualizarProcesoEvaluacion(id, "En Evaluacion");
                                     string correo = GridView1.Rows[i].Cells[3].Text.ToString();
                                     string mensaje = "Aqui esta una solicitud para evaluar: ";
                                     Correo objCorreo = new Correo();
                                     objCorreo.EnviarCorreo(correo, "Evaluar Solicitud", mensaje);
                                     break;

                             } while (estado != "En evaluacion");





                             break;*/
            /*
                                    case "APROBADA":

                                        break;



                                    case "DECLINADA":
                                        break;



                                    default:

                                        break;*/

            /*    }




        }*/

        }

        void ActualizarProcesoEvaluacion(int idProceso, string Estado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SP_ActualizarProcesoEvaluacion", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();

                cmd.Parameters.AddWithValue("@IDPROCESO", idProceso);
                cmd.Parameters.AddWithValue("@ESTADO", Estado);



                cmd.ExecuteNonQuery();
                conexion.Close();

            }
            catch { conexion.Close(); };
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListarProceso();
            EnviarCorreo();
        }

      
    }
}