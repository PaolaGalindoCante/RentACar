USE [master]
GO
/****** Object:  Database [Rent-A-Car]    Script Date: 11/05/2017 12:50:35 ******/
CREATE DATABASE [Rent-A-Car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rent-A-Car', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Rent-A-Car.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Rent-A-Car_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Rent-A-Car_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Rent-A-Car] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rent-A-Car].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rent-A-Car] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rent-A-Car] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rent-A-Car] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rent-A-Car] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rent-A-Car] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rent-A-Car] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rent-A-Car] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rent-A-Car] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rent-A-Car] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rent-A-Car] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rent-A-Car] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rent-A-Car] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rent-A-Car] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rent-A-Car] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rent-A-Car] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rent-A-Car] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rent-A-Car] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rent-A-Car] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rent-A-Car] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rent-A-Car] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rent-A-Car] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rent-A-Car] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rent-A-Car] SET RECOVERY FULL 
GO
ALTER DATABASE [Rent-A-Car] SET  MULTI_USER 
GO
ALTER DATABASE [Rent-A-Car] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rent-A-Car] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rent-A-Car] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rent-A-Car] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Rent-A-Car] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rent-A-Car', N'ON'
GO
USE [Rent-A-Car]
GO
/****** Object:  User [DESKTOP-L0GLE2A\SENA]    Script Date: 11/05/2017 12:50:35 ******/
CREATE USER [DESKTOP-L0GLE2A\SENA] FOR LOGIN [DESKTOP-L0GLE2A\SENA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio_Hora] [float] NOT NULL,
	[precio_dia] [float] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clasificacion_vehiculos]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion_vehiculos](
	[idcategoria] [int] NOT NULL,
	[idvehiculo] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[documento] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gerente]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gerente](
	[idGerente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[correo_electronico] [varchar](50) NOT NULL,
 CONSTRAINT [PK_gerente] PRIMARY KEY CLUSTERED 
(
	[idGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Poliza]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Poliza](
	[idPoliza] [int] IDENTITY(1,1) NOT NULL,
	[idVehiculo] [int] NOT NULL,
	[compañia_aseguradora] [varchar](50) NOT NULL,
	[vigencia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Poliza] PRIMARY KEY CLUSTERED 
(
	[idPoliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicio](
	[idCliente] [int] NOT NULL,
	[idSucursal] [int] NULL,
	[idVehiculo] [int] NOT NULL,
	[fecha_hora_salida] [datetime] NOT NULL,
	[observaciones] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[correo_electronico] [varchar](50) NOT NULL,
	[pagina_web] [varchar](50) NOT NULL,
	[id_gerente] [int] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 11/05/2017 12:50:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[idVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](50) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[linea] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[cilindraje_cc] [float] NOT NULL,
	[color] [varchar](50) NOT NULL,
	[servicio] [varchar](50) NOT NULL,
	[clase_vehiculo] [varchar](50) NOT NULL,
	[tipo_carroceria] [varchar](50) NOT NULL,
	[combustible] [varchar](50) NOT NULL,
	[capacidad] [varchar](50) NOT NULL,
	[num_motor] [varchar](50) NOT NULL,
	[vin] [varchar](50) NOT NULL,
	[num_serie] [varchar](50) NOT NULL,
	[num_chasis] [varchar](50) NOT NULL,
	[propietario] [varchar](50) NOT NULL,
	[doc_propietario] [varchar](50) NOT NULL,
	[precio_compra] [float] NOT NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[idVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_Clasificacion_vehiculos]    Script Date: 11/05/2017 12:50:35 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clasificacion_vehiculos] ON [dbo].[Clasificacion_vehiculos]
(
	[idvehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Poliza]    Script Date: 11/05/2017 12:50:35 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Poliza] ON [dbo].[Poliza]
(
	[idVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 11/05/2017 12:50:35 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Sucursal]
(
	[id_gerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clasificacion_vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_Clasificacion_vehiculos_Categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Clasificacion_vehiculos] CHECK CONSTRAINT [FK_Clasificacion_vehiculos_Categoria]
GO
ALTER TABLE [dbo].[Clasificacion_vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_Clasificacion_vehiculos_Vehiculo] FOREIGN KEY([idvehiculo])
REFERENCES [dbo].[Vehiculo] ([idVehiculo])
GO
ALTER TABLE [dbo].[Clasificacion_vehiculos] CHECK CONSTRAINT [FK_Clasificacion_vehiculos_Vehiculo]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Vehiculo] FOREIGN KEY([idVehiculo])
REFERENCES [dbo].[Vehiculo] ([idVehiculo])
GO
ALTER TABLE [dbo].[Poliza] CHECK CONSTRAINT [FK_Poliza_Vehiculo]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Cliente]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Sucursal]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Vehiculo] FOREIGN KEY([idVehiculo])
REFERENCES [dbo].[Vehiculo] ([idVehiculo])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Vehiculo]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_gerente] FOREIGN KEY([id_gerente])
REFERENCES [dbo].[gerente] ([idGerente])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_gerente]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id unico de la categoria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categoria'
GO
USE [master]
GO
ALTER DATABASE [Rent-A-Car] SET  READ_WRITE 
GO
