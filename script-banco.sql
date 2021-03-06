USE [master]
GO
/****** Object:  Database [PEPe]    Script Date: 10/04/2015 11:09:52 ******/
CREATE DATABASE [PEPe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PEPe_novo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PEPe_novo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PEPe_novolog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PEPe_novolog.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PEPe] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PEPe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PEPe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PEPe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PEPe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PEPe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PEPe] SET ARITHABORT OFF 
GO
ALTER DATABASE [PEPe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PEPe] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PEPe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PEPe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PEPe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PEPe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PEPe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PEPe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PEPe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PEPe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PEPe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PEPe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PEPe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PEPe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PEPe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PEPe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PEPe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PEPe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PEPe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PEPe] SET  MULTI_USER 
GO
ALTER DATABASE [PEPe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PEPe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PEPe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PEPe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PEPe]
GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agenda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[Exame_Id] [int] NOT NULL,
	[Consulta_Id] [int] NOT NULL,
 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[Profissional_Id] [int] NOT NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsultaMedicamento]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Medicamento_Id] [int] NOT NULL,
	[Consulta_Id] [int] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exame]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exame](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Exame] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profissional]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profissional](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Profissional] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/04/2015 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Agenda] ON 

INSERT [dbo].[Agenda] ([Id], [DataHora], [Usuario_Id], [Exame_Id], [Consulta_Id]) VALUES (4, CAST(0x0000A47400F73140 AS DateTime), 1, 1, 2)
INSERT [dbo].[Agenda] ([Id], [DataHora], [Usuario_Id], [Exame_Id], [Consulta_Id]) VALUES (5, CAST(0x0000A47501391C40 AS DateTime), 1, 1, 3)
INSERT [dbo].[Agenda] ([Id], [DataHora], [Usuario_Id], [Exame_Id], [Consulta_Id]) VALUES (6, CAST(0x0000A477009450C0 AS DateTime), 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Agenda] OFF
SET IDENTITY_INSERT [dbo].[Consulta] ON 

INSERT [dbo].[Consulta] ([Id], [Descricao], [Profissional_Id]) VALUES (2, N'Pellentesque ultrices mattis ante id varius. Pellentesque fringilla mattis augue, eget laoreet lectus mattis eu. Nam eget urna et ante aliquam dapibus quis id ligula. Nam ac ipsum ligula. Nam sodales gravida tellus, nec mollis tellus. Suspendisse egestas malesuada mauris, et imperdiet lacus tincidunt sit amet. Morbi nec enim mauris. Fusce consequat elementum ligula sit amet convallis. Maecenas placerat sagittis nulla, quis accumsan neque dictum sed. Phasellus purus justo, blandit luctus ornare vel, dapibus non ipsum. Pellentesque pellentesque justo ligula, in gravida purus auctor vel.', 1)
INSERT [dbo].[Consulta] ([Id], [Descricao], [Profissional_Id]) VALUES (3, N'Aliquam erat volutpat. Nunc sapien nulla, blandit eget accumsan at, accumsan ac nisi. Mauris a diam euismod lacus tristique consectetur. Morbi semper massa sit amet justo faucibus interdum. Duis ligula justo, sagittis vel tellus nec, aliquam dapibus sem. Cras efficitur finibus velit ut placerat. Nunc dignissim nisl diam, nec accumsan nunc porta et. Nam vulputate risus id scelerisque laoreet. Nulla dignissim mi et est vehicula, nec viverra velit scelerisque. Duis ornare nisl mi, eu suscipit eros vestibulum sed.', 2)
INSERT [dbo].[Consulta] ([Id], [Descricao], [Profissional_Id]) VALUES (4, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non vehicula ante. Integer egestas nibh mauris. Etiam quis nunc ultrices, dapibus eros et, mollis eros. Ut quis blandit urna, ac faucibus orci. Suspendisse efficitur gravida nunc quis pretium. Integer mollis, orci ut efficitur varius, magna ante congue ligula, a gravida erat arcu a lectus. Vestibulum feugiat, massa eget gravida rhoncus, libero ipsum placerat nulla, sed lobortis dolor ipsum in odio. Cras porta, quam tempor placerat ultricies, lectus metus sagittis odio, eget feugiat ex lacus at sem. Sed iaculis ligula tellus, at ornare augue accumsan non. Morbi ligula mi, gravida quis ipsum a, tincidunt consectetur lorem. In euismod sapien mi, eu rhoncus libero interdum eget. Suspendisse luctus tempor orci, eget aliquam mi sollicitudin at. Pellentesque bibendum elit nunc, et vestibulum dolor pellentesque nec. Sed eget sagittis leo. Praesent ut ornare sem.', 3)
SET IDENTITY_INSERT [dbo].[Consulta] OFF
SET IDENTITY_INSERT [dbo].[ConsultaMedicamento] ON 

INSERT [dbo].[ConsultaMedicamento] ([Id], [Medicamento_Id], [Consulta_Id]) VALUES (5, 1, 2)
INSERT [dbo].[ConsultaMedicamento] ([Id], [Medicamento_Id], [Consulta_Id]) VALUES (6, 2, 2)
INSERT [dbo].[ConsultaMedicamento] ([Id], [Medicamento_Id], [Consulta_Id]) VALUES (7, 3, 2)
INSERT [dbo].[ConsultaMedicamento] ([Id], [Medicamento_Id], [Consulta_Id]) VALUES (8, 4, 2)
SET IDENTITY_INSERT [dbo].[ConsultaMedicamento] OFF
SET IDENTITY_INSERT [dbo].[Exame] ON 

INSERT [dbo].[Exame] ([Id], [Descricao]) VALUES (1, N'Exame 1')
INSERT [dbo].[Exame] ([Id], [Descricao]) VALUES (2, N'Exame 2')
SET IDENTITY_INSERT [dbo].[Exame] OFF
SET IDENTITY_INSERT [dbo].[Medicamento] ON 

INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (1, N'Paracetamol')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (2, N'Dipirona')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (3, N'Predinisona')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (4, N'Omeprazol')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (5, N'Ranitidina')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (6, N'Buscopan')
INSERT [dbo].[Medicamento] ([Id], [Descricao]) VALUES (7, N'Cefalexina')
SET IDENTITY_INSERT [dbo].[Medicamento] OFF
SET IDENTITY_INSERT [dbo].[Profissional] ON 

INSERT [dbo].[Profissional] ([Id], [Nome]) VALUES (1, N'Medico 1')
INSERT [dbo].[Profissional] ([Id], [Nome]) VALUES (2, N'Fisio 1')
INSERT [dbo].[Profissional] ([Id], [Nome]) VALUES (3, N'Medico 2')
INSERT [dbo].[Profissional] ([Id], [Nome]) VALUES (4, N'Fisio 2')
SET IDENTITY_INSERT [dbo].[Profissional] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nome]) VALUES (1, N'Joãozinho')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Index [IX_FK_ConsultaAgenda]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ConsultaAgenda] ON [dbo].[Agenda]
(
	[Consulta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ExameAgenda]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ExameAgenda] ON [dbo].[Agenda]
