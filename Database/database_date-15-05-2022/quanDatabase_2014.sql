USE [master]
GO
/****** Object:  Database [BanHangVanPhongPham]    Script Date: 15/05/2022 06:48:57 PM ******/
CREATE DATABASE [BanHangVanPhongPham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHangVanPhongPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHangVanPhongPham.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHangVanPhongPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHangVanPhongPham_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanHangVanPhongPham] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHangVanPhongPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHangVanPhongPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHangVanPhongPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHangVanPhongPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanHangVanPhongPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHangVanPhongPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET RECOVERY FULL 
GO
ALTER DATABASE [BanHangVanPhongPham] SET  MULTI_USER 
GO
ALTER DATABASE [BanHangVanPhongPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHangVanPhongPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHangVanPhongPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHangVanPhongPham] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHangVanPhongPham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanHangVanPhongPham] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanHangVanPhongPham', N'ON'
GO
ALTER DATABASE [BanHangVanPhongPham] SET QUERY_STORE = OFF
GO
USE [BanHangVanPhongPham]
GO
/****** Object:  Table [dbo].[address]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [bigint] IDENTITY(1,1) NOT NULL,
	[specific_address] [nvarchar](100) NULL,
	[user_id] [bigint] NULL,
	[ward_id] [bigint] NULL,
 CONSTRAINT [PK__address__CAA247C8CCFF8FB3] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](200) NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK__brand__5E5A8E271706E7C7] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[product_id] [bigint] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](300) NULL,
	[name] [nvarchar](100) NULL,
	[note] [nvarchar](300) NULL,
 CONSTRAINT [PK__category__D54EE9B4BABFE3E2] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[district_id] [bigint] IDENTITY(1,1) NOT NULL,
	[district_name] [nvarchar](100) NULL,
	[district_prefix] [nvarchar](100) NULL,
	[province_id] [bigint] NULL,
 CONSTRAINT [PK__district__2521322BF067C0F3] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id_product] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[comment] [nvarchar](255) NULL,
	[date] [datetime2](7) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK__feedback__51A20B3F53E75E0E] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [numeric](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
 CONSTRAINT [PK__order_de__3213E83FCADBF891] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[status_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK__order_st__3683B5312B6BCF6A] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NULL,
	[total_price] [float] NULL,
	[status_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poster]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_active] [bit] NULL,
	[name] [nvarchar](300) NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK__poster__3213E83FF3B86902] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[calculation_unit] [nvarchar](300) NULL,
	[description] [nvarchar](1000) NULL,
	[discount] [int] NOT NULL,
	[image] [nvarchar](300) NULL,
	[name] [nvarchar](200) NULL,
	[price] [numeric](18, 2) NULL,
	[quantity] [int] NOT NULL,
	[sold_quantity] [int] NULL,
	[specification] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
	[brand_id] [bigint] NULL,
	[category_id] [bigint] NULL,
 CONSTRAINT [PK__product__47027DF52F62BAF9] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[province_id] [bigint] IDENTITY(1,1) NOT NULL,
	[province_code] [nvarchar](20) NULL,
	[province_name] [nvarchar](100) NULL,
 CONSTRAINT [PK__province__08DCB60F94649ADE] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_id] [bigint] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[first_name] [nvarchar](120) NULL,
	[image] [nvarchar](300) NULL,
	[last_name] [nvarchar](120) NULL,
	[password] [varchar](120) NULL,
	[phone] [varchar](10) NULL,
	[status] [bit] NOT NULL,
	[username] [varchar](20) NULL,
 CONSTRAINT [PK__users__3213E83F5981D3B9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_du5v5sr43g5bfnji4vb8hg5s3] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UKr43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ward]    Script Date: 15/05/2022 06:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ward](
	[ward_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ward_name] [nvarchar](50) NULL,
	[ward_prefix] [nvarchar](50) NULL,
	[district_id] [bigint] NULL,
 CONSTRAINT [PK__ward__396B899D7FE2F0C5] PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_users]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FKq7vspx6bqxq5lawbv2calw5lb] FOREIGN KEY([ward_id])
REFERENCES [dbo].[ward] ([ward_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FKq7vspx6bqxq5lawbv2calw5lb]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK3d704slv66tw6x5hmbm6p2x3u] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK3d704slv66tw6x5hmbm6p2x3u]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6]
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD  CONSTRAINT [FK276utu38g5lgqeth6pwfm3rw2] FOREIGN KEY([province_id])
REFERENCES [dbo].[province] ([province_id])
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [FK276utu38g5lgqeth6pwfm3rw2]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK23lq8u03gd16x4s8w609og3c5] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK23lq8u03gd16x4s8w609og3c5]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FKpwwmhguqianghvi1wohmtsm8l] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FKpwwmhguqianghvi1wohmtsm8l]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKb8bg2bkty0oksa3wiq5mp5qnc] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKb8bg2bkty0oksa3wiq5mp5qnc]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK1abokg3ghque9pf2ujbxakng] FOREIGN KEY([status_id])
REFERENCES [dbo].[order_status] ([status_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK1abokg3ghque9pf2ujbxakng]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK1mtsbur82frn64de7balymq9s] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK1mtsbur82frn64de7balymq9s]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FKs6cydsualtsrprvlf2bb3lcam] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FKs6cydsualtsrprvlf2bb3lcam]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKh8ciramu9cc9q3qcqiv4ue8a6] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKh8ciramu9cc9q3qcqiv4ue8a6]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f]
GO
ALTER TABLE [dbo].[ward]  WITH CHECK ADD  CONSTRAINT [FKslko72wj5nauqvsgefqkvwpsb] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([district_id])
GO
ALTER TABLE [dbo].[ward] CHECK CONSTRAINT [FKslko72wj5nauqvsgefqkvwpsb]
GO
USE [master]
GO
ALTER DATABASE [BanHangVanPhongPham] SET  READ_WRITE 
GO
