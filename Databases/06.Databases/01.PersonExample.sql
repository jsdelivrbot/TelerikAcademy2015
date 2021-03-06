USE [master]
GO
/****** Object:  Database [DatabasePerson]    Script Date: 9.10.2015 г. 19:48:24 ******/
CREATE DATABASE [DatabasePerson]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabasePerson', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DatabasePerson.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DatabasePerson_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DatabasePerson_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DatabasePerson] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabasePerson].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabasePerson] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabasePerson] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabasePerson] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabasePerson] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabasePerson] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabasePerson] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabasePerson] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabasePerson] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabasePerson] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabasePerson] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabasePerson] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabasePerson] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabasePerson] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabasePerson] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabasePerson] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabasePerson] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabasePerson] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabasePerson] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabasePerson] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabasePerson] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabasePerson] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabasePerson] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabasePerson] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatabasePerson] SET  MULTI_USER 
GO
ALTER DATABASE [DatabasePerson] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabasePerson] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabasePerson] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabasePerson] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DatabasePerson] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DatabasePerson]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 9.10.2015 г. 19:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_text] [ntext] NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 9.10.2015 г. 19:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 9.10.2015 г. 19:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 9.10.2015 г. 19:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 9.10.2015 г. 19:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (1, N'Flowers Str 15', 1)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (2, N'Muddy Watters Str 5', 4)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (3, N'George''s Str 74', 2)
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (1, N'Asia')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (2, N'Africa')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (3, N'North America')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (4, N'South America')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (5, N'Antarctica')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (6, N'Europe')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (7, N'Australia')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (1, N'Bulgaria', 6)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (2, N'China', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (3, N'Germany', 6)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (2, N'Jane', N'Dow', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'John ', N'Dow', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (4, N'Gerry', N'Morins', 3)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (5, N'Robert', N'Grates', 2)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
SET IDENTITY_INSERT [dbo].[TOWN] ON 

INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (2, N'Beijing', 2)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (3, N'Plovdiv', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (4, N'Shanghai', 2)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (5, N'Berlin', 3)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (6, N'Hamburg', 3)
SET IDENTITY_INSERT [dbo].[TOWN] OFF
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([town_id])
REFERENCES [dbo].[TOWN] ([id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([address_id])
REFERENCES [dbo].[ADDRESS] ([id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [DatabasePerson] SET  READ_WRITE 
GO
