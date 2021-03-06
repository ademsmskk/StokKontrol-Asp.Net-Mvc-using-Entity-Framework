USE [master]
GO
/****** Object:  Database [StokTakip]    Script Date: 11.01.2022 17:06:40 ******/
CREATE DATABASE [StokTakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StokTakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StokTakip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StokTakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StokTakip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StokTakip] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StokTakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StokTakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StokTakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [StokTakip] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StokTakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StokTakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StokTakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StokTakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StokTakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StokTakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StokTakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StokTakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StokTakip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StokTakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StokTakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StokTakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StokTakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StokTakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StokTakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StokTakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StokTakip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StokTakip] SET  MULTI_USER 
GO
ALTER DATABASE [StokTakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StokTakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StokTakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StokTakip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StokTakip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StokTakip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StokTakip] SET QUERY_STORE = OFF
GO
USE [StokTakip]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 11.01.2022 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 11.01.2022 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAd] [nvarchar](50) NULL,
	[MusteriSoyad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 11.01.2022 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [int] NULL,
	[Fiyat] [int] NULL,
 CONSTRAINT [PK_Satis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 11.01.2022 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [nvarchar](50) NULL,
	[UrunKategori] [int] NULL,
	[Fiyat] [int] NULL,
	[Marka] [nvarchar](50) NULL,
	[Stok] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (1, N'Beyaz Eşya')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (2, N'Mutfak Malzemesi')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (3, N'Elektonik Eşya')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (4, N'Süs Eşyası')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (5, N'Okul Eşyası')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (6, N'Kitap')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (7, N'Giyim')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd]) VALUES (12, N'sağlık')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAd], [MusteriSoyad]) VALUES (1, N'alii', N'x')
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAd], [MusteriSoyad]) VALUES (2, N'veli', N'y')
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAd], [MusteriSoyad]) VALUES (3, N'adem', N'z')
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAd], [MusteriSoyad]) VALUES (4, N'ahmet', N'u')
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAd], [MusteriSoyad]) VALUES (5, N'mehmet', N'r')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Satis] ON 

INSERT [dbo].[Satis] ([SatisID], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (6, 1, 1, 2, 10000)
INSERT [dbo].[Satis] ([SatisID], [Urun], [Musteri], [Adet], [Fiyat]) VALUES (7, 7, 3, 2, 2000)
SET IDENTITY_INSERT [dbo].[Satis] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (1, N'Buzdolabıı', 1, 10000, N'Arçelik', 1000)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (3, N'Çamaşır Makinesi', 1, 50000, N'Arçelik', 15)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (4, N'Bulaşık Makinesi', 1, 40000, N'Vestel', 20)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (5, N'Tencere', 2, 80, N'İkea', 50)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (6, N'Robot', 2, 500, N'Bosch', 40)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (7, N'Süpürge', 3, 1000, N'Arçelik', 10)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (8, N'Saat', 3, 100, N'Casio', 50)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (9, N'Biblo', 4, 200, N'İkea', 60)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (10, N'Çanta', 5, 100, N'X', 20)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (11, N'Kalem', 5, 20, N'FaberCastel', 90)
INSERT [dbo].[Urunler] ([UrunID], [UrunAd], [UrunKategori], [Fiyat], [Marka], [Stok]) VALUES (17, N'bilgisayarr', 2, 2000, N'asus', 8)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Musteriler] FOREIGN KEY([Musteri])
REFERENCES [dbo].[Musteriler] ([MusteriID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Musteriler]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Urunler] FOREIGN KEY([Urun])
REFERENCES [dbo].[Urunler] ([UrunID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([UrunKategori])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
USE [master]
GO
ALTER DATABASE [StokTakip] SET  READ_WRITE 
GO
