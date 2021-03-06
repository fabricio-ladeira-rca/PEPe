USE [master]
GO
/****** Object:  Database [PEPe]    Script Date: 30/03/2015 19:18:36 ******/
CREATE DATABASE [PEPe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PEPe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PEPe.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PEPe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PEPe_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PEPe] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [PEPe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PEPe]
GO
/****** Object:  Table [dbo].[AGENDA]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AGENDA](
	[ID_AGENDA] [int] IDENTITY(1,1) NOT NULL,
	[DT_AGENDAMENTO] [datetime] NOT NULL,
	[EXECUTOR] [varchar](50) NOT NULL,
	[DT_SOLICITACAO] [datetime] NOT NULL,
 CONSTRAINT [PK_AGENDA] PRIMARY KEY CLUSTERED 
(
	[ID_AGENDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AGENDA_AGENDAMENTO]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AGENDA_AGENDAMENTO](
	[ID_AG_EXAME] [int] IDENTITY(1,1) NOT NULL,
	[ID_AGENDA] [int] NOT NULL,
	[SOLICITANTE] [varchar](50) NULL,
	[EXECUTOR] [varchar](50) NULL,
	[MOTIVO] [varchar](50) NOT NULL,
	[LOCAL] [varchar](50) NULL,
	[VALOR] [float] NULL,
	[ID_EXAME] [int] NULL,
	[ID_MEDICAMENTO] [int] NULL,
	[ID_CONSULTA] [int] NULL,
	[ID_PROCEDIMENTO] [int] NULL,
	[ID_CUIDADO] [int] NULL,
 CONSTRAINT [PK_AGENDA_AGENDAMENTO] PRIMARY KEY CLUSTERED 
(
	[ID_AG_EXAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONSULTA]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONSULTA](
	[ID_CONSULTA] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CONSULTA] PRIMARY KEY CLUSTERED 
(
	[ID_CONSULTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUIDADO]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUIDADO](
	[ID_CUIDADO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CUIDADO] PRIMARY KEY CLUSTERED 
(
	[ID_CUIDADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXAME]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXAME](
	[ID_EXAME] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EXAME] PRIMARY KEY CLUSTERED 
(
	[ID_EXAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MEDICAMENTO]    Script Date: 30/03/2015 19:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEDICAMENTO](
	[ID_MEDICAMENTO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MEDICAMENTO] PRIMARY KEY CLUSTERED 
(
	[ID_MEDICAMENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDA_AGENDAMENTO_AGENDA] FOREIGN KEY([ID_AGENDA])
REFERENCES [dbo].[AGENDA] ([ID_AGENDA])
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO] CHECK CONSTRAINT [FK_AGENDA_AGENDAMENTO_AGENDA]
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDA_AGENDAMENTO_CONSULTA] FOREIGN KEY([ID_CONSULTA])
REFERENCES [dbo].[CONSULTA] ([ID_CONSULTA])
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO] CHECK CONSTRAINT [FK_AGENDA_AGENDAMENTO_CONSULTA]
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDA_AGENDAMENTO_CUIDADO] FOREIGN KEY([ID_CUIDADO])
REFERENCES [dbo].[CUIDADO] ([ID_CUIDADO])
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO] CHECK CONSTRAINT [FK_AGENDA_AGENDAMENTO_CUIDADO]
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDA_AGENDAMENTO_EXAME] FOREIGN KEY([ID_EXAME])
REFERENCES [dbo].[EXAME] ([ID_EXAME])
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO] CHECK CONSTRAINT [FK_AGENDA_AGENDAMENTO_EXAME]
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDA_AGENDAMENTO_MEDICAMENTO] FOREIGN KEY([ID_CUIDADO])
REFERENCES [dbo].[MEDICAMENTO] ([ID_MEDICAMENTO])
GO
ALTER TABLE [dbo].[AGENDA_AGENDAMENTO] CHECK CONSTRAINT [FK_AGENDA_AGENDAMENTO_MEDICAMENTO]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CHAVE PRIMÁRIA DA TABELA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AGENDA', @level2type=N'COLUMN',@level2name=N'ID_AGENDA'
GO
USE [master]
GO
ALTER DATABASE [PEPe] SET  READ_WRITE 
GO
