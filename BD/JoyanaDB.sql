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
/****** Object:  Table [dbo].[tbl_Alquiler]    Script Date: 27/11/2017 19:15:52 ******/
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
/****** Object:  Table [dbo].[tbl_Comentario]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_Compra]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_Like]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_Peliculas]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_Permisos]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_User_ADM]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_UserADM_Permisos]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tbl_UserCLI]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tblGeneros]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  Table [dbo].[tblPeliculaGenero]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_DeleteAdmin]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByCI]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByEmail]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByID]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdmins]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_InsertAdmin]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[adm_USER_UpdateAdmin]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPerm]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPermALl]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_GetAdminPermiso]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_InsertAdmiPerm]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_UpdateAdmiPerm]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_DeleteAlquiler]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_ExistAlquiler]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAllAlquileres]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquilerById]    Script Date: 27/11/2017 19:15:53 ******/
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
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [AlquilerId] = @AlquilerId 
	ORDER BY [fechaAlqui] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquileresByUserId]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_InsertAlquiler]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[alq_ALQ_UpdateAlquiler]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[busc_Busqueda]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[COMENT_GetComentsByPeliculaID]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[COMENT_InsertComentario]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_DeleteCompra]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_ExistTransaction]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetAllCompras]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasById]    Script Date: 27/11/2017 19:15:53 ******/
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
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	WHERE [CompraId] = @CompraId 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasByUserId]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_InsertCompra]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[comp_COMP_UpdateCompra]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneroById]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneros]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_DeleteLike]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantDisLikes]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantLikes]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_GetLikeByUserPeliculaID]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_InsertLike]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[LIKE_UpdateLikes]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_DeletePelGen]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPelGen]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPeliculasByGenero]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_InsertPelGen]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_UpdatePelGen]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[per_PERM_DeletePermiso]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[per_PERM_InsertPermiso]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[per_PERM_UpdatePermiso]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_DeletePelicula]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaById]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaByName]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculas]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_InsertPelicula]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_UpdatePelicula]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisos]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisosByDescription]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_DeleteUsuario]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByEmail]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByID]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarios]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_InsertUsuario]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_ObtenerCantidadDeUsuarios]    Script Date: 27/11/2017 19:15:53 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_UpdateUsuario]    Script Date: 27/11/2017 19:15:53 ******/
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




INSERT INTO [dbo].[tbl_Permisos]
           ([descripcion])
     VALUES
           ('Añadir Peliculas'),
           ('Editar Peliculas'),
           ('Eliminar Peliculas'),
           ('Registrar Administrador'),
           ('Editar Administrador'),
           ('Eliminar Administrador'),
           ('Ver Reportes');
GO

INSERT INTO [dbo].[tblGeneros]
           ([nombre])
     VALUES
		   ('Acción'),		   
		   ('Anime'),
		   ('Aventura'),
		   ('Ciencia Ficción'),
           ('Comedia'),
		   ('Drama'),
		   ('Infantil'),
		   ('Romance'),	
		   ('Suspenso'),		   		   
		   ('Terror')		   
GO

