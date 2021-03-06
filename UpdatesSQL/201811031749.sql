USE [Tracker]
GO
/****** Object:  StoredProcedure [dbo].[ChangePostType]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ChangePostType](@PostId bigint, @Type varchar(50))
as
begin
	update Posts set [Type]=@Type where Id=@PostId
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeSprintState]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeSprintState](@IdSprint bigint, @State Varchar(50))
as
begin
	update Sprints set Estado=@State where Id=@IdSprint
end

GO
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePost] (@IdPost bigint)
as
begin
delete Posts where Id=@IdPost
end
GO
/****** Object:  StoredProcedure [dbo].[InsertChildPost]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertChildPost](@PostId bigint, @UserId bigint, @Date varchar(50), @Body Text, @Type Varchar(50))
as
begin
	insert into Posts(SprintId,PostId,UserId,[Date],Body,[Type]) Values (0,@PostId,@UserId,Convert(Datetime,@Date,120),@Body,@Type)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertParentPost]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertParentPost](@SprintId bigint, @UserId bigint, @Date varchar(50), @Body Text, @Type varchar(50))
as
begin
	insert into Posts(SprintId,PostId,UserId,[Date],Body,[Type]) Values (@SprintId,0,@UserId,Convert(Datetime,@Date,120),@Body,@Type)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertSprint]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertSprint] (@UserId bigint, @ProjectId bigint, @Created varchar(50), @Description varchar(255), @EstimatedDays bigint)
as
begin
	insert into Sprints(IdUser,IdProject,Created,[Description],EstimatedDays) values (@UserId,@ProjectId,@Created,@Description,@EstimatedDays)
end

GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUser] (@USER varchar(50), @PASSWORD varchar(50))
as
begin
	select * from Users where UserName=@USER and [Password]=@PASSWORD
end
GO
/****** Object:  StoredProcedure [dbo].[Select_PostByParentPost]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PostByParentPost](@ParentId bigint)
as
begin
 select * from Posts where PostId=@ParentId
end

GO
/****** Object:  StoredProcedure [dbo].[Select_PostBySprint]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PostBySprint](@SprintId bigint)
as
begin
 select * from Posts where SprintId=@SprintId
end

GO
/****** Object:  StoredProcedure [dbo].[SelectAllProjects]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllProjects]
as
begin
select * from Projects
end
GO
/****** Object:  StoredProcedure [dbo].[SelectLastSprint]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectLastSprint]
as
begin
select top 1 * from Sprints Order by Id Desc
end
GO
/****** Object:  StoredProcedure [dbo].[SelectPostById]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPostById](@PostID bigint)
as
begin
select * from Posts where Id=@PostID
end


GO
/****** Object:  StoredProcedure [dbo].[SelectProjectAuthorization]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectProjectAuthorization](@UserId bigint, @ProjectId bigint)
as
begin
select * from ProjectsAuthorization where UserId=@UserId and ProjectId=@ProjectId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectProjectById]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectProjectById](@ProjectId bigint)
as
begin
select * from Projects where Id=@ProjectId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectRoleById]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectRoleById](@RoleId bigint)
as
begin
select * from Roles where Id=@RoleId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectSprintById]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSprintById](@SprintId Bigint)
as
begin
select *  from Sprints where Id=@SprintId
end

GO
/****** Object:  StoredProcedure [dbo].[SelectSprintsByProjectId]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSprintsByProjectId](@ProjectId bigint)
as
begin
select *  from Sprints where IdProject=@ProjectId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectUserById]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUserById](@IdUser bigint)
as
begin
select *  from [Users] where Id=@IdUser
end
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SprintId] [bigint] NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Body] [text] NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectsAuthorization]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsAuthorization](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[ProjectId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProjectsAuthorization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sprints]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sprints](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUser] [bigint] NOT NULL,
	[IdProject] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[EstimatedDays] [bigint] NOT NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Sprints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/3/2018 5:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Rol] [bigint] NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (48, 10002, 0, 1, CAST(0x0000A989010FE960 AS DateTime), N'Este modulo configura las alertas de mensajes para usuarios [porId de usuario] y a su vez configura el listado de productos por [idarticulo] para que ese articulo sea chequeado por la cantidad configurada.
SubObjetivos: 
1 - Crear las tablas correspndientes referidas al modulo (Mariano)
2 - Crear los procedimientos de almacenado para consulta e insert de registros (Mariano)
3 - Crear la estructura html con los estilos (Luciano)
4 - Crear la funcionalidad de configuracion "Tener en cuenta que hay una tabla que transcribe el idusuario por idnegocio" 

Nota: El formulario debe, Guardar, actualizar y Borrar registros', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (49, 10003, 0, 1, CAST(0x0000A98901121BE0 AS DateTime), N'El modulo sin vista, sera integrado en cada pagina, para que en cada actualizacion del sistema se generen mensajes de alerta referentes al stock teniendo en cuenta los datos configurados en la tablas. Este modulo hace interfaz directa con el servicio de mensajeria de DNN', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (50, 10004, 0, 1, CAST(0x0000A98901133520 AS DateTime), N'Esta tabla codifica el usuario actual al codigo de local/comercio e implementa ese codigo en todos los modulos.
1) Crear tabla
2) Crear procedimiento de almacenado que codifica usuario/comercio e inverso
3) Remplazar las funciones del [UserId] sistema por el metodo de codificacion
Ejemplo: [GetUserId(UserId) return IdComercio]', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (51, 10012, 0, 4, CAST(0x0000A989014ECEF0 AS DateTime), N'Finalizando preparación de entorno de desarrollo. SQL Management Studio y Visual Studio operativos. Actualizados archivos del repositorio.', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (52, 10009, 0, 5, CAST(0x0000A98A00F61800 AS DateTime), N'Lo que quiero es que el informe que salga se pueda exportar a excel y que pueda tener el total de ventas mensuales por tratamiento', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (53, 10008, 0, 5, CAST(0x0000A98A00F6A4A0 AS DateTime), N'Necesito llevar la agenda en el sistema y que puedan tener acceso ambos locales, y lo mas importante es que queremos que el sistema envie mensaje de recordatorio un dia antes a los clientes', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (54, 10012, 0, 3, CAST(0x0000A98A00F6EAF0 AS DateTime), N'IIS OK. VS2107 OK. Github OK. SQL Server OK. Teamviewer OK. Discord OK.', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (55, 10007, 0, 5, CAST(0x0000A98A00F73140 AS DateTime), N'necesitamos ademas de ventas en efectivo, ventas con tarjeta de credito y que se pueda modificar  el interes cargado al pago', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (58, 0, 48, 4, CAST(0x0000A98A00F91D70 AS DateTime), N'Comenzada la creación de la estructura HTML.', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (59, 0, 48, 3, CAST(0x0000A98A010FE960 AS DateTime), N'Finalizada estructura de tablas necesarias', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (60, 0, 48, 3, CAST(0x0000A98A01198650 AS DateTime), N'Creado procedimiento de almacenado: Agregar user para alertar', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (61, 0, 48, 3, CAST(0x0000A98A012555C0 AS DateTime), N'Creado procedimiento de almacenado: Borrar user para alertar
', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (62, 0, 48, 3, CAST(0x0000A98A0127CE90 AS DateTime), N'Creado procedimiento de almacenado: Recuperar lista de users para alertar', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (63, 0, 48, 3, CAST(0x0000A98A01331160 AS DateTime), N'Creado procedimiento de almacenado: Agregar producto con alerta de Stock', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (64, 10002, 0, 4, CAST(0x0000A98A013357B0 AS DateTime), N'Se completó la creación del formulario de configuración de las notificaciones de stock. Como se puede observar en la captura de pantalla, se implementaron los botones de búsqueda de usuario y de producto. Se comenzará la implementación de estilos CSS a la página.', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (65, 0, 64, 1, CAST(0x0000A98A013543E0 AS DateTime), N'Luciano adjunta imagenes que ilustran el avance de desarrollo en los modulos.
Archivos ABNO64.jpg  y DEPH64.jpg del post 64


', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (10002, 0, 48, 3, CAST(0x0000A98B00B2CD70 AS DateTime), N'Creado procedimiento de almacenado: Borrar producto con alerta de Stock', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (10004, 10007, 0, 1, CAST(0x0000A98B00B65F80 AS DateTime), N'Daiana necesitamos que nos confirmes si el interes va cargado por medio de la venta o la tarjeta?
Cargo el interes que quiero a la venta, o saco el interes ya configurado en la tarjeta?', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (10005, 0, 48, 3, CAST(0x0000A98B00C3D4D0 AS DateTime), N'Creado procedimiento de almacenado: Modificar producto con alerta de Stock (stock minimo)', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (10006, 0, 48, 3, CAST(0x0000A98B00C7F380 AS DateTime), N'Creado procedimiento de almacenado: Recuperar Id''s de productos con alerta de stock y Stock Minimo de productos
', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (10007, 10002, 0, 3, CAST(0x0000A98B00C8C670 AS DateTime), N'Se finalizó estructura de base de datos y procedimientos de almacenado', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20005, 0, 50, 2, CAST(0x0000A98B01140810 AS DateTime), N'Tablas y procedimiento de almacenado creados', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20006, 0, 20005, 2, CAST(0x0000A98B011F9130 AS DateTime), N'Update en módulo de Facturacion3 completado

Update en módulo de Clientes completado', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20007, 0, 50, 2, CAST(0x0000A98B011FD780 AS DateTime), N'Update en módulo de Facturacion3 completado

Update en módulo de Clientes completado ', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20008, 0, 50, 2, CAST(0x0000A98B0128A180 AS DateTime), N'Update Configuraciones de Cuenta completado', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20009, 0, 50, 2, CAST(0x0000A98B0128E7D0 AS DateTime), N'Update Listado de Facturas completado', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20010, 0, 48, 3, CAST(0x0000A98B012EAC60 AS DateTime), N'Se hicieron scripts de creación de tablas y procedimientos de almacenamiento SQL', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20011, 0, 50, 2, CAST(0x0000A98B012EF2B0 AS DateTime), N'Update Products y Remito completados', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20012, 10002, 0, 3, CAST(0x0000A98B01300BF0 AS DateTime), N'Se creó módulo de Configuración de Alerta de Stock, el mismo está listo para implementar funcionalidad', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20013, 0, 50, 2, CAST(0x0000A98B01342AA0 AS DateTime), N'Update resto de las librerias:
*Retiros y pagos
*Stock
*Suppliers
*Tratamientos', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20015, 0, 50, 2, CAST(0x0000A98B01544D30 AS DateTime), N'Se instalaron los modulos actualizados y se testeó Facturacion3. ver agregar tratamiento/eliminar articulo de la factura', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20017, 10009, 0, 2, CAST(0x0000A98C002A9270 AS DateTime), N'Posible libreria a utilizar http://www.chartjs.org', NULL)
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20018, 10004, 0, 2, CAST(0x0000A98C00F77790 AS DateTime), N'Modulo suppliers finalizado completamente', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20019, 10004, 0, 2, CAST(0x0000A98C00FB9640 AS DateTime), N'Modulo Productos finalizado completamente', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20020, 10004, 0, 2, CAST(0x0000A98C0104A690 AS DateTime), N'Modulo Stock finalizado completamente', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20021, 10004, 0, 2, CAST(0x0000A98C010BCAB0 AS DateTime), N'Modulo de tratamiento adaptado', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20022, 10004, 0, 2, CAST(0x0000A98C01163A90 AS DateTime), N'Modulo Facturacion: bug en agregar tratamiento (redireccion infinita) y en agregar articulo (no busca correctamente). Boton borrar tratamiento tambien produce un bucle de redirección.', N'Bug')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20023, 10002, 0, 4, CAST(0x0000A98C0147F120 AS DateTime), N'Finalizando la creación del estilo CSS de la página. A la vez se perfeccionaron algunos aspectos de la estructura HTML.', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20027, 0, 20026, 1, CAST(0x0000A98D0028EC90 AS DateTime), N'asdasd', N'Bug')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20030, 20003, 0, 1, CAST(0x0000A98D0047F5E0 AS DateTime), N'El administrativo debe permitir comenzar y finalizar la jornada desde su panel de control', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20031, 30003, 0, 2, CAST(0x0000A98D00EDDAA0 AS DateTime), N'Boton de adjuntar archivos a la derecha de cada comentario', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20032, 30003, 0, 2, CAST(0x0000A98D00EEF3E0 AS DateTime), N'Boton de agregar comentario al lado de "Ver comentarios"', N'Task')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20033, 0, 20022, 2, CAST(0x0000A98D01015AD0 AS DateTime), N'Se soluciono ', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20034, 10004, 0, 2, CAST(0x0000A98D0110BC50 AS DateTime), N'Modulo Clientes completado', N'Done')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20035, 10004, 0, 2, CAST(0x0000A98D011102A0 AS DateTime), N'Modulo Cuentas Corrientes Completado', N'Comment')
INSERT [dbo].[Posts] ([Id], [SprintId], [PostId], [UserId], [Date], [Body], [Type]) VALUES (20036, 10012, 0, 2, CAST(0x0000A98D01144E60 AS DateTime), N'Todo en orden', N'Done')
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [Name]) VALUES (10, N'Proyecto Bryz SPA')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (11, N'Proveduria Lupo (Sistema de gestion)')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (12, N'Hospital Chazón')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (13, N'Hospital Arroyo Cabral')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (14, N'Hospital Ausonia')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (15, N'Integracion sistema ')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (16, N'Estandarizacion CENELEC')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (17, N'Estandarizacion firma digital HCD')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (18, N'Proyecto de impulso tecnologico San Martin')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (19, N'Proveedor Bergia (Ferreteria y construccion) ')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (20, N'Desarrollo Sistema MIGUL para balanza de camiones')
INSERT [dbo].[Projects] ([Id], [Name]) VALUES (10009, N'Tracker 2.0')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[ProjectsAuthorization] ON 

INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (1, 1, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (3, 2, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (4, 3, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (5, 4, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (6, 5, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10003, 1, 14)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10004, 2, 14)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10005, 3, 14)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10006, 4, 14)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10007, 10002, 14)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (10008, 10002, 10)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (20002, 1, 10009)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (20003, 2, 10009)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (20004, 3, 10009)
INSERT [dbo].[ProjectsAuthorization] ([Id], [UserId], [ProjectId]) VALUES (20005, 4, 10009)
SET IDENTITY_INSERT [dbo].[ProjectsAuthorization] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (1, N'Programador')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (2, N'Diseñador')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (3, N'Testing')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (4, N'Cliente')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (5, N'Programador/Diseñador')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (10005, N'Cliente/Clinica Informatica')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (20005, N'Visitante')
INSERT [dbo].[Roles] ([Id], [Rol]) VALUES (20006, N'Persona no grata')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Sprints] ON 

INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10002, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Creacion Formulario config. notificacion y aviso stock', 3, N'Desarrollo')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10003, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Creacion de modulo sin vista (notificacion stock)', 3, N'Analisis')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10004, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Tabla de referencia identificacion usuarios', 14, N'Desarrollo')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10005, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Creacion modulo Transferencia de stock', 7, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10006, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Integracion tratamiento a cuenta corriente', 4, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10007, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Integrar Tarjeta credito a venta', 7, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10008, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Modulo consulta turnos locales', 7, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10009, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Informe mensual de ventas por tratamientos', 4, N'Analisis')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (10012, 1, 10, CAST(0x0000A98900000000 AS DateTime), N'Preparacion entorno desarrollo', 1, N'Finalizado')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (20003, 1, 14, CAST(0x0000A9A400000000 AS DateTime), N'Pedidos de sprint Ausonia', 0, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (30002, 1, 10, CAST(0x0000A98C00000000 AS DateTime), N'El modulo de tratamientos no lista los tratamientos correctamente', 1, N'Analisis')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (30003, 1, 10009, CAST(0x0000A98C00000000 AS DateTime), N'Sugerencias Tracker', 1, NULL)
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (30004, 2, 10, CAST(0x0000A8A001140810 AS DateTime), N'Modulo de reportes', 0, N'Pausado')
INSERT [dbo].[Sprints] ([Id], [IdUser], [IdProject], [Created], [Description], [EstimatedDays], [Estado]) VALUES (30005, 2, 10, CAST(0x0000A8A0011826C0 AS DateTime), N'Chequear funcionalidad Turnero', 0, N'Pausado')
SET IDENTITY_INSERT [dbo].[Sprints] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (1, N'David', 1, N'david1')
INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (2, N'Ramiro', 1, N'cloverfieldLosha')
INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (3, N'Mariano', 1, N'Qxp45_eeA')
INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (4, N'Luciano', 5, N'support2035')
INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (5, N'Daiana', 4, N'dai2018')
INSERT [dbo].[Users] ([Id], [UserName], [Rol], [Password]) VALUES (10002, N'Laura', 10005, N'lau2018')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_Type]  DEFAULT ('comentario') FOR [Type]
GO
ALTER TABLE [dbo].[Sprints] ADD  CONSTRAINT [DF_Sprints_Estado]  DEFAULT ('Pausado') FOR [Estado]
GO
