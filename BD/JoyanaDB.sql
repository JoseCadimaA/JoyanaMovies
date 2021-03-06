/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2008 (10.0.6241)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [JoyanaDB]
GO
/****** Object:  Table [dbo].[tbl_Alquiler]    Script Date: 27/12/2017 11:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Alquiler](
	[AlquilerId] [int] IDENTITY(1,1) NOT NULL,
	[totalPago] [decimal](10, 2) NOT NULL,
	[fechaAlqui] [datetime] NOT NULL,
	[fechaDevol] [datetime] NOT NULL,
	[tarjetaCredito] [nvarchar](30) NULL,
	[codigoTarjeta] [nvarchar](20) NULL,
	[estado] [bit] NULL,
	[UserId] [int] NULL,
	[peliculaId] [int] NULL,
 CONSTRAINT [PK_tbl_Alquiler] PRIMARY KEY CLUSTERED 
(
	[AlquilerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Comentario]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Comentario](
	[ComentarioId] [int] IDENTITY(1,1) NOT NULL,
	[texto] [ntext] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[UserId] [int] NULL,
	[peliculaId] [int] NULL,
 CONSTRAINT [PK_tbl_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Compra]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Compra](
	[CompraId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[totalPago] [decimal](10, 2) NOT NULL,
	[tarjetaCredito] [nvarchar](30) NULL,
	[codigoTarjeta] [nvarchar](20) NULL,
	[estado] [bit] NULL,
	[UserId] [int] NULL,
	[peliculaId] [int] NULL,
 CONSTRAINT [PK_tbl_Compra] PRIMARY KEY CLUSTERED 
(
	[CompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Like]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Like](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[isLike] [bit] NOT NULL,
	[UserId] [int] NULL,
	[peliculaId] [int] NULL,
 CONSTRAINT [PK_tbl_Like] PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Peliculas]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Peliculas](
	[peliculaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](60) NOT NULL,
	[precioVenta] [decimal](10, 2) NOT NULL,
	[precioAlquiler] [decimal](10, 2) NULL,
	[descripcion] [nvarchar](2000) NOT NULL,
	[director] [nvarchar](50) NOT NULL,
	[elenco] [nvarchar](500) NOT NULL,
	[foto] [nvarchar](500) NULL,
	[trailerCode] [nvarchar](20) NULL,
	[movieCode] [nvarchar](20) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Productos] PRIMARY KEY CLUSTERED 
(
	[peliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permisos]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Permisos](
	[PermisosId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NOT NULL,
 CONSTRAINT [PK_tbl_Permisos] PRIMARY KEY CLUSTERED 
(
	[PermisosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User_ADM]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User_ADM](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[CI] [nvarchar](10) NOT NULL,
	[telefono] [nvarchar](11) NOT NULL,
	[direccion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_User_ADM] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserADM_Permisos]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserADM_Permisos](
	[UserId] [int] NOT NULL,
	[PermisosId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UserADM_Permisos] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermisosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserCLI]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserCLI](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_UserCLI] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGeneros]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneros](
	[generoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblGeneros] PRIMARY KEY CLUSTERED 
(
	[generoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPeliculaGenero]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeliculaGenero](
	[peliculaId] [int] NOT NULL,
	[generoId] [int] NOT NULL,
 CONSTRAINT [PK_tblPeliculaGenero] PRIMARY KEY CLUSTERED 
(
	[peliculaId] ASC,
	[generoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Alquiler] ON 
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (1, CAST(50.00 AS Decimal(10, 2)), CAST(N'2017-11-30T19:06:18.450' AS DateTime), CAST(N'2017-12-05T19:06:18.450' AS DateTime), N'1111111111111111', N'1111', 1, 1, 1)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (2, CAST(30.00 AS Decimal(10, 2)), CAST(N'2017-11-30T19:46:56.117' AS DateTime), CAST(N'2017-12-03T19:46:56.117' AS DateTime), N'1111111111111111', N'1111', 1, 1, 8)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (3, CAST(100.00 AS Decimal(10, 2)), CAST(N'2017-11-16T17:30:55.537' AS DateTime), CAST(N'2017-11-26T17:30:55.537' AS DateTime), N'1111111111111111', N'1111', 0, 1, 3)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (4, CAST(20.00 AS Decimal(10, 2)), CAST(N'2017-11-16T19:41:10.600' AS DateTime), CAST(N'2017-11-18T19:41:10.600' AS DateTime), N'1111111111111111', N'1111', 0, 1, 4)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (5, CAST(110.00 AS Decimal(10, 2)), CAST(N'2017-11-16T19:49:42.650' AS DateTime), CAST(N'2017-11-21T19:49:42.650' AS DateTime), N'1111111111111111', N'1111', 0, 1, 11)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (6, CAST(22220.00 AS Decimal(10, 2)), CAST(N'2017-11-16T20:08:22.130' AS DateTime), CAST(N'2023-12-17T20:08:22.130' AS DateTime), N'2222222222222222', N'2222', 1, 3, 1)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (7, CAST(20.00 AS Decimal(10, 2)), CAST(N'2017-11-16T20:12:46.183' AS DateTime), CAST(N'2017-11-18T20:12:46.183' AS DateTime), N'2222222222222222', N'2222', 0, 3, 5)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (8, CAST(50.00 AS Decimal(10, 2)), CAST(N'2017-11-16T20:15:29.553' AS DateTime), CAST(N'2017-11-21T20:15:29.553' AS DateTime), N'3333333333333333', N'3333', 0, 2, 3)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (9, CAST(10.00 AS Decimal(10, 2)), CAST(N'2017-11-16T20:54:30.217' AS DateTime), CAST(N'2017-11-17T20:54:30.217' AS DateTime), N'6666666666666666', N'6666', 0, 2, 9)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (10, CAST(350.00 AS Decimal(10, 2)), CAST(N'2017-11-30T15:55:49.203' AS DateTime), CAST(N'2018-01-04T15:55:49.203' AS DateTime), N'6565656565656565', N'6565', 1, 4, 4)
GO
INSERT [dbo].[tbl_Alquiler] ([AlquilerId], [totalPago], [fechaAlqui], [fechaDevol], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (11, CAST(600.00 AS Decimal(10, 2)), CAST(N'2017-12-04T21:10:17.297' AS DateTime), CAST(N'2017-12-07T21:10:17.297' AS DateTime), N'4444444444444444', N'4444', 1, 10, 15)
GO
SET IDENTITY_INSERT [dbo].[tbl_Alquiler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Comentario] ON 
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (37, N'Ame esta pelicula :v', CAST(N'2017-11-24T12:07:06.667' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (38, N'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla', CAST(N'2017-11-24T12:07:24.360' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (39, N'Gracias xD', CAST(N'2017-11-24T12:07:52.500' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (40, N'Jajajajjajja xd', CAST(N'2017-11-24T12:08:07.803' AS DateTime), 1, 3)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (41, N'Soy el único que la ve en plano 2017?', CAST(N'2017-11-24T12:08:41.603' AS DateTime), 1, 8)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (42, N'Soy el único que la ve en plano 2017? x2', CAST(N'2017-11-24T12:09:05.920' AS DateTime), 2, 8)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (43, N'x3', CAST(N'2017-11-24T12:09:27.140' AS DateTime), 3, 8)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (44, N'Psep', CAST(N'2017-11-24T12:17:15.603' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (45, N'Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola', CAST(N'2017-11-24T12:17:46.550' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (46, N'Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola Hola', CAST(N'2017-11-24T12:18:08.597' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (47, N'f', CAST(N'2017-11-24T12:18:15.997' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (48, N'Ya parece qu estmao dffdgd Ya parece qu estmao dffdgd Ya parece qu estmao dffdgd Ya parece qu estmao dffdgd', CAST(N'2017-11-24T12:18:32.510' AS DateTime), 1, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (49, N'Efectivamante', CAST(N'2017-11-24T12:21:08.833' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (50, N'Asi o mejor', CAST(N'2017-11-24T12:23:11.757' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (51, N'Te amo José 7u7', CAST(N'2017-11-25T16:55:59.803' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (52, N'7u7', CAST(N'2017-11-27T18:22:21.637' AS DateTime), 3, 2)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (53, N'Hola', CAST(N'2017-11-27T19:06:10.717' AS DateTime), 1, 3)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (54, N'Full xD', CAST(N'2017-11-30T15:54:36.633' AS DateTime), 4, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (55, N'bad movie', CAST(N'2017-11-30T21:15:57.800' AS DateTime), 3, 15)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (56, N'<3', CAST(N'2017-11-30T21:16:20.597' AS DateTime), 3, 10)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (57, N'Muy buena', CAST(N'2017-12-01T19:31:09.980' AS DateTime), 1, 9)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (58, N'Mala pelicula', CAST(N'2017-12-04T21:10:44.727' AS DateTime), 10, 15)
GO
INSERT [dbo].[tbl_Comentario] ([ComentarioId], [texto], [fecha], [UserId], [peliculaId]) VALUES (59, N'<3', CAST(N'2017-12-04T21:11:02.667' AS DateTime), 10, 10)
GO
SET IDENTITY_INSERT [dbo].[tbl_Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Compra] ON 
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (1, CAST(N'2017-11-15T19:18:00.833' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'8384838383838383', N'1234', 1, 3, 10)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (2, CAST(N'2017-11-15T19:19:59.367' AS DateTime), CAST(80.00 AS Decimal(10, 2)), N'9472848393927492', N'8499', 1, 3, 4)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (3, CAST(N'2017-11-15T19:21:25.640' AS DateTime), CAST(110.00 AS Decimal(10, 2)), N'7777777777777777', N'9090', 1, 1, 7)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (4, CAST(N'2017-11-15T21:29:45.837' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'1111111111111111', N'1111', 1, 1, 6)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (5, CAST(N'2017-11-15T22:01:22.797' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'1111111111111111', N'2222', 1, 1, 10)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (6, CAST(N'2017-11-16T17:30:32.070' AS DateTime), CAST(40.00 AS Decimal(10, 2)), N'1111111111111111', N'1111', 1, 1, 5)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (7, CAST(N'2017-11-16T19:27:37.350' AS DateTime), CAST(80.00 AS Decimal(10, 2)), N'1111111111111111', N'1111', 1, 1, 2)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (8, CAST(N'2017-11-16T19:32:35.583' AS DateTime), CAST(70.00 AS Decimal(10, 2)), N'1111111111111111', N'1111', 1, 1, 9)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (9, CAST(N'2017-11-16T19:53:24.593' AS DateTime), CAST(98.00 AS Decimal(10, 2)), N'2222222222222222', N'2222', 1, 3, 11)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (10, CAST(N'2017-11-16T20:08:44.223' AS DateTime), CAST(80.00 AS Decimal(10, 2)), N'2222222222222222', N'2222', 1, 3, 2)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (11, CAST(N'2017-11-16T20:09:02.227' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'2222222222222222', N'2222', 1, 3, 3)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (12, CAST(N'2017-11-16T20:14:41.087' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'3333333333333333', N'3333', 1, 2, 1)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (13, CAST(N'2017-11-16T20:15:14.743' AS DateTime), CAST(80.00 AS Decimal(10, 2)), N'3333333333333333', N'3333', 1, 2, 2)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (14, CAST(N'2017-11-16T20:15:46.680' AS DateTime), CAST(98.00 AS Decimal(10, 2)), N'3333333333333333', N'3333', 1, 2, 11)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (15, CAST(N'2017-11-30T15:55:03.503' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'6565656565656565', N'6565', 1, 4, 10)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (16, CAST(N'2017-11-30T19:29:35.750' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'6565656565656565', N'6565', 1, 4, 6)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (17, CAST(N'2017-11-30T21:18:20.510' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'2222222222222222', N'2222', 1, 3, 18)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (18, CAST(N'2017-12-01T19:32:15.070' AS DateTime), CAST(40.00 AS Decimal(10, 2)), N'1111111111111111', N'1111', 1, 1, 12)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (19, CAST(N'2017-12-01T20:18:24.273' AS DateTime), CAST(98.00 AS Decimal(10, 2)), N'6565656565656565', N'6565', 1, 4, 11)
GO
INSERT [dbo].[tbl_Compra] ([CompraId], [fecha], [totalPago], [tarjetaCredito], [codigoTarjeta], [estado], [UserId], [peliculaId]) VALUES (20, CAST(N'2017-12-04T21:09:28.907' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'4444444444444444', N'4444', 1, 10, 20)
GO
SET IDENTITY_INSERT [dbo].[tbl_Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Like] ON 
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (21, 1, 3, 7)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (22, 1, 3, 2)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (24, 1, 1, 10)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (25, 1, 2, 10)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (26, 1, 4, 10)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (27, 1, 4, 4)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (28, 1, 4, 2)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (29, 1, 1, 2)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (31, 1, 3, 10)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (32, 1, 3, 9)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (33, 0, 3, 14)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (34, 0, 3, 15)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (35, 1, 1, 9)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (36, 0, 1, 12)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (40, 1, 10, 20)
GO
INSERT [dbo].[tbl_Like] ([LikeId], [isLike], [UserId], [peliculaId]) VALUES (41, 0, 10, 15)
GO
SET IDENTITY_INSERT [dbo].[tbl_Like] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Peliculas] ON 
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (1, N'Bastardos Sin Gloria xD', CAST(100.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'BASTARDOS SIN GRLORIA.- Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
	cillum dolore eu fugiat nulla pariatur.', N'Pepe Perez', N'Arnold Sanchez, Pepillo Grillo, Lucia Caceres, Sergio Vergara, Analisa Melchoto', N'~/Images/Polera.jpg', N'yqBAjmZx_v4', N'WfG7p7hvbwo', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (2, N'Nacho Libre', CAST(80.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Duis aute irure dolor in reprehenderit in voluptate velit esse
		cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
		proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Nacho Sanchez', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
		tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', N'~/Images/Bob.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (3, N'Los Simpsons', CAST(150.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Duis aute irure dolor in reprehenderit in voluptate velit esse
		cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
		proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Duis aute irure dolor in reprehenderit in voluptate velit esse
		cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
		proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Homero J Simpson', N'Marge, Maggi, Lisa, Bart', N'~/Images/homero.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (4, N'2012', CAST(80.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis', N'José Ramirez', N'Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'~/Images/FinHomero.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (5, N'Proyecto X', CAST(40.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Julio Pedro Chavez', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt', N'~/Images/FIESTA2.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (6, N'Hacker Comedy', CAST(100.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tom Jaquer', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua.', N'~/Images/yop.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (7, N'Jobs', CAST(110.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur.', N'Steve Jobs', N'Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'~/Images/Billi.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (8, N'Titanic', CAST(70.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'isi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Ariana Chica', N'ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris', N'~/Images/mysql.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (9, N'Cars 3', CAST(70.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Blindsided by a new generation of blazing-fast racers, the legendary Lightning McQueen is suddenly pushed out of the sport he loves. To get back in the game, he will need the help of an eager young race technician with her own plan to win, inspiration from the late Fabulous Hudson Hornet, and a few unexpected turns. Proving that #95 isn''t through yet will test the heart of a champion on Piston Cup Racing''s biggest stage!', N'Brian Fee', N'Armie Hammer, Owen Wilson, Paul Newman', N'~/Images/medium-cover.jpg', N'wtmW9rSRIzU', N'_e4mlfFe1cc', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (10, N'La vida de José', CAST(200.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla', N'José Manuel Cadima Aponte', N'José Manuel Cadima Aponte', N'~/Images/me.jpg', N'Tw33Xs4Q2r4', N'8AIxa7lY_R8', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (11, N'La Momia', CAST(98.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis lba bla ffsdfd', N'Tutankamon', N'Faraón y habitantes de Egipto xd', N'~/Images/momia.jpg', N'-pdCvr2sQw4', N'-o8MUM6MYzs', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (12, N'Mi falso prometido', CAST(40.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'Agua y aceite se llevan mejor que Jennifer (Melissa Joan Hart) y Vince (Joey Lawrence) que están sentados juntos en una boda e inmediatamente sienten un apasionado disgusto el uno por el otro. Jennifer es una mujer emprendedora sarcástica e inteligente con una tendencia a gastar el dinero de sus novios, mientras que Vince es un mujeriego de vida marginal y un mal apostador que puede sobrevivir más del encanto y el ingenio que de cualquier otro conjunto de habilidades discernibles. Llegan a la conclusión que contraer matrimonio es una excelente opción para conseguir dinero y buenos regalos, por lo que deciden organizar una boda ficticia, sin imaginar las consecuencias.', N'Gil Junger', N'Melissa Joan Hart ,  Joey Lawrence', N'~/Images/418385.jpg', N'yl4Q7VYalwQ', N'S7RXP3dSfYg', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (13, N'Chica en Apuros', CAST(40.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'Viola Hastings es una gran futbolista, pero el equipo femenino ha sido cancelado y pide jugar en el masculino. El entrenador dice que una chica no juega tan bien como un chico, por lo que, molesta, le pide a su novio y capitán del equipo Justin (que está allí) su opinión. Justin dice que es ridículo, y niega haber dicho que Viola es mejor que la mitad de su equipo, por lo cual ella decide terminar la relación. Una vez en su casa, la novia de su hermano Sebastian, Monique, la confunde con él, quejándose de lo mucho que se parecen. Sebastian le pide que lo cubra, ya que se escapa a Londres a tocar con su banda, y es entonces cuando se le ocurre hacerse pasar por él para entrar al equipo masculino de la escuela rival en la que ella solia jugar futbol.', N'Andy Fickman', N'Michael Jablow
Amanda Bynes
Channing Tatum
Laura Ramsey
David Cross', N'~/Images/Una_chica_en_apuros.jpg', N'P1AFxNyE5Vk', N'FPVDscLrJx0', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (14, N'Kimi no na wa', CAST(30.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'Mitsuha es una joven pueblerina cuyo padre participa en las elecciones para alcalde de la ciudad. Sin embargo, anhela la emoción de la vida de la ciudad y por eso tiene un deseo: «reencarnar en el chico guapo de sus sueños que seguro que se encuentra en Tokio». Un día, sueña con un chico tal y como desea pero ese chico en cuestión, Taki, de la gran ciudad, sueña a su vez con Mitsuha, una encantadora chica del campo. Taki y Mitsuha descubren un día que durante el sueño sus cuerpos se intercambian, y comienzan a comunicarse por medio de notas. A medida que consiguen superar torpemente un reto tras otro, se va creando entre los dos un vínculo que poco a poco se convierte en algo más romántico.', N'Makoto Shinkai', N'Ryūnosuke Kamiki
Mone Kamishiraishi
Masami Nagasawa
Etsuko Ichihara
Ryo Narita
Aoi Yūki
Nobunaga Shimazaki
Kaito Ishikawa
Kanon Tani', N'~/Images/kimi_no_na_wa-612760352-large.jpg', N'9CxIr2uuRUE', N'ZxyGM1uNMCk', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (15, N'The Last. Naruto the movie', CAST(400.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'Dos años después de los acontecimientos de la Cuarta Guerra Mundial Shinobi, la luna, que Hagoromo Ōtsutsuki y su hermano Hamura Ōtsutsuki crearon para sellar el cuerpo de Kaguya Ōtsutsuki comienza a descender hacia la Tierra, como un meteoro que destruiría todo en el impacto. La crisis es causada por Toneri Ōtsutsuki, descendiente de Hamura Ōtsutsuki a través de la rama secundaria del clan, determinado a cumplir con el legado de su antecesor, que la humanidad debe ser exterminada por usar chakra como arma por más de un milenio.', N'Tsuneo Kobayashi', N'Junko Takeuchi
Nana Mizuki
Jun Fukuyama
Chie Nakamura
Satoshi Hino
Showtaro Morikubo
Kazuhiko Inoue
Noriaki Sugiyama
Akira Ishida', N'~/Images/The_Last_Naruto_Logo.png', N'mksl3tYdyK4', N'ZB08iMaQ9AI', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (16, N'Boruto The movie', CAST(10.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'Boruto Uzumaki es el hijo de Naruto Uzumaki, el séptimo Hokage de la aldea de Konoha1​ y de Hinata Hyuga. Detrás de todo esto, Boruto siente que vive a la sombra de su padre, que es considerado el gran héroe de la aldea y por ello tiene un fuerte deseo de superarlo. Al mismo tiempo, Sarada Uchiha, la hija de Sasuke Uchiha y Sakura Haruno, está ansiosa por ver a su padre. Boruto eventualmente se encuentra con el viejo amigo y rival de su padre y le pide que sea su maestro.', N'Tsuneo Kobayashi', N'Yūko Sanpei
Kokoro Kikuchi
Junko Takeuchi
Noriaki Sugiyama', N'~/Images/Boruto_Naruto_the_Movie_logo.png', N'Qyonn5Vbg7s', N'kSBuDsfmNJ8', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (17, N'Naruto Road to Ninja', CAST(500.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)), N'La película inicia justo en el momento que Obito Uchiha, bajo el alias de Madara Uchiha, usa un jutsu de invocación en el centro de la aldea de Konoha para traer a Kurama, el Zorro de las Nueve Colas, quien está bajo su control debido a su Mangekyō Sharingan e inicia un ataque destructivo a toda la aldea causando graves daños y víctimas fatales durante su ataque inicial.', N'Hayato Date', N'Naruto Uzumaki
Sakura Haruno', N'~/Images/Naruto_Shippūden_6_El_camino_ninja_HD.png', N'befErygEvag', N'rFHlzzX3YUQ', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (18, N'Kingsman', CAST(100.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'Cuando un agente secreto de Kingsman muere, su puesto es ocupado por otra persona. El resto de miembros debe proponer a un candidato, entre los cuales resultará elegido uno de ellos. En esta ocasión, el agente Galahad (Colin Firth) propone al hijo de un antiguo compañero: Eggsy (Taron Egerton). Mientras, el millonario Valentine (Samuel L. Jackson) tiene en mente un plan que pondría en riesgo a la mayor parte del planeta y los Kingsman deberán averiguar qué y evitarlo.', N'Matthew Vaughn', N'Colin Firth
Samuel L. Jackson
Mark Strong
Taron Egerton
Michael Caine', N'~/Images/kingsman_the_secret_service-485444831-large.jpg', N'KKdmc32qWGs', N'ZL3b-NNx_5M', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (19, N'Mi novio el asesino perfecto', CAST(50.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), N'Tras una serie de relaciones fallidas, una mujer conoce a un hombre que parece ser perfecto para ella. Sin embargo según va avanzado la relación ella se entera de que su amor es un ex asesino a sueldo.', N'Anna Kendrick', N'Sam Rockwell, Anna Kendrick, Tim Roth, RZA, Michael Eklund, James Ransone.', N'~/Images/y1VT2NoBOx3aC2exhkyN9AGUkMR.jpg', N'2TatqilQ8rI', N'-L3AsZhG0iw', 1)
GO
INSERT [dbo].[tbl_Peliculas] ([peliculaId], [nombre], [precioVenta], [precioAlquiler], [descripcion], [director], [elenco], [foto], [trailerCode], [movieCode], [estado]) VALUES (20, N'Karate Kid', CAST(100.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), N'La película comienza con la llegada de Daniel junto con su madre a su nuevo hogar en un suburbio de Los Ángeles, California, provenientes de Nueva Jersey. A los pocos minutos de su arribo entabla amistad con un joven que vive en su mismo edificio, quien lo invita a participar en una actividad recreativa en la playa. Antes de partir, Daniel va en busca del conserje para reparar una llave de su departamento. Cuando entra en la conserjería, se da cuenta que el conserje es un anciano japonés, el señor Miyagi (Pat Morita).', N'John G. Avildsen', N'Ralph Macchio
Noriyuki "Pat" Morita
Elisabeth Shue
Martin Kove
William Zabka', N'~/Images/karat.jpg', N'XY8amUImEu0', N'H7Z6joD5tQg', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Peliculas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Permisos] ON 
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (1, N'Añadir Peliculas')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (2, N'Editar Peliculas')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (3, N'Eliminar Peliculas')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (4, N'Registrar Administrador')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (5, N'Editar Administrador')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (6, N'Eliminar Administrador')
GO
INSERT [dbo].[tbl_Permisos] ([PermisosId], [descripcion]) VALUES (7, N'Ver Reportes')
GO
SET IDENTITY_INSERT [dbo].[tbl_Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User_ADM] ON 
GO
INSERT [dbo].[tbl_User_ADM] ([UserId], [nombre], [apellido], [email], [password], [CI], [telefono], [direccion]) VALUES (21, N'Diego', N'Perez', N'diego@gmail.com', N'diego123', N'985734999', N'74892900', N'Av. Brasil')
GO
INSERT [dbo].[tbl_User_ADM] ([UserId], [nombre], [apellido], [email], [password], [CI], [telefono], [direccion]) VALUES (22, N'Gualberto', N'Franco', N'franco@gmail.com', N'fran123', N'4732897498', N'3829899', N'Av. Brasil')
GO
INSERT [dbo].[tbl_User_ADM] ([UserId], [nombre], [apellido], [email], [password], [CI], [telefono], [direccion]) VALUES (23, N'Manuel José', N'Aponte Cadima', N'manu@gmail.com', N'manu123', N'8131417', N'3555555', N'Av. Banzer')
GO
INSERT [dbo].[tbl_User_ADM] ([UserId], [nombre], [apellido], [email], [password], [CI], [telefono], [direccion]) VALUES (24, N'Jose Carlos', N'Gutierrez', N'joseco@gmail.com', N'jose', N'87327873', N'78438438', N'Av. Brasil')
GO
SET IDENTITY_INSERT [dbo].[tbl_User_ADM] OFF
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (21, 1)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (21, 3)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (21, 4)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (21, 5)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (21, 6)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 1)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 2)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 3)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 4)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 5)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (22, 6)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 1)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 2)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 3)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 4)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 5)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (23, 6)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (24, 1)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (24, 2)
GO
INSERT [dbo].[tbl_UserADM_Permisos] ([UserId], [PermisosId]) VALUES (24, 3)
GO
SET IDENTITY_INSERT [dbo].[tbl_UserCLI] ON 
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (1, N'José Manuel', N'Cadima Aponte', N'jose75684847@gmail.com                            ', N'jose123                                           ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (2, N'Joselo', N'Aponte Cadima', N'joselo@gmail.com                                  ', N'joselo                                            ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (3, N'Dayana Stefany', N'Fulla', N'dayanafulla@gmail.com', N'dayana123                                         ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (4, N'Pepe', N'Pepillo', N'pepe@gmail.com                                    ', N'pepe123                                           ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (5, N'Alexander', N'Torrico Torrico', N'alexander@gmail.com                               ', N'alex123                                           ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (6, N'Dayana Stefany', N'Fulla', N'dayanafulla@hotmail.com                           ', N'day123                                            ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (7, N'Julio', N'Agreda', N'julio@gmail.com                                   ', N'julio                                             ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (8, N'Pablo', N'Alvarez', N'pablo.alvarez@gmail.com                           ', N'aaaaaaaa                                          ')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (9, N'El', N'Mercado', N'elmercado@gmail.com', N'elmer')
GO
INSERT [dbo].[tbl_UserCLI] ([UserId], [nombre], [apellido], [email], [password]) VALUES (10, N'Diego A', N'Pedrazas', N'stanley@gmail.com', N'stan')
GO
SET IDENTITY_INSERT [dbo].[tbl_UserCLI] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGeneros] ON 
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (1, N'Acción')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (2, N'Anime')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (3, N'Aventura')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (4, N'Ciencia Ficción')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (5, N'Comedia')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (6, N'Drama')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (7, N'Infantil')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (8, N'Romance')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (9, N'Suspenso')
GO
INSERT [dbo].[tblGeneros] ([generoId], [nombre]) VALUES (10, N'Terror')
GO
SET IDENTITY_INSERT [dbo].[tblGeneros] OFF
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (1, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (1, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (1, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (2, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (2, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (3, 7)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (4, 4)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (4, 9)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (5, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (6, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (6, 7)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (7, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (7, 9)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (8, 6)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (8, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (9, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (9, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (9, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (9, 7)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 4)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 6)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (10, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (11, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (11, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (11, 9)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (11, 10)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (12, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (12, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (13, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (13, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (14, 2)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (14, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 2)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 4)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (15, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (16, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (16, 2)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (16, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (16, 7)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (17, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (17, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (17, 4)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (17, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (17, 6)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (18, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (18, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (19, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (19, 3)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (19, 5)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (19, 8)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (20, 1)
GO
INSERT [dbo].[tblPeliculaGenero] ([peliculaId], [generoId]) VALUES (20, 5)
GO
ALTER TABLE [dbo].[tbl_Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Alquiler_tbl_Productos] FOREIGN KEY([peliculaId])
REFERENCES [dbo].[tbl_Peliculas] ([peliculaId])
GO
ALTER TABLE [dbo].[tbl_Alquiler] CHECK CONSTRAINT [FK_tbl_Alquiler_tbl_Productos]
GO
ALTER TABLE [dbo].[tbl_Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Alquiler_tbl_UserCLI] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_UserCLI] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Alquiler] CHECK CONSTRAINT [FK_tbl_Alquiler_tbl_UserCLI]
GO
ALTER TABLE [dbo].[tbl_Comentario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Comentario_tbl_Productos] FOREIGN KEY([peliculaId])
REFERENCES [dbo].[tbl_Peliculas] ([peliculaId])
GO
ALTER TABLE [dbo].[tbl_Comentario] CHECK CONSTRAINT [FK_tbl_Comentario_tbl_Productos]
GO
ALTER TABLE [dbo].[tbl_Comentario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Comentario_tbl_UserCLI] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_UserCLI] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Comentario] CHECK CONSTRAINT [FK_tbl_Comentario_tbl_UserCLI]
GO
ALTER TABLE [dbo].[tbl_Compra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Compra_tbl_Productos] FOREIGN KEY([peliculaId])
REFERENCES [dbo].[tbl_Peliculas] ([peliculaId])
GO
ALTER TABLE [dbo].[tbl_Compra] CHECK CONSTRAINT [FK_tbl_Compra_tbl_Productos]
GO
ALTER TABLE [dbo].[tbl_Compra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Compra_tbl_UserCLI] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_UserCLI] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Compra] CHECK CONSTRAINT [FK_tbl_Compra_tbl_UserCLI]
GO
ALTER TABLE [dbo].[tbl_Like]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Like_tbl_Productos] FOREIGN KEY([peliculaId])
REFERENCES [dbo].[tbl_Peliculas] ([peliculaId])
GO
ALTER TABLE [dbo].[tbl_Like] CHECK CONSTRAINT [FK_tbl_Like_tbl_Productos]
GO
ALTER TABLE [dbo].[tbl_Like]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Like_tbl_UserCLI] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_UserCLI] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Like] CHECK CONSTRAINT [FK_tbl_Like_tbl_UserCLI]
GO
ALTER TABLE [dbo].[tbl_UserADM_Permisos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserADM_Permisos_tbl_Permisos] FOREIGN KEY([PermisosId])
REFERENCES [dbo].[tbl_Permisos] ([PermisosId])
GO
ALTER TABLE [dbo].[tbl_UserADM_Permisos] CHECK CONSTRAINT [FK_tbl_UserADM_Permisos_tbl_Permisos]
GO
ALTER TABLE [dbo].[tbl_UserADM_Permisos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserADM_Permisos_tbl_User_ADM] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User_ADM] ([UserId])
GO
ALTER TABLE [dbo].[tbl_UserADM_Permisos] CHECK CONSTRAINT [FK_tbl_UserADM_Permisos_tbl_User_ADM]
GO
ALTER TABLE [dbo].[tblPeliculaGenero]  WITH CHECK ADD  CONSTRAINT [FK_tblPeliculaGenero_tblGeneros] FOREIGN KEY([generoId])
REFERENCES [dbo].[tblGeneros] ([generoId])
GO
ALTER TABLE [dbo].[tblPeliculaGenero] CHECK CONSTRAINT [FK_tblPeliculaGenero_tblGeneros]
GO
ALTER TABLE [dbo].[tblPeliculaGenero]  WITH CHECK ADD  CONSTRAINT [FK_tblPeliculaGenero_tblPeliculaGenero] FOREIGN KEY([peliculaId])
REFERENCES [dbo].[tbl_Peliculas] ([peliculaId])
GO
ALTER TABLE [dbo].[tblPeliculaGenero] CHECK CONSTRAINT [FK_tblPeliculaGenero_tblPeliculaGenero]
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_DeleteAdmin]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Actualiza un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_DeleteAdmin] 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DELETE FROM [dbo].[tbl_User_ADM] 
      WHERE [UserId]=@intUsuarioId 

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByCI]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por CI
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByCI]
	@Ci NVARCHAR(10) 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE CI=@Ci;
END 
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByEmail]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por Email
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByEmail] 
@Email NVARCHAR(50) 

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE email=@Email;

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByID]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por ID
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByID] 
	@id INT 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE UserId=@id; 
END 
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdmins]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá 
-- Create date: 07/10/17
-- Description:	Obtener Administradores
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdmins] 
AS 
BEGIN 
	
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [UserId]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[password]
      ,[CI]
      ,[telefono]
      ,[direccion]
  FROM [dbo].[tbl_User_ADM]

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_InsertAdmin]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Inserta un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_InsertAdmin] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@varCI NVARCHAR(10), 
	@varTelefono NVARCHAR(11), 
	@varDireccion NVARCHAR(100), 
	@intUsuarioId INT OUTPUT 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[tbl_User_ADM] 
           ([nombre] 
           ,[apellido] 
           ,[email] 
           ,[password] 
           ,[CI] 
           ,[telefono] 
           ,[direccion]) 
     VALUES 
			(	@varNombre, 
				@varApellido, 
				@varEmail, 
				@varPassword, 
				@varCI, 
				@varTelefono, 
				@varDireccion 
		   ) 
	SET @intUsuarioId=SCOPE_IDENTITY() 

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_UpdateAdmin]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Actualiza un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_UpdateAdmin] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@varCI NVARCHAR(10), 
	@varTelefono NVARCHAR(11), 
	@varDireccion NVARCHAR(100), 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE [dbo].[tbl_User_ADM] 
   SET [nombre] = @varNombre 
      ,[apellido] = @varApellido 
      ,[email] = @varEmail 
      ,[password] = @varPassword 
      ,[CI] = @varCI 
      ,[telefono] = @varTelefono 
      ,[direccion] = @varDireccion 
 WHERE [UserId]=@intUsuarioId  

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPerm]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Eliminar la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_DeleteAdmiPerm] 
@PermisoId int,
@UserId int 
AS 
BEGIN 

DELETE FROM [dbo].[tbl_UserADM_Permisos]
      WHERE[UserId]=@UserId 
	  AND [PermisosId] = @PermisoId;

END 
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPermALl]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_DeleteAdmiPermALl] 
	-- Add the parameters for the stored procedure here
	@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [dbo].[tbl_UserADM_Permisos]
      WHERE[UserId]=@UserId 	 
END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_GetAdminPermiso]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 12/10/2017
-- Description:	Optner los permisos de los admin
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_GetAdminPermiso] 
	-- Add the parameters for the stored procedure here
	@intUserId INT,
	@intPermisoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [UserId]
      ,[PermisosId]
	FROM [dbo].[tbl_UserADM_Permisos]
	WHERE [UserId] = @intUserId 
	AND [PermisosId] = @intPermisoId

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_InsertAdmiPerm]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Insertar de la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_InsertAdmiPerm] 
@UserId int,  
@PermisoId int 
AS 
BEGIN 

INSERT INTO [dbo].[tbl_UserADM_Permisos]
           ([UserId]
           ,[PermisosId])
     VALUES
           (@UserId
           ,@PermisoId); 

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_UpdateAdmiPerm]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Actualizar la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_UpdateAdmiPerm] 
@UserId int,  
@PermisoId int 
AS 
BEGIN 

UPDATE [dbo].[tbl_UserADM_Permisos]
   SET [PermisosId] = @PermisoId
 WHERE [UserId]=@UserId;

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_DeleteAlquiler]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Delete Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_DeleteAlquiler]
	-- Add the parameters for the stored procedure here	
	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Alquiler]
	SET [estado] = 0 
	WHERE [AlquilerId] = @AlquilerId

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_ExistAlquiler]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Si el alquiler ya existe
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_ExistAlquiler]
	-- Add the parameters for the stored procedure here	
	@UserId	INT,
	@PeliculaId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [UserId] = @UserId 
	AND [peliculaId] = @PeliculaId

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAllAlquileres]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Optener todos los alquileres
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAllAlquileres]
	-- Add the parameters for the stored procedure here		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	ORDER BY [fechaAlqui] DESC 	

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquilerById]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Full
-- Create date: 16/11/2017
-- Description:	Obtener Alquileres por ID
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAlquilerById]
	-- Add the parameters for the stored procedure here
	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ta.[AlquilerId] 
		  ,ta.[totalPago]
		  ,ta.[fechaAlqui]
		  ,ta.[fechaDevol]
		  ,ta.[tarjetaCredito]
		  ,ta.[codigoTarjeta]
		  ,ta.[estado]
		  ,ta.[UserId]
		  ,tu.[nombre] + ' ' + tu.[apellido] [nombreUser]
		  ,tu.[email]
		  ,ta.[peliculaId]
		  ,tp.[nombre] [nombrePelicula]
	FROM [dbo].[tbl_Alquiler] ta, [dbo].[tbl_UserCLI] tu, [dbo].[tbl_Peliculas] tp 
	WHERE ta.[AlquilerId] = @AlquilerId 
	AND tu.[UserId] = ta.[UserId] 
	AND tp.[peliculaId] = ta.[peliculaId] 
	ORDER BY [fechaAlqui] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquileresByUserId]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Full
-- Create date: 16/11/2017
-- Description:	Obtener Alquileres por UserID
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAlquileresByUserId]
	-- Add the parameters for the stored procedure here
	@UserId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [UserId] = @UserId 
	ORDER BY [fechaAlqui] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_InsertAlquiler]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 15/11/2017
-- Description:	Insertar Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_InsertAlquiler]
	-- Add the parameters for the stored procedure here
	@TotalPago	DECIMAL(10, 2),
	@FechaAlqui	DATETIME,
	@FechaDevol	DATETIME,
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,
	@UserId	INT,
	@PeliculaId	INT,

	@AlquilerId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Alquiler]
           ([totalPago]
           ,[fechaAlqui]
           ,[fechaDevol]
           ,[tarjetaCredito]
           ,[codigoTarjeta]
           ,[estado]
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@TotalPago
           ,@FechaAlqui
           ,@FechaDevol
           ,@TarjetaCredito
           ,@CodigoTarjeta
           ,@Estado
           ,@UserId
           ,@PeliculaId)

	SET @AlquilerId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_UpdateAlquiler]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Actualizar Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_UpdateAlquiler]
	-- Add the parameters for the stored procedure here
	@TotalPago	DECIMAL(10, 2),
	@FechaAlqui	DATETIME,
	@FechaDevol	DATETIME,
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado		BIT,

	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Alquiler]
	SET [totalPago] = @TotalPago
      ,[fechaAlqui] = @FechaAlqui
      ,[fechaDevol] = @FechaDevol
	  ,[tarjetaCredito] = @TarjetaCredito
	  ,[codigoTarjeta] = @CodigoTarjeta	  
      ,[estado] = @Estado      
	WHERE [AlquilerId] = @AlquilerId

END
GO
/****** Object:  StoredProcedure [dbo].[busc_Busqueda]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 26/10/2017
-- Description:	Busqueda por Nombre de Pelicula
-- =============================================
CREATE PROCEDURE [dbo].[busc_Busqueda]
	-- Add the parameters for the stored procedure here
	@nombre NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE nombre like '%' + @nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[COMENT_GetComentsByPeliculaID]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 24/11/2017
-- Description:	Obtener Comentarios por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[COMENT_GetComentsByPeliculaID]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [tc].[ComentarioId]
		  ,[tc].[texto]
		  ,[tc].[fecha]
		  ,[tc].[UserId]
		  ,[tu].[nombre] + ' ' + [tu].[apellido] [userName]
		  ,[tc].[peliculaId]
	FROM [dbo].[tbl_Comentario] tc, [dbo].[tbl_UserCLI] tu
	WHERE [tc].[peliculaId] = @PeliculaID 
	AND [tu].[UserId] = [tc].[UserId] 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[COMENT_InsertComentario]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 24/11/2017
-- Description:	Insert Comentario
-- =============================================
CREATE PROCEDURE [dbo].[COMENT_InsertComentario]
	-- Add the parameters for the stored procedure here
	@Texto	NTEXT,
	@Fecha	DATETIME,
	@UserID	INT,
	@PeliculaID	INT,

	@ComentarioId	INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Comentario]
           ([texto]
           ,[fecha]
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@Texto
           ,@Fecha
           ,@UserID
           ,@PeliculaID)

	SET @ComentarioId = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_DeleteCompra]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 13/11/2017
-- Description:	Eliminar compra por ID
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_DeleteCompra]
	-- Add the parameters for the stored procedure here
	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here	

	UPDATE [dbo].[tbl_Compra]
	SET [estado] = 0    
	WHERE [CompraId] = @CompraId 

END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_ExistTransaction]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Para ver si el usuario ya había comprado la película antes
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_ExistTransaction]
	-- Add the parameters for the stored procedure here
	@UserId		INT,
	@PeliculaId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Compra] 
	WHERE [UserId] = @UserId 
	AND [peliculaId] = @PeliculaId 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetAllCompras]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetAllCompras]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasById]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras por CompraId
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetComprasById]
	-- Add the parameters for the stored procedure here	
	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tc.[CompraId]
		  ,tc.[fecha]
		  ,tc.[totalPago]
		  ,tc.[tarjetaCredito] 
		  ,tc.[codigoTarjeta]
		  ,tc.[estado]
		  ,tc.[UserId]
		  ,tu.[nombre] + ' ' + tu.[apellido] [nombreUser]
		  ,tu.[email]
		  ,tc.[peliculaId]
		  ,tp.[nombre] [nombrePelicula]
	FROM [dbo].[tbl_Compra] tc, [dbo].[tbl_UserCLI] tu, [dbo].[tbl_Peliculas] tp 
	WHERE tc.[CompraId] = @CompraId 
	AND tu.[UserId] = tc.UserId 
	AND tp.[peliculaId] = tc.[peliculaId] 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasByUserId]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras por Usuario
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetComprasByUserId]
	-- Add the parameters for the stored procedure here	
	@UserId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	WHERE [UserId] = @UserId 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_InsertCompra]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 13/11/2017
-- Description:	Insertar Compra
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_InsertCompra]
	-- Add the parameters for the stored procedure here
	@Fecha	DATETIME,
	@TotalPago	DECIMAL(10, 2),
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,
	@UserId	INT,
	@PeliculaId	INT,

	@CompraId INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	

	INSERT INTO [dbo].[tbl_Compra]
			([fecha]
			,[totalPago]
			,[tarjetaCredito]
			,[codigoTarjeta]
			,[estado]
			,[UserId]
			,[peliculaId])
		VALUES
			(@Fecha
			,@TotalPago
			,@TarjetaCredito
			,@CodigoTarjeta
			,@Estado
			,@UserId
			,@PeliculaId)

	SET @CompraId = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_UpdateCompra]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description: Actualizar Película
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_UpdateCompra]
	-- Add the parameters for the stored procedure here
	@Fecha	DATETIME,
	@TotalPago	DECIMAL(10, 2),
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,

	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Compra]
	SET [fecha] = @Fecha 
      ,[totalPago] = @TotalPago
      ,[tarjetaCredito] = @TarjetaCredito
      ,[codigoTarjeta] = @CodigoTarjeta
      ,[estado] = @Estado
	WHERE [CompraId] = @CompraId

END
GO
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneroById]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 26/10/2017
-- Description:	Obtener Generos por ID
-- =============================================
CREATE PROCEDURE [dbo].[gen_GEN_GetGeneroById]
	-- Add the parameters for the stored procedure here
	@generoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tblGeneros]
	WHERE [generoId] = @generoId 
END
GO
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneros]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Todos los géneros
-- =============================================
CREATE PROCEDURE [dbo].[gen_GEN_GetGeneros]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
	FROM [dbo].[tblGeneros]
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_DeleteLike]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2014
-- Description:	Eliminar Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_DeleteLike]
	-- Add the parameters for the stored procedure here
	@LikeID	INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[tbl_Like]
    WHERE [LikeId] = @LikeID 

END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantDisLikes]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener la cantidad de Dislikes por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetCantDisLikes]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [peliculaId] = @PeliculaID 
	AND [isLike] = 0 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantLikes]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener la cantidad de Likes por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetCantLikes]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [peliculaId] = @PeliculaID 
	AND [isLike] = 1 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetFavoritos]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 30/11/2017
-- Description:	Obtener el Listados de Las Películas favoritas
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetFavoritos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (10) 
	      tp.[nombre]
	      , likes = COUNT(*)
	FROM [dbo].[tbl_Peliculas] tp, [dbo].[tbl_Like] tl 
	WHERE tl.[peliculaId] = tp.[peliculaId] 
	AND tl.[isLike] = 1 
	GROUP BY tp.[nombre] 
	ORDER BY likes DESC 

END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetLikeByUserPeliculaID]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener likes por UsuarioId y PeliculaId
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetLikeByUserPeliculaID]
	-- Add the parameters for the stored procedure here
	@UserID	INT,
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [UserId]  = @UserID 
	AND [peliculaId] = @PeliculaID 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_InsertLike]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Insertar Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_InsertLike]
	-- Add the parameters for the stored procedure here
	@IsLike	BIT,	 
	@UserId	INT,
	@PeliculaId	INT,

	@LikeId	INT OUTPUT
					
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Like]
           ([isLike]           
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@IsLike           
           ,@UserId
           ,@PeliculaId)

	SET @LikeId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_UpdateLikes]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Actualizar los Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_UpdateLikes]
	-- Add the parameters for the stored procedure here
	@IsLike	BIT,
	@UserId	INT,
	@PeliculaId	INT, 

	@LikeID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Like]
	SET [isLike] = @IsLike
      ,[UserId] = @UserId
      ,[peliculaId] = @PeliculaId 
	WHERE [LikeId] = @LikeID 

END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_DeletePelGen]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Eliminar los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_DeletePelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tblPeliculaGenero] 
	WHERE [peliculaId] = @PeliculaId 
	AND [generoId] = @GeneroId 
END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPelGen]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_GetPelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tblPeliculaGenero] 
	WHERE [peliculaId] = @PeliculaId 
	AND [generoId] = @GeneroId 
END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPeliculasByGenero]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener los Peliculas por Genero
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_GetPeliculasByGenero]
	-- Add the parameters for the stored procedure here	
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tblPeliculaGenero]
	WHERE [generoId] = @GeneroId
END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_InsertPelGen]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Insertar Generos a Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_InsertPelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tblPeliculaGenero]
           ([peliculaId]
           ,[generoId])
     VALUES
           (@PeliculaId
           ,@GeneroId)

END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_UpdatePelGen]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Actualizar los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_UpdatePelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tblPeliculaGenero]
    SET [generoId] = @GeneroId
	WHERE [peliculaId] = @PeliculaId

END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_DeletePermiso]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Elimina los Permisos 
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_DeletePermiso] 	
	@PermisosId INT
AS 
BEGIN 
		DELETE FROM [dbo].[tbl_Permisos] 
		WHERE [PermisosId]=@PermisosId  
END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_InsertPermiso]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Ingresa los permisos
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_InsertPermiso] 
	@Descripcion VARCHAR(45), 
	@PermisosId INT  OUTPUT 
AS 
BEGIN 

INSERT INTO [dbo].[tbl_Permisos] 
           ([descripcion]) 
     VALUES 
           (@Descripcion ) 
	SET @PermisosId=SCOPE_IDENTITY() 


END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_UpdatePermiso]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Ingresa los permisos
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_UpdatePermiso] 
	@Descripcion VARCHAR(45), 
	@PermisosId INT 
AS 
BEGIN 

	UPDATE [dbo].[tbl_Permisos]
   SET [descripcion] = @Descripcion 
	WHERE[PermisosId]=@PermisosId 

END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_DeletePelicula]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Eliminar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_DeletePelicula]
	-- Add the parameters for the stored procedure here
	@PeliculaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_Peliculas]
	SET [estado] = 0 
    WHERE [peliculaId] = @PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaById]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas por ID
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculaById]
	-- Add the parameters for the stored procedure here	
	@PeliculaId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE [peliculaId] = @PeliculaId 
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaByName]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas por Nombre
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculaByName]
	-- Add the parameters for the stored procedure here	
	@Nombre NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE [nombre] = @Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculas]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculas]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_InsertPelicula]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Insertar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_InsertPelicula]
	-- Add the parameters for the stored procedure here
	@Nombre NVARCHAR(60),
	@PrecioVenta DECIMAL(10,2),
	@PrecioAlquiler DECIMAL(10,2),
	@Descripcion NVARCHAR(2000),
	@Director NVARCHAR(50),
	@Elenco NVARCHAR(500),
	@Foto NVARCHAR(500),
	@TrailerCode NVARCHAR(20),
	@MovieCode NVARCHAR(20),
	@Estado BIT,
	
	@PeliculaId INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tbl_Peliculas]
           ([nombre]
           ,[precioVenta]
		   ,[precioAlquiler]
           ,[descripcion]
           ,[director]
           ,[elenco]
           ,[foto]
		   ,[trailerCode]
		   ,[movieCode]
           ,[estado])
     VALUES
           (@Nombre
           ,@PrecioVenta
		   ,@PrecioAlquiler
           ,@Descripcion
           ,@Director
           ,@Elenco
           ,@Foto
		   ,@TrailerCode
		   ,@MovieCode
           ,@Estado)

	SET @PeliculaId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_UpdatePelicula]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Actualizar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_UpdatePelicula]
	-- Add the parameters for the stored procedure here
	@Nombre NVARCHAR(60),
	@PrecioVenta DECIMAL(10,2),
	@PrecioAlquiler DECIMAL(10, 2),
	@Descripcion NVARCHAR(2000),
	@Director NVARCHAR(50),
	@Elenco NVARCHAR(500),
	@Foto NVARCHAR(500),
	@trailerCode NVARCHAR(20),
	@movieCode NVARCHAR(20),
	
	@PeliculaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_Peliculas]
	SET [nombre] = @Nombre
      ,[precioVenta] = @PrecioVenta
	  ,[precioAlquiler] = @PrecioAlquiler
      ,[descripcion] = @Descripcion
      ,[director] = @Director
      ,[elenco] = @Elenco
      ,[foto] = @Foto
	  ,[trailerCode] = @trailerCode
	  ,[movieCode] = @movieCode
	WHERE [peliculaId] = @PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[TRAN_GetAllTransactions]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 30/11/2017
-- Description:	Obtener todas las transacciones
-- =============================================
CREATE PROCEDURE [dbo].[TRAN_GetAllTransactions]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
	FROM [dbo].[tbl_Compra] tc, [dbo].[tbl_Alquiler] ta 	
	ORDER BY [TC].[fecha] DESC,	[ta].[fechaAlqui] DESC 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisos]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 09/10/2017
-- Description:	Obtener Todos los permisos
-- =============================================
CREATE PROCEDURE [dbo].[usp_PERM_GetPermisos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PermisosId],
		[descripcion]
	FROM [dbo].[tbl_Permisos]


END
GO
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisosByDescription]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 12/10/2017
-- Description:	Obtener Permisos por Descripción
-- =============================================
CREATE PROCEDURE [dbo].[usp_PERM_GetPermisosByDescription]
	@varDescripcion  VARCHAR(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PermisosId]
      ,[descripcion]
    FROM [dbo].[tbl_Permisos]
	WHERE [descripcion] = @varDescripcion;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_DeleteUsuario]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 05/10/17
-- Description:	Borrar Cuenta
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_DeleteUsuario] 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DELETE FROM [dbo].[tbl_UserCLI] 
      WHERE [UserId]=@intUsuarioId 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByEmail]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Obtener usuario por Email
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarioByEmail]
@Email NVARCHAR(50) 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM tbl_UserCLI 
	WHERE email=@Email;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByID]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Obtener usuario por CI
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarioByID]
@ID int
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_UserCLI 
	WHERE [UserId]=@ID; 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarios]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá 
-- Create date: 07/10/17
-- Description:	Obtener Administradores
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarios] 
AS 
BEGIN 
	
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [UserId]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[password]
  FROM [dbo].[tbl_UserCLI]




END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_InsertUsuario]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Inserta un usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_InsertUsuario] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@intUsuarioId INT OUTPUT 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [dbo].[tbl_UserCLI]
           ([nombre]
           ,[apellido]
           ,[email]
           ,[password])
     VALUES
           (@varNombre,
           @varApellido,
           @varEmail,
           @varPassword) 
	SET @intUsuarioId=SCOPE_IDENTITY() 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_ObtenerCantidadDeUsuarios]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_ObtenerCantidadDeUsuarios]  
@count int output 
AS 
BEGIN 

SET @count= (select COUNT(UserId) from tbl_UserCLI); 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_UpdateUsuario]    Script Date: 27/12/2017 11:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 05/10/17
-- Description:	Actualiza un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_UpdateUsuario] 
	@varNombre NVARCHAR(50),   
	@varApellido NVARCHAR(50),
	@varEmail NVARCHAR(50), 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_UserCLI] 
	 SET [nombre] = @varNombre 
		,[apellido] = @varApellido  
		,[email] = @varEmail
	WHERE [UserId]=@intUsuarioId 
END 
GO