(
	[Exame_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UsuarioAgenda]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UsuarioAgenda] ON [dbo].[Agenda]
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProfissionalConsulta]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProfissionalConsulta] ON [dbo].[Consulta]
(
	[Profissional_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ConsultaConsultaMedicamento]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ConsultaConsultaMedicamento] ON [dbo].[ConsultaMedicamento]
(
	[Consulta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MedicamentoConsultaMedicamento]    Script Date: 10/04/2015 11:09:53 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MedicamentoConsultaMedicamento] ON [dbo].[ConsultaMedicamento]
(
	[Medicamento_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agenda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaAgenda] FOREIGN KEY([Consulta_Id])
REFERENCES [dbo].[Consulta] ([Id])
GO
ALTER TABLE [dbo].[Agenda] CHECK CONSTRAINT [FK_ConsultaAgenda]
GO
ALTER TABLE [dbo].[Agenda]  WITH CHECK ADD  CONSTRAINT [FK_ExameAgenda] FOREIGN KEY([Exame_Id])
REFERENCES [dbo].[Exame] ([Id])
GO
ALTER TABLE [dbo].[Agenda] CHECK CONSTRAINT [FK_ExameAgenda]
GO
ALTER TABLE [dbo].[Agenda]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioAgenda] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Agenda] CHECK CONSTRAINT [FK_UsuarioAgenda]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_ProfissionalConsulta] FOREIGN KEY([Profissional_Id])
REFERENCES [dbo].[Profissional] ([Id])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_ProfissionalConsulta]
GO
ALTER TABLE [dbo].[ConsultaMedicamento]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaConsultaMedicamento] FOREIGN KEY([Consulta_Id])
REFERENCES [dbo].[Consulta] ([Id])
GO
ALTER TABLE [dbo].[ConsultaMedicamento] CHECK CONSTRAINT [FK_ConsultaConsultaMedicamento]
GO
ALTER TABLE [dbo].[ConsultaMedicamento]  WITH CHECK ADD  CONSTRAINT [FK_MedicamentoConsultaMedicamento] FOREIGN KEY([Medicamento_Id])
REFERENCES [dbo].[Medicamento] ([Id])
GO
ALTER TABLE [dbo].[ConsultaMedicamento] CHECK CONSTRAINT [FK_MedicamentoConsultaMedicamento]
GO
USE [master]
GO
ALTER DATABASE [PEPe] SET  READ_WRITE 
GO
