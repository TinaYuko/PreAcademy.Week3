USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 22/10/2021 13:14:35 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\Marti\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\Marti\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 22/10/2021 13:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IDAlbum] [int] IDENTITY(1,1) NOT NULL,
	[TitoloAlbum] [nvarchar](50) NOT NULL,
	[AnnoUscita] [date] NOT NULL,
	[CasaDiscografica] [nvarchar](30) NOT NULL,
	[Genere] [nvarchar](10) NOT NULL,
	[Distribuzione] [nvarchar](10) NOT NULL,
	[IDBand] [int] NOT NULL,
 CONSTRAINT [PK_ALBUM] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 22/10/2021 13:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IDBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[NumComponenti] [int] NOT NULL,
 CONSTRAINT [PK_BAND] PRIMARY KEY CLUSTERED 
(
	[IDBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 22/10/2021 13:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IDBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](50) NOT NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [PK_BRANO] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranoxAlbum]    Script Date: 22/10/2021 13:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranoxAlbum](
	[IDBrano] [int] NOT NULL,
	[IDAlbum] [int] NOT NULL,
 CONSTRAINT [PK_BRANOXALBUM] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC,
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (1, N'Troppo bello sto album', CAST(N'1980-10-23' AS Date), N'Sony', N'Rock', N'CD', 6)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (2, N'The greatest hits', CAST(N'1998-11-03' AS Date), N'Sony', N'Jazz', N'Vinile', 5)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (3, N'Christmas days', CAST(N'2000-12-15' AS Date), N'MGM', N'Pop', N'CD', 8)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (4, N'Summer hit', CAST(N'2015-06-12' AS Date), N'RJK', N'Pop', N'Streaming', 7)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (5, N'Yellow Submarine', CAST(N'1963-05-18' AS Date), N'Sony', N'Rock', N'CD', 8)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (6, N'Best of ACDC', CAST(N'1990-03-13' AS Date), N'MGM', N'Metal', N'CD', 2)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (7, N'Classic FM', CAST(N'1930-01-30' AS Date), N'MGM', N'Classico', N'Vinile', 4)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (8, N'Siamo troppo toghi', CAST(N'2020-03-29' AS Date), N'Sony', N'Rock', N'CD', 3)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (9, N'Best of Orietta', CAST(N'2018-07-15' AS Date), N'RJK', N'Pop', N'Streaming', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IDBand]) VALUES (10, N'Tutte le maschere', CAST(N'2003-02-21' AS Date), N'Sony', N'Jazz', N'Vinile', 4)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (1, N'Orietta Berti&Band', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (2, N'AC/DC', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (3, N'Maneskin', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (4, N'883', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (5, N'Queen', 7)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (6, N'Zio Peppino duo', 2)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (7, N'The Giornalisti', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumComponenti]) VALUES (8, N'Beatles', 4)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (1, N'Finché la barca va', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (2, N'Hanno ucciso l''uomo ragno', 165)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (3, N'Tanti auguri a te', 110)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (4, N'Con te partirò', 210)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (5, N'Beggin', 200)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (6, N'My immortal', 190)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (7, N'Wake me up before u go', 235)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (8, N'Thunderstorm', 190)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (9, N'Imagine', 185)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (10, N'Let it go', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (11, N'Sigla Pokemon', 120)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (12, N'Volare', 110)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (13, N'That''s life', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (14, N'Nanneddu meu', 100)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (15, N'Never enough', 200)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (16, N'Canzone sconosciuta che non andrà da nessuna parte', 110)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (1, 4)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (1, 9)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (2, 7)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (2, 9)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (3, 9)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (4, 7)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (5, 8)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (5, 10)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (6, 9)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (7, 3)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (8, 6)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (9, 5)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (10, 3)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (11, 2)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (11, 8)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (12, 4)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (12, 10)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (13, 1)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (14, 1)
INSERT [dbo].[BranoxAlbum] ([IDBrano], [IDAlbum]) VALUES (15, 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_ALBUM]    Script Date: 22/10/2021 13:14:36 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [UK_ALBUM] UNIQUE NONCLUSTERED 
(
	[TitoloAlbum] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[Distribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_BAND] FOREIGN KEY([IDBand])
REFERENCES [dbo].[Band] ([IDBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_BAND]
GO
ALTER TABLE [dbo].[BranoxAlbum]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([IDAlbum])
GO
ALTER TABLE [dbo].[BranoxAlbum] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[BranoxAlbum]  WITH CHECK ADD  CONSTRAINT [FK_BRANO] FOREIGN KEY([IDBrano])
REFERENCES [dbo].[Brano] ([IDBrano])
GO
ALTER TABLE [dbo].[BranoxAlbum] CHECK CONSTRAINT [FK_BRANO]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Distribuzione]='Streaming' OR [Distribuzione]='Vinile' OR [Distribuzione]='CD'))
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Genere]='Metal' OR [Genere]='Rock' OR [Genere]='Pop' OR [Genere]='Jazz' OR [Genere]='Classico'))
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
