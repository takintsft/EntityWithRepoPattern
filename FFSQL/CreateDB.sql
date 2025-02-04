USE [master]
GO
/****** Object:  Database [FinalFantasy]    Script Date: 06/04/2015 18:04:18 ******/
CREATE DATABASE [FinalFantasy] ON  PRIMARY 
( NAME = N'FinalFantasy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FinalFantasy.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FinalFantasy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FinalFantasy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FinalFantasy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalFantasy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalFantasy] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FinalFantasy] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FinalFantasy] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FinalFantasy] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FinalFantasy] SET ARITHABORT OFF
GO
ALTER DATABASE [FinalFantasy] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [FinalFantasy] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FinalFantasy] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FinalFantasy] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FinalFantasy] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FinalFantasy] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FinalFantasy] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FinalFantasy] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FinalFantasy] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FinalFantasy] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FinalFantasy] SET  DISABLE_BROKER
GO
ALTER DATABASE [FinalFantasy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FinalFantasy] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FinalFantasy] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FinalFantasy] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FinalFantasy] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FinalFantasy] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FinalFantasy] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [FinalFantasy] SET  READ_WRITE
GO
ALTER DATABASE [FinalFantasy] SET RECOVERY FULL
GO
ALTER DATABASE [FinalFantasy] SET  MULTI_USER
GO
ALTER DATABASE [FinalFantasy] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FinalFantasy] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinalFantasy', N'ON'
GO
USE [FinalFantasy]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 06/04/2015 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[aId] [int] IDENTITY(1,1) NOT NULL,
	[aFirstName] [nvarchar](512) NULL,
	[aLastName] [nvarchar](512) NULL,
	[aUsername] [nvarchar](256) NULL,
	[aPassword] [nvarchar](256) NULL,
	[aDateJoin] [datetime] NULL,
	[aIsWork] [tinyint] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 06/04/2015 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[tname] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostMedia]    Script Date: 06/04/2015 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostMedia](
	[mid] [int] IDENTITY(1,1) NOT NULL,
	[mname] [nvarchar](512) NULL,
	[msource] [text] NULL,
	[mupload] [datetime] NULL,
	[mavailable] [tinyint] NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 06/04/2015 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[ptitle] [nvarchar](512) NULL,
	[pexcerpt] [text] NULL,
	[pcontent] [text] NULL,
	[pauthor] [int] NULL,
	[pimage] [int] NULL,
	[ptags] [int] NULL,
	[pdate] [datetime] NULL,
	[pavailable] [tinyint] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Post_Author]    Script Date: 06/04/2015 18:04:18 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Author] FOREIGN KEY([pauthor])
REFERENCES [dbo].[Author] ([aId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Author]
GO
/****** Object:  ForeignKey [FK_Post_Media]    Script Date: 06/04/2015 18:04:18 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Media] FOREIGN KEY([pimage])
REFERENCES [dbo].[PostMedia] ([mid])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Media]
GO
/****** Object:  ForeignKey [FK_Post_Tags]    Script Date: 06/04/2015 18:04:18 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags] FOREIGN KEY([ptags])
REFERENCES [dbo].[PostTags] ([tid])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Tags]
GO
