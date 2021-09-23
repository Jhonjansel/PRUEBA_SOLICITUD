USE [master]
GO
/****** Object:  Database [PRUEBA_TECNICA]    Script Date: 9/23/2021 3:24:07 PM ******/
CREATE DATABASE [PRUEBA_TECNICA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRUEBA_TECNICA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRUEBA_TECNICA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRUEBA_TECNICA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRUEBA_TECNICA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRUEBA_TECNICA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRUEBA_TECNICA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET  MULTI_USER 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRUEBA_TECNICA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRUEBA_TECNICA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRUEBA_TECNICA] SET QUERY_STORE = OFF
GO
USE [PRUEBA_TECNICA]
GO
/****** Object:  Table [dbo].[APROBADORES]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APROBADORES](
	[ID_APROBADOR] [int] NOT NULL,
	[NOMBRE] [varchar](50) NULL,
	[CORREO] [nvarchar](50) NULL,
 CONSTRAINT [PK_APROBADORES] PRIMARY KEY CLUSTERED 
(
	[ID_APROBADOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AREAS]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AREAS](
	[ID_AREA] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NULL,
 CONSTRAINT [PK_AREAS] PRIMARY KEY CLUSTERED 
(
	[ID_AREA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[ID_EMPLEADO] [int] NOT NULL,
	[NOMBRE] [varchar](50) NULL,
	[CORREO] [nvarchar](50) NULL,
	[POSICION] [nvarchar](50) NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[ID_EMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROCESOS]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESOS](
	[ID_PROCESO] [int] IDENTITY(1,1) NOT NULL,
	[IDAPROBADOR] [int] NULL,
	[IDSOLICITUD] [int] NULL,
	[FECHA] [date] NULL,
	[ESTADO] [nvarchar](50) NULL,
 CONSTRAINT [PK_PROCESOS] PRIMARY KEY CLUSTERED 
(
	[ID_PROCESO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOLICITUDES]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOLICITUDES](
	[ID_SOLICITUD] [int] IDENTITY(1,1) NOT NULL,
	[IDEMPLEADO] [int] NULL,
	[TITULO] [nvarchar](50) NULL,
	[DESCRIPCION] [nvarchar](100) NULL,
	[IDAREA] [int] NULL,
	[IDTIPOSOLICITUD] [int] NULL,
	[POSICION] [varchar](50) NULL,
	[MONTO] [decimal](11, 2) NULL,
	[ESTATUS] [varchar](50) NULL,
 CONSTRAINT [PK_SOLICITUDES] PRIMARY KEY CLUSTERED 
(
	[ID_SOLICITUD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_SOLICITUD]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_SOLICITUD](
	[ID_TIPO_SOLICITUD] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NULL,
 CONSTRAINT [PK_TIPO_SOLICITUD] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_SOLICITUD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PROCESOS]  WITH CHECK ADD  CONSTRAINT [FK_PROCESOS_APROBADORES] FOREIGN KEY([IDAPROBADOR])
REFERENCES [dbo].[APROBADORES] ([ID_APROBADOR])
GO
ALTER TABLE [dbo].[PROCESOS] CHECK CONSTRAINT [FK_PROCESOS_APROBADORES]
GO
ALTER TABLE [dbo].[PROCESOS]  WITH CHECK ADD  CONSTRAINT [FK_PROCESOS_SOLICITUDES] FOREIGN KEY([IDSOLICITUD])
REFERENCES [dbo].[SOLICITUDES] ([ID_SOLICITUD])
GO
ALTER TABLE [dbo].[PROCESOS] CHECK CONSTRAINT [FK_PROCESOS_SOLICITUDES]
GO
ALTER TABLE [dbo].[SOLICITUDES]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUDES_AREAS] FOREIGN KEY([IDAREA])
REFERENCES [dbo].[AREAS] ([ID_AREA])
GO
ALTER TABLE [dbo].[SOLICITUDES] CHECK CONSTRAINT [FK_SOLICITUDES_AREAS]
GO
ALTER TABLE [dbo].[SOLICITUDES]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUDES_EMPLEADOS] FOREIGN KEY([IDEMPLEADO])
REFERENCES [dbo].[EMPLEADOS] ([ID_EMPLEADO])
GO
ALTER TABLE [dbo].[SOLICITUDES] CHECK CONSTRAINT [FK_SOLICITUDES_EMPLEADOS]
GO
ALTER TABLE [dbo].[SOLICITUDES]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUDES_TIPO_SOLICITUD] FOREIGN KEY([IDTIPOSOLICITUD])
REFERENCES [dbo].[TIPO_SOLICITUD] ([ID_TIPO_SOLICITUD])
GO
ALTER TABLE [dbo].[SOLICITUDES] CHECK CONSTRAINT [FK_SOLICITUDES_TIPO_SOLICITUD]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarProceso]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarProceso](
@IDPROCESO INT,
@ESTADO VARCHAR(50)
)
AS
BEGIN
IF @ESTADO = 'APROBADA'
BEGIN
UPDATE PROCESOS SET  FECHA = GETDATE(), ESTADO = @ESTADO WHERE ID_PROCESO = @IDPROCESO;
END

ELSE
BEGIN
UPDATE PROCESOS SET FECHA = GETDATE(), ESTADO = 'DECLINADA' WHERE ID_PROCESO = @IDPROCESO;
END


END
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarProcesoEvaluacion]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarProcesoEvaluacion](
@IDPROCESO INT,
@ESTADO VARCHAR(50)
)
AS
BEGIN

UPDATE PROCESOS SET  ESTADO = @ESTADO WHERE ID_PROCESO = @IDPROCESO;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarEmpleado]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarEmpleado](
@BUSCAR NVARCHAR(11)
)
AS 
BEGIN
SELECT POSICION, CORREO FROM EMPLEADOS WHERE ID_EMPLEADO = @BUSCAR
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearProcesos]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearProcesos](
@IDAPROBADOR INT,
@IDSOLICITUD INT,
@ESTADO VARCHAR(20)
)
AS 
BEGIN
INSERT INTO PROCESOS(IDAPROBADOR,IDSOLICITUD, ESTADO) VALUES(@IDAPROBADOR, @IDSOLICITUD, @ESTADO)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearSolicitud]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearSolicitud](
@IDEMPLEADO INT,
@TITULO NVARCHAR(50),
@DESCRIPCION NVARCHAR(50),
@IDAREA INT,
@IDTIPO INT,
@POSICION VARCHAR(50),
@MONTO  DECIMAL(11,2)
)
AS
BEGIN
INSERT INTO SOLICITUDES VALUES (@IDEMPLEADO, @TITULO, @DESCRIPCION, @IDAREA, @IDTIPO, @POSICION, @MONTO,'En Evaluacion')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarAprobador]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarAprobador]
AS
BEGIN
SELECT ID_APROBADOR, NOMBRE FROM APROBADORES
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarArea]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarArea]
AS
BEGIN
SELECT * FROM AREAS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarProceso]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarProceso](
@BUSCAR NVARCHAR(11)
)
AS
BEGIN
SELECT 
PROCESOS.ID_PROCESO AS 'ID-PROCESO',
APROBADORES.ID_APROBADOR AS 'ID-APROBADOR',
APROBADORES.NOMBRE AS 'APROBADOR',
APROBADORES.CORREO,
PROCESOS.IDSOLICITUD AS 'NO. SOLICITUD',
PROCESOS.FECHA,
PROCESOS.ESTADO,
SOLICITUDES.IDEMPLEADO AS 'E'

FROM PROCESOS
INNER JOIN APROBADORES ON  PROCESOS.IDAPROBADOR = APROBADORES.ID_APROBADOR
INNER JOIN SOLICITUDES ON  PROCESOS.IDSOLICITUD = SOLICITUDES.ID_SOLICITUD
WHERE IDSOLICITUD = @BUSCAR
ORDER BY ESTADO ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarSolicitud]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarSolicitud](
@BUSCAR NVARCHAR(11)
)
AS
BEGIN
SELECT 
SOLICITUDES.ID_SOLICITUD,
SOLICITUDES.IDEMPLEADO AS 'IDEMPLEADO',
SOLICITUDES.TITULO,
SOLICITUDES.DESCRIPCION,
AREAS.NOMBRE AS 'AREA',
TIPO_SOLICITUD.NOMBRE AS 'TIPO',
SOLICITUDES.POSICION,
SOLICITUDES.MONTO,
SOLICITUDES.ESTATUS
FROM SOLICITUDES
INNER JOIN AREAS ON  SOLICITUDES.IDAREA = AREAS.ID_AREA
INNER JOIN TIPO_SOLICITUD ON  SOLICITUDES.IDTIPOSOLICITUD = TIPO_SOLICITUD.ID_TIPO_SOLICITUD
INNER JOIN EMPLEADOS ON  SOLICITUDES.IDEMPLEADO = EMPLEADOS.ID_EMPLEADO
WHERE SOLICITUDES.ID_SOLICITUD = @BUSCAR
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarTipo]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarTipo]
AS
BEGIN
SELECT *  FROM TIPO_SOLICITUD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_NoSolicitud]    Script Date: 9/23/2021 3:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NoSolicitud]
AS
BEGIN
SELECT MAX(ID_SOLICITUD) AS ID  FROM SOLICITUDES
END
GO
USE [master]
GO
ALTER DATABASE [PRUEBA_TECNICA] SET  READ_WRITE 
GO