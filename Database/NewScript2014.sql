USE [master]
GO
/****** Object:  Database [BanHangVanPhongPham]    Script Date: 3/14/2022 10:50:33 PM ******/
CREATE DATABASE [BanHangVanPhongPham]
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
ALTER DATABASE [BanHangVanPhongPham] SET  DISABLE_BROKER 
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
EXEC sys.sp_db_vardecimal_storage_format N'BanHangVanPhongPham', N'ON'
GO
USE [BanHangVanPhongPham]
GO
/****** Object:  Table [dbo].[address]    Script Date: 3/14/2022 10:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [bigint] IDENTITY(1,1) NOT NULL,
	[specific_address] [nvarchar](100) NULL,
	[ward_id] [bigint] NULL,
 CONSTRAINT [PK__address__CAA247C8CCFF8FB3] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 3/14/2022 10:50:34 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poster]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_address]    Script Date: 3/14/2022 10:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_address](
	[address_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ward]    Script Date: 3/14/2022 10:50:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 
GO
INSERT [dbo].[address] ([address_id], [specific_address], [ward_id]) VALUES (1, N'1/15C kp3 tổ 38', 173)
GO
INSERT [dbo].[address] ([address_id], [specific_address], [ward_id]) VALUES (2, N'1/10D', 173)
GO
INSERT [dbo].[address] ([address_id], [specific_address], [ward_id]) VALUES (3, N'1/15F', 191)
GO
INSERT [dbo].[address] ([address_id], [specific_address], [ward_id]) VALUES (4, N'123', 94)
GO
INSERT [dbo].[address] ([address_id], [specific_address], [ward_id]) VALUES (5, N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (1, N'Thiên Long là công ty chuyên về văn phòng phẩm, dụng cụ mỹ thuật của Việt Nam. Công ty được thành lập vào năm 1981 tại thành phố Hồ Chí Minh, tiền thân là Cơ sở bút bi Thiên Long.', N'Thiên Long')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (2, NULL, N'Bizner')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (3, NULL, N'Double A')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (4, NULL, N'IK Plus')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (5, NULL, N'G-Star')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (6, NULL, N'Pronoti')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (7, NULL, N'Xukiva')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (8, NULL, N'Paper Mate')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (9, NULL, N'SAHAKA')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (10, NULL, N'Supreme')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (11, NULL, N'Ford')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (12, NULL, N'SUBARU')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (13, NULL, N'Sharpie')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (14, NULL, N'Colokit')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (15, NULL, N'Crayola')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (16, NULL, N'Flexoffice')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (17, NULL, N'Điểm 10')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (18, NULL, N'Tomy')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (19, NULL, N'CASIO')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (20, NULL, N'Vinacal')
GO
INSERT [dbo].[brand] ([brand_id], [description], [name]) VALUES (21, NULL, N'Logitech')
GO
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (7, 5, 3, 1)
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (8, 1, 3, 3)
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (9, 1, 4, 3)
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (10, 1, 9, 6)
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (11, 1, 30, 3)
GO
INSERT [dbo].[cart] ([cart_id], [quantity], [product_id], [user_id]) VALUES (12, 3, 37, 6)
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (1, N'butViet.jpg', N'Bút viết', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (2, N'giayVP.jpg', N'Giấy văn phòng', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (3, N'dungCuVP.jpg', N'Dụng cụ văn phòng', N'')
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (4, N'fileBiaHoSo.jpg', N'File bìa hồ sơ', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (5, N'dungCuHocTap.png', N'Dụng cụ học tập', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (6, N'bangKeoHoDan.png', N'Băng keo - Dao kéo - Hồ dán', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (7, N'soBiathu.jpg', N'Sổ - Bì thư', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (8, N'mayTinh.png', N'Máy tính', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (9, N'bangVP.jpg', N'Bảng văn phòng', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (10, N'baoHoLD.jpg', N'Bảo hộ lao động', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (11, N'pin.jpg', N'Pin các loại', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (12, N'giayInAnh.jpg', N'Giấy in ảnh - in màu chất lượng cao', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (13, N'PKdienThoai.jpg', N'Phụ kiện điện thoại', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (14, N'thietBiVP.jpg', N'Thiết bị văn phòng', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (15, N'thietBiDienTu.jpg', N'Thiết bị điện tử', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (16, N'myThuat.jpg', N'Mỹ thuật', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (17, N'mucIn.jpg', N'Mực in - Bơm mực', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (18, N'keRo.jpg', N'Kệ - Rổ', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (19, N'DungCuVSVP.jpg', N'Dụng cụ vệ sinh văn phòng', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (20, N'dungCuDongDau.jpg', N'Dụng cụ đóng dấu', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (21, N'anVat.jpg', N'Ăn vặt văn phòng', NULL)
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (22, N'211118231826tải xuống.jpg', N'Bút cao cấp', N'Bút viết chất lượng cao, giá cả mắc')
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (23, N'defaul.png', N'Máy tính cao cấp', N'Máy tính nước ngoài chất lượng bền bỉ, nhiều tính năng')
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (24, N'defaul.png', N'Gôm tẩy chất lượng tốt', N'Gôm tẩy chất lượng tốt, giá cả vừa phải')
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (33, N'agenda.png', N'Dụng cụ văn phòng phong cách cổ trang', N'Các sản phẩm mô phỏng theo phong cách cổ xưa')
GO
INSERT [dbo].[category] ([category_id], [image], [name], [note]) VALUES (44, N'defaul.png', N'Bút viết loại 3', N'')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[district] ON 
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (1, N'Bình Chánh', N'Huyện', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (2, N'Bình Tân', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (3, N'Bình Thạnh', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (4, N'Cần Giờ', N'Huyện', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (5, N'Củ Chi', N'Huyện', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (6, N'Gò Vấp', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (7, N'Hóc Môn', N'Huyện', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (8, N'Nhà Bè', N'Huyện', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (9, N'Phú Nhuận', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (10, N'Quận 1', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (11, N'Quận 10', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (12, N'Quận 11', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (13, N'Quận 12', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (14, N'Quận 2', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (15, N'Quận 3', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (16, N'Quận 4', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (17, N'Quận 5', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (18, N'Quận 6', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (19, N'Quận 7', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (20, N'Quận 8', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (21, N'Quận 9', N'', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (22, N'Tân Bình', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (23, N'Tân Phú', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (24, N'Thủ Đức', N'Quận', 1)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (25, N'Ba Đình', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (26, N'Ba Vì', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (27, N'Bắc Từ Liêm', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (28, N'Cầu Giấy', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (29, N'Chương Mỹ', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (30, N'Đan Phượng', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (31, N'Đông Anh', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (32, N'Đống Đa', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (33, N'Gia Lâm', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (34, N'Hà Đông', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (35, N'Hai Bà Trưng', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (36, N'Hoài Đức', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (37, N'Hoàn Kiếm', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (38, N'Hoàng Mai', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (39, N'Long Biên', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (40, N'Mê Linh', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (41, N'Mỹ Đức', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (42, N'Nam Từ Liêm', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (43, N'Phú Xuyên', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (44, N'Phúc Thọ', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (45, N'Quốc Oai', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (46, N'Sóc Sơn', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (47, N'Sơn Tây', N'Thị xã', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (48, N'Tây Hồ', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (49, N'Thạch Thất', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (50, N'Thanh Oai', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (51, N'Thanh Trì', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (52, N'Thanh Xuân', N'Quận', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (53, N'Thường Tín', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (54, N'Ứng Hòa', N'Huyện', 2)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (55, N'Cẩm Lệ', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (56, N'Hải Châu', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (57, N'Hòa Vang', N'Huyện', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (58, N'Hoàng Sa', N'Huyện', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (59, N'Liên Chiểu', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (60, N'Ngũ Hành Sơn', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (61, N'Sơn Trà', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (62, N'Thanh Khê', N'Quận', 3)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (63, N'Bàu Bàng', N'Huyện', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (64, N'Bến Cát', N'Thị xã', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (65, N'Dầu Tiếng', N'Huyện', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (66, N'Dĩ An', N'Thị xã', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (67, N'Phú Giáo', N'Huyện', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (68, N'Tân Uyên', N'Huyện', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (69, N'Thủ Dầu Một', N'Thị xã', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (70, N'Thuận An', N'Huyện', 4)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (71, N'Biên Hòa', N'Thành phố', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (72, N'Cẩm Mỹ', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (73, N'Định Quán', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (74, N'Long Khánh', N'Thị xã', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (75, N'Long Thành', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (76, N'Nhơn Trạch', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (77, N'Tân Phú', N'Quận', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (78, N'Thống Nhất', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (79, N'Trảng Bom', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (80, N'Vĩnh Cửu', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (81, N'Xuân Lộc', N'Huyện', 5)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (82, N'Cam Lâm', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (83, N'Cam Ranh', N'Thành phố', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (84, N'Diên Khánh', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (85, N'Khánh Sơn', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (86, N'Khánh Vĩnh', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (87, N'Nha Trang', N'Thành phố', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (88, N'Ninh Hòa', N'Thị xã', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (89, N'Trường Sa', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (90, N'Vạn Ninh', N'Huyện', 6)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (91, N'An Dương', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (92, N'An Lão', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (93, N'Bạch Long Vĩ', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (94, N'Cát Hải', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (95, N'Đồ Sơn', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (96, N'Dương Kinh', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (97, N'Hải An', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (98, N'Hồng Bàng', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (99, N'Kiến An', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (100, N'Kiến Thụy', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (101, N'Lê Chân', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (102, N'Ngô Quyền', N'Quận', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (103, N'Thủy Nguyên', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (104, N'Tiên Lãng', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (105, N'Vĩnh Bảo', N'Huyện', 7)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (106, N'Bến Lức', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (107, N'Cần Đước', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (108, N'Cần Giuộc', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (109, N'Châu Thành', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (110, N'Đức Hòa', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (111, N'Đức Huệ', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (112, N'Kiến Tường', N'Thị xã', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (113, N'Mộc Hóa', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (114, N'Tân An', N'Thành phố', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (115, N'Tân Hưng', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (116, N'Tân Thạnh', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (117, N'Tân Trụ', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (118, N'Thạnh Hóa', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (119, N'Thủ Thừa', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (120, N'Vĩnh Hưng', N'Huyện', 8)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (121, N'Bắc Trà My', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (122, N'Đại Lộc', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (123, N'Điện Bàn', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (124, N'Đông Giang', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (125, N'Duy Xuyên', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (126, N'Hiệp Đức', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (127, N'Hội An', N'Thành phố', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (128, N'Nam Giang', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (129, N'Nam Trà My', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (130, N'Nông Sơn', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (131, N'Núi Thành', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (132, N'Phú Ninh', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (133, N'Phước Sơn', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (134, N'Quế Sơn', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (135, N'Tam Kỳ', N'Thành phố', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (136, N'Tây Giang', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (137, N'Thăng Bình', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (138, N'Tiên Phước', N'Huyện', 9)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (139, N'Bà Rịa', N'Thị xã', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (140, N'Châu Đức', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (141, N'Côn Đảo', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (142, N'Đất Đỏ', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (143, N'Long Điền', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (144, N'Tân Thành', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (145, N'Vũng Tàu', N'Thành phố', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (146, N'Xuyên Mộc', N'Huyện', 10)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (147, N'Buôn Đôn', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (148, N'Buôn Hồ', N'Thị xã', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (149, N'Buôn Ma Thuột', N'Thành phố', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (150, N'Cư Kuin', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (151, N'Cư M''gar', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (152, N'Ea H''Leo', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (153, N'Ea Kar', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (154, N'Ea Súp', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (155, N'Krông Ana', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (156, N'Krông Bông', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (157, N'Krông Buk', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (158, N'Krông Năng', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (159, N'Krông Pắc', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (160, N'Lăk', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (161, N'M''Đrăk', N'Huyện', 11)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (162, N' Thới Lai', N'Huyện', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (163, N'Bình Thủy', N'Quận', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (164, N'Cái Răng', N'Quận', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (165, N'Cờ Đỏ', N'Huyện', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (166, N'Ninh Kiều', N'Quận', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (167, N'Ô Môn', N'Quận', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (168, N'Phong Điền', N'Huyện', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (169, N'Thốt Nốt', N'Quận', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (170, N'Vĩnh Thạnh', N'Huyện', 12)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (171, N'Bắc Bình', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (172, N'Đảo Phú Quý', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (173, N'Đức Linh', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (174, N'Hàm Tân', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (175, N'Hàm Thuận Bắc', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (176, N'Hàm Thuận Nam', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (177, N'La Gi', N'Thị xã', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (178, N'Phan Thiết', N'Thành phố', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (179, N'Tánh Linh', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (180, N'Tuy Phong', N'Huyện', 13)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (181, N'Bảo Lâm', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (182, N'Bảo Lộc', N'Thành phố', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (183, N'Cát Tiên', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (184, N'Đạ Huoai', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (185, N'Đà Lạt', N'Thành phố', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (186, N'Đạ Tẻh', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (187, N'Đam Rông', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (188, N'Di Linh', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (189, N'Đơn Dương', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (190, N'Đức Trọng', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (191, N'Lạc Dương', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (192, N'Lâm Hà', N'Huyện', 14)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (193, N'A Lưới', N'Huyện', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (194, N'Huế', N'Thành phố', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (195, N'Hương Thủy', N'Thị xã', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (196, N'Hương Trà', N'Huyện', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (197, N'Nam Đông', N'Huyện', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (198, N'Phong Điền', N'Huyện', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (199, N'Phú Lộc', N'Huyện', 15)
GO
INSERT [dbo].[district] ([district_id], [district_name], [district_prefix], [province_id]) VALUES (200, N'Phú Vang', N'Huyện', 15)
GO
SET IDENTITY_INSERT [dbo].[district] OFF
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (2, 1, N'Bút khá cute *tym*', CAST(N'2021-10-03T00:00:00.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (5, 1, N'Bút gì mà dỏm quá :<', CAST(N'2021-11-20T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (5, 3, N'Bút rất tốt, rẻ', CAST(N'2021-11-24T00:00:00.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (7, 3, N'Giấy tốt', CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (8, 3, N'Giấy tốt, rẻ', CAST(N'2021-11-24T00:00:00.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[feedback] ([id_product], [user_id], [comment], [date], [vote]) VALUES (17, 1, N'Bút tạm được', CAST(N'2021-10-20T00:00:00.0000000' AS DateTime2), 3)
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (1, CAST(6400.00 AS Numeric(18, 2)), 1, 2, 28)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (2, CAST(9000.00 AS Numeric(18, 2)), 2, 3, 17)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (3, CAST(83391.00 AS Numeric(18, 2)), 1, 4, 7)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (4, CAST(4500.00 AS Numeric(18, 2)), 2, 4, 19)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (5, CAST(317520.00 AS Numeric(18, 2)), 2, 4, 30)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (6, CAST(8300.00 AS Numeric(18, 2)), 1, 5, 2)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (7, CAST(10620.00 AS Numeric(18, 2)), 1, 5, 4)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (8, CAST(7000.00 AS Numeric(18, 2)), 2, 5, 5)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (9, CAST(78210.00 AS Numeric(18, 2)), 2, 6, 12)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (10, CAST(4500.00 AS Numeric(18, 2)), 1, 6, 19)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (11, CAST(7000.00 AS Numeric(18, 2)), 1, 11, 5)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (12, CAST(83391.00 AS Numeric(18, 2)), 1, 11, 7)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (13, CAST(138600.00 AS Numeric(18, 2)), 1, 11, 9)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (14, CAST(10620.00 AS Numeric(18, 2)), 4, 12, 4)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (15, CAST(72941.00 AS Numeric(18, 2)), 1, 12, 8)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (16, CAST(40500.00 AS Numeric(18, 2)), 1, 13, 6)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (17, CAST(86080.80 AS Numeric(18, 2)), 1, 13, 34)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (18, CAST(72941.00 AS Numeric(18, 2)), 1, 14, 8)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (19, CAST(702000.00 AS Numeric(18, 2)), 10, 14, 23)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (20, CAST(83391.00 AS Numeric(18, 2)), 2, 15, 7)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (21, CAST(138600.00 AS Numeric(18, 2)), 1, 16, 9)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (22, CAST(45000.00 AS Numeric(18, 2)), 1, 17, 14)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (23, CAST(40500.00 AS Numeric(18, 2)), 1, 18, 6)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (24, CAST(702000.00 AS Numeric(18, 2)), 1, 18, 23)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (25, CAST(7000.00 AS Numeric(18, 2)), 5, 19, 5)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (26, CAST(40500.00 AS Numeric(18, 2)), 1, 19, 6)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (27, CAST(220763.40 AS Numeric(18, 2)), 1, 20, 35)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (28, CAST(86000.00 AS Numeric(18, 2)), 2, 20, 36)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (29, CAST(950.00 AS Numeric(18, 2)), 5, 21, 37)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (30, CAST(83391.00 AS Numeric(18, 2)), 1, 22, 7)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (31, CAST(138600.00 AS Numeric(18, 2)), 1, 22, 9)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (32, CAST(40500.00 AS Numeric(18, 2)), 2, 23, 6)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (33, CAST(7000.00 AS Numeric(18, 2)), 1, 24, 5)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (34, CAST(863000.00 AS Numeric(18, 2)), 1, 25, 26)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (35, CAST(6400.00 AS Numeric(18, 2)), 1, 25, 28)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (36, CAST(381600.00 AS Numeric(18, 2)), 1, 25, 32)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (37, CAST(8300.00 AS Numeric(18, 2)), 3, 26, 2)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (38, CAST(138600.00 AS Numeric(18, 2)), 2, 27, 9)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (39, CAST(4500.00 AS Numeric(18, 2)), 1, 27, 17)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (40, CAST(4500.00 AS Numeric(18, 2)), 1, 27, 19)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (41, CAST(72941.00 AS Numeric(18, 2)), 2, 28, 8)
GO
INSERT [dbo].[order_detail] ([id], [price], [quantity], [order_id], [product_id]) VALUES (42, CAST(138600.00 AS Numeric(18, 2)), 1, 28, 9)
GO
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (1, N'Chờ xử lý')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (2, N'Yêu cầu hủy')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (3, N'Đang giao')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (4, N'Đã giao')
GO
INSERT [dbo].[order_status] ([status_id], [description]) VALUES (5, N'Đã hủy')
GO
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (2, CAST(N'2021-10-02T00:00:00.0000000' AS DateTime2), 6400, 4, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (3, CAST(N'2021-10-02T00:00:00.0000000' AS DateTime2), 9000, 4, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (4, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 727431, 5, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (5, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 32920, 3, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (6, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 160920, 3, 3)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (11, CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 228991, 5, 3)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (12, CAST(N'2021-11-20T00:00:00.0000000' AS DateTime2), 115421, 5, 3)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (13, CAST(N'2021-11-20T00:00:00.0000000' AS DateTime2), 126580.8, 3, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (14, CAST(N'2021-11-20T00:00:00.0000000' AS DateTime2), 7092941, 4, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (15, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2), 83391, 3, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (16, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2), 138600, 3, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (17, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2), 45000, 3, 6)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (18, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2), 742500, 5, 6)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (19, CAST(N'2021-11-21T00:00:00.0000000' AS DateTime2), 75500, 5, 6)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (20, CAST(N'2021-11-22T00:00:00.0000000' AS DateTime2), 392763.4, 3, 6)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (21, CAST(N'2021-11-22T00:00:00.0000000' AS DateTime2), 4750, 3, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (22, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2), 221991, 3, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (23, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2), 81000, 3, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (24, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2), 7000, 4, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (25, CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2), 1251000, 1, 5)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (26, CAST(N'2021-11-24T00:00:00.0000000' AS DateTime2), 24900, 2, 1)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (27, CAST(N'2021-12-08T00:00:00.0000000' AS DateTime2), 286200, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [date], [total_price], [status_id], [user_id]) VALUES (28, CAST(N'2021-12-11T00:00:00.0000000' AS DateTime2), 284482, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[poster] ON 
GO
INSERT [dbo].[poster] ([id], [is_active], [name], [type]) VALUES (1, 1, N'poster10.jpg', 1)
GO
INSERT [dbo].[poster] ([id], [is_active], [name], [type]) VALUES (2, 1, N'poster11.jpg', 1)
GO
INSERT [dbo].[poster] ([id], [is_active], [name], [type]) VALUES (3, 1, N'poster15.jpg', 1)
GO
INSERT [dbo].[poster] ([id], [is_active], [name], [type]) VALUES (4, 1, N'poster14.jpg', 2)
GO
SET IDENTITY_INSERT [dbo].[poster] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (2, N'cây', N'Nét viết trơn, êm, mực ra đều và liên tục.
Không độc hại, tiện dụng khi sử dụng.
 Mực hệ nước, hệ màu dye.', 0, N'fo-gel18_vn_tim_71669d93f8d04bf498bbf73b7ab162e5_1024x1024.jpg', N'Bút gel 2 viên bi Thiên Long Flexoffice FO-GEL18/VN - Mực nước, đậm, tươi', CAST(8300.00 AS Numeric(18, 2)), 30, 1, N'1 bút/ kiện.', 1, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (3, N'cây', N'Để nơi thoáng mát, tránh nguồn nhiệt. Không thích hợp cho trẻ dưới 3 tuổi.', 0, N'fo-039_plus_vn_4mc_4_ae40e120115b48d4ae2a85e09a47d53a_1024x1024.jpg', N'Bút bi Thiên Long Flexoffice FO-039 PLUS/VN 4MC - Mực đạt tiêu chuẩn châu Âu', CAST(4600.00 AS Numeric(18, 2)), 30, 0, N'1 bút/ kiện.', 1, 16, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (4, N'cây', N'Dạng bút có nắp đậy. Bút dạng mực nước, viết trơn êm, mực ra đều, liên tục. Mực chất lượng cao không độc hại với người sử dụng. Bút có 2 gôm/tẩy trên cán và nắp bút thuận tiện sử dụng khi xóa mực.', 10, N'220536693_2758032537653829_5778804089958025826_n_1__ac9f66a0e2ec4ff0a57d832ca9e12ff5_1024x1024.jpg', N'Bút gel xóa được Thiên Long Điểm 10 TP-GELE002', CAST(11800.00 AS Numeric(18, 2)), 40, 1, N'5 cây / 1 kiện', 1, 17, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (5, N'cây', N'Bút có thiết kế đơn giản nhưng khoa học, thân tròn, nhỏ rất phù hợp với tay cầm của học sinh tiểu học. Thân và nắp bút bằng nhựa trắng đục, in nhũ kim loại. Mực màu đậm và tươi sáng, viết êm trơn, ra đều và liên tục.', 0, N'but_gel_thien_long_gel-012__14__grande.jpg', N'Bút Gel Thiên Long GEL-012 Đỏ (FS)', CAST(7000.00 AS Numeric(18, 2)), 35, 3, N'1 bút/ kiện.', 1, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (6, N'hộp', NULL, 10, N'ppmate_os_upc_0.5_2_5b8dbcaf15eb47dba2b5b6596fc146cd_1024x1024.jpg', N'Bút Gel Papermate OS UPC Ink Joy 0.5 mm', CAST(45000.00 AS Numeric(18, 2)), 40, 3, N'5 cây / hộp', 1, 8, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (7, N'ream', N'Giấy đều màu. Không gợn sóng, không xơ xước và không tách lớp. Giấy láng, không bị đốm khác màu hay tạp chất xơ cứng. Chữ in không bị nhòe, không lem kể cả in 2 mặt giấy.', 5, N'ik_copy_a480_ton_kho2_dac0ed5096a9416fa0b5fb1cfb6b00ad_1024x1024.jpg', N'Ream giấy A4 80 gsm IK Copy (500 tờ) - Hàng nhập khẩu Indonesia', CAST(87780.00 AS Numeric(18, 2)), 50, 3, N'	500 tờ / ream', 1, 4, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (8, N'ream', N'Giấy đều màu. Không gợn sóng, không xơ xước và không tách lớp. Giấy láng, không bị đốm khác màu hay tạp chất xơ cứng. Chữ in không bị nhòe, không lem kể cả in 2 mặt giấy.', 5, N'ik_copy_a470_ton_kho2_5772a8166e324ee8b8eb76723a68e169_1024x1024.jpg', N'Ream giấy A4 70 gsm IK Copy (500 tờ) - Hàng nhập khẩu Indonesia', CAST(76780.00 AS Numeric(18, 2)), 50, 1, N'500 tờ / ream', 1, 4, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (9, N'kiện', N'Dùng in tem, nhãn sản phẩm bằng máy laser thông thường. Có nhiều kích cỡ khác nhau, phù hợp mọi nhu cầu sử dụng. Chất giấy đẹp, mịn, láng.', 10, N'giay_dan_nhan_tomy_a4_du_so_9635a65db4fd4e8e99b0b2ce25838e1d_1024x1024.jpg', N'Giấy dán nhãn Tomy A4 đủ số', CAST(154000.00 AS Numeric(18, 2)), 40, 2, N'	100 tờ/ hộp/ kiện', 1, 18, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (11, N'kiện', N'Dùng in tem, nhãn sản phẩm bằng máy laser thông thường. Có nhiều kích cỡ khác nhau, phù hợp mọi nhu cầu sử dụng. Chất giấy đẹp, mịn, láng.', 10, N'giay_dan_nhan_tomy_a5_du_so_2_eee2b9a4d2024fa0970cf14b5177e781_1024x1024.jpg', N'Giấy dán nhãn Tomy A5 đủ số', CAST(10000.00 AS Numeric(18, 2)), 60, 0, N'10 tờ/ xấp/ kiện', 1, 18, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (12, N'ream', N'Giấy in văn phòng chất lượng cao , bề mặt nhẵn tuyệt vời , mau khô mực , thích hợp cho các loại máy in phun , máy in laser , máy fax laser , máy photocopy… Giấy không bị bụi giúp kéo dài tuổi thọ các thiết bị in , photocopy . Giấy in Thiên Long được sản xuất và đóng gói theo tiêu chuẩn, dây chuyền thiết bị hiện đại, chuyên dung trong các văn phòng, công ty , trường học. Với khả năng đáp ứng in ấn , photocopy tốt. Thùng giấy được làm từ chất liệu tốt , tiện lợi cho việc vận chuyển và tái sử dụng vào việc lưu trữ tài liệu văn phòng.', 10, N'mo_ta_giay_fa-13_675bf3a33cfd486099a82e383d103d67_grande.jpg', N'Giấy photo A4 70 Thiên Long PP-001', CAST(86900.00 AS Numeric(18, 2)), 30, 2, N'500 tờ / ream', 1, 1, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (13, N'xấp', N'Bìa giấy màu trơn, không hoa văn, không mùi, dùng đóng bìa hồ sơ, tài liệu theo khổ A4 với nhiều màu lựa chọn. Màu sắc trung thực và sống động. Công nghệ mới làm giấy trông mỏng nhưng thực tế giấy đã được nén chặt hơn, làm bề mặt của giấy nhẵn, đều hơn. Chất lượng: Đẹp, trắng, mịn, láng.', 0, N'giay_bia_mau_a4-180_bc-c01__4__grande.jpg', N'Giấy bìa màu A4/180 BC-C01', CAST(43000.00 AS Numeric(18, 2)), 50, 0, N'100 tờ/xấp', 1, 10, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (14, N'lốc', N'Giúp các bạn quản lý tổ chức kế hoạch trong thời gian dài hạn. Tiện lợi cho việc mang theo mọi lúc mọi nơi. Ngay cả trong những lúc bận rộn nhất bạn cũng có thể ghi chú 1 cách dễ dàng. Gồm nhiều tờ trong 1 xấp. Chất lượng : Đẹp, mịn, láng. ', 0, N'abl_4183_grande.jpg', N'Giấy note Xukiva177 N-X02', CAST(45000.00 AS Numeric(18, 2)), 40, 1, N'12 xấp/lốc', 1, 7, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (16, N'hộp', N'Giấy cảm nhiệt, mặt không nhiệt được quấn bên trong, mặt nhiệt được quấn ra ngoài. Đường kính trong lõi 27 mm, gói giấy bạc cách nhiệt, dán tem hai đầu, có màng co.', 0, N'abl_5400_grande.jpg', N'Giấy than G-Star 21x33 CP-G01 XANH', CAST(73000.00 AS Numeric(18, 2)), 40, 0, N'100 tờ/hộp', 1, 5, 2)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (17, N'chiếc', N'Kẹp giấy Thiên Long FO-PAC01 (25mm) có đầu tam giác, đầu tròn. Sản xuất từ kim loại có chất lượng cao, được phủ lớp niken chống gỉ. Có thể giữ được 10 tờ giấy A4', 10, N'617__1__grande.jpg', N'Kẹp giấy Flexoffice FO-PAC01', CAST(5000.00 AS Numeric(18, 2)), 40, 2, N'	10 hộp/hộp lớn', 1, 16, 3)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (18, N'hộp', N'Kim bấm giấy là sản phẩm được làm từ thép cao cấp, giúp liên kết các tài liệu văn bản lại với nhau. Kim bấm có độ cứng cao, sáng bóng và không bị gỉ sét theo thời gian. Dễ dàng sử dụng và thân thiên với người dùng', 0, N'651__5__grande.jpg', N'Kim bấm số 3 Flexoffice FO-STS01', CAST(5000.00 AS Numeric(18, 2)), 30, 0, N'20 hộp/hộp lớn', 1, 16, 3)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (19, N'cái', N'Bìa bằng nhựa PP chịu lực cao. Đường hàn chắc chắn, nút bền hơn.', 10, N'fo-cbf08_xk3_97ef69dd7dc84a91be7151a4a3991f5e_1024x1024.jpg                                                                                                                                                                                                                                                 ', N'Bìa nút trong suốt nhiều màu F4 Thiên Long Flexoffice FO-CBF08', CAST(5000.00 AS Numeric(18, 2)), 30, 1, N'1 bìa / kiện', 1, 16, 4)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (21, N'cái', N'Để lưu trữ và bảo quản các loại hồ sơ, tài liệu, tranh ảnh... Bìa 60 lá thích hợp cho gia đình, văn phòng: lưu trữ các loại giấy tờ nhà đất, giấy bảo hiểm, hóa đơn, giấy bảo hành… Sản phẩm được sản xuất từ nhựa PP chất lượng cao, an toàn với người sử dụng, sản phẩm có thể được tái chế hoàn toàn. Bề mặt trơn láng, hạn chế trầy xước và bám bẩn. Các lá được hàn trên công nghệ hàn siêu âm, có khả năng chịu ứng suất kéo cao.', 10, N'fo-db009_2_af0b93f66f03446f98c05ef449beb913_1024x1024.jpg', N'Bìa đựng hồ sơ 60 lá sức chứa 300 tờ A4 80 gsm Thiên Long Flexoffice FO-DB009', CAST(7000.00 AS Numeric(18, 2)), 30, 0, N'bút/kiện', 1, 16, 4)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (23, N'chiếc', N'Không phải ngẫu nhiên mà máy tính CASIO FX 570ES PLUS được rất nhiều học sinh, sinh viên ưa thích đến vậy. Máy sở hữu kiểu dáng hiện đại, màu sắc trang nhã tinh tế cùng với danh sách các tính năng hữu ích, hỗ trợ tối đa trong quá trình học tập cũng như làm việc. Chiếc máy CASIO FX 570 ES PLUS là sản phẩm phù hợp với các bạn học sinh trung học.', 0, N'casio.png', N'Máy tính Casio FX-570ES Plus', CAST(702000.00 AS Numeric(18, 2)), 30, 10, NULL, 1, 19, 8)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (25, N'chiếc', NULL, 3, N'vinacal-570ex-plus-hong.jpg', N'MÁY TÍNH VINACAL 570ES PLUS - HỒNG', CAST(1008000.00 AS Numeric(18, 2)), 30, 0, NULL, 1, 20, 8)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (26, N'chiếc', N' Phím bấm của máy tính khoa học Vinacal 570ES Plus II rất nhạy. Tính năng vượt trội hơn, tiện lợi hơn, màu sắc thời trang. Kiểu dáng hoàn toàn mới, góc cạnh, hiện đại.', 0, N'63_60029_vinacal-570es-plus-ii-xanh-duo.jpg', N'Máy tính VINACAL 570 ES PLUS II - Xanh', CAST(863000.00 AS Numeric(18, 2)), 30, 0, NULL, 1, 20, 8)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (27, N'cây', N' Lưỡi kéo được làm bằng kim loại cao cấp, sắc bén, cho đường cắt dứt khoát và đẹp mắt. Tay cầm kéo được bọc nhựa êm ái, tránh làm đau tay khi thao tác nhiều.', 0, N'20210220153305-4.jpg', N'Kéo lớn 25cm - K20', CAST(34200.00 AS Numeric(18, 2)), 30, 0, NULL, 1, 17, 6)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (28, N'cục', N'Gôm Pentel H.03. Đặc điểm: Gôm/tẩy sử dụng cho việc bôi xóa trên giấy và màng film. Gôm/tẩy được bọc giấy bảo vệ bên ngoài nên hạn chế dơ khi sử dụng chưa hết.', 0, N'unnamed.jpg', N'Gôm Pentel Nhỏ 03 - Loại 1', CAST(6400.00 AS Numeric(18, 2)), 30, 1, NULL, 1, 1, 3)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (30, N'cái', N'Mang phong cách năng động, thể thao với những đường bo tròn mềm mại. Bề mặt độ cong vừa phải ôm sát lòng bàn tay để người dùng có thể thao tác thoải mái trong thời gian dài. Giúp bạn lướt chuột nhanh và nhẹ nhàng hơn. Đồng thời, bi lăn và nút bấm nhạy cho các thao tác như rê, kéo có được độ chính xác cao.', 10, N'unnamed (1).jpg', N'Chuột máy tính không dây Logitech B175', CAST(352800.00 AS Numeric(18, 2)), 50, 0, NULL, 1, 21, 14)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (32, N'miếng', N'Đế Tản Nhiệt 4 Quạt', 0, N'32036chuột-Đế Tản Nhiệt 4 Quạt 265000.jpg', N'Đế Tản Nhiệt 4 Quạt', CAST(381600.00 AS Numeric(18, 2)), 20, 0, NULL, 1, 21, 14)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (34, N'cây', N'Chổi quét máy tính', 11, N'choi-quet-may-tinh.jpg', N'Chổi vệ sinh bàn phím', CAST(96720.00 AS Numeric(18, 2)), 40, 1, NULL, 1, 9, 3)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (35, N'hộp', N'Hộp bút vải có khóa mật mã 20x6x8cm', 17, N'hopbuttim.png', N'Hộp bút vải có khóa mật mã 20x6x8cm', CAST(265980.00 AS Numeric(18, 2)), 30, 1, NULL, 1, 17, 5)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (36, N'túi', N'Dừng ở đây một chút rùi mình ngắm TÚI BÚT!!! Ui chùi túi bút xinh nung ninh như này hông chỉ là ngắm thui đâu mà còn phải hốt lẹ lun nhé! Đi học hay đi làm đem túi bút là tiện nhất rùi. Đựng đồ dùng học tập hay đồ mỹ phẩm be bé xinh xinh vừa như in lun ạ!', 0, N'5_800x800.jpg', N'Túi đựng bút vải đính huy hiệu Maimaibaby', CAST(86000.00 AS Numeric(18, 2)), 50, 12, NULL, 1, 17, 5)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (37, N'cái', N'Bút test', 5, N'default.png', N'test 1', CAST(1000.00 AS Numeric(18, 2)), 15, 5, N'bút/kiện', 1, 1, 1)
GO
INSERT [dbo].[product] ([product_id], [calculation_unit], [description], [discount], [image], [name], [price], [quantity], [sold_quantity], [specification], [status], [brand_id], [category_id]) VALUES (38, N'hộp', N'Bút màu chất lượng cao', 0, N'2111241445200000282-hop-but-mau.jpg', N'Bút màu', CAST(7000.00 AS Numeric(18, 2)), 30, 0, N'bút/kiện', 0, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[province] ON 
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (1, N'SG', N'Hồ Chí Minh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (2, N'HN', N'Hà Nội')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (3, N'DDN', N'Đà Nẵng')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (4, N'BD', N'Bình Dương')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (5, N'DNA', N'Đồng Nai')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (6, N'KH', N'Khánh Hòa')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (7, N'HP', N'Hải Phòng')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (8, N'LA', N'Long An')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (9, N'QNA', N'Quảng Nam')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (10, N'VT', N'Bà Rịa Vũng Tàu')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (11, N'DDL', N'Đắk Lắk')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (12, N'CT', N'Cần Thơ')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (13, N'BTH', N'Bình Thuận  ')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (14, N'LDD', N'Lâm Đồng')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (15, N'TTH', N'Thừa Thiên Huế')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (16, N'KG', N'Kiên Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (17, N'BN', N'Bắc Ninh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (18, N'QNI', N'Quảng Ninh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (19, N'TH', N'Thanh Hóa')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (20, N'NA', N'Nghệ An')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (21, N'HD', N'Hải Dương')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (22, N'GL', N'Gia Lai')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (23, N'BP', N'Bình Phước')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (24, N'HY', N'Hưng Yên')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (25, N'BDD', N'Bình Định')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (26, N'TG', N'Tiền Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (27, N'TB', N'Thái Bình')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (28, N'BG', N'Bắc Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (29, N'HB', N'Hòa Bình')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (30, N'AG', N'An Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (31, N'VP', N'Vĩnh Phúc')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (32, N'TNI', N'Tây Ninh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (33, N'TN', N'Thái Nguyên')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (34, N'LCA', N'Lào Cai')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (35, N'NDD', N'Nam Định')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (36, N'QNG', N'Quảng Ngãi')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (37, N'BTR', N'Bến Tre')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (38, N'DNO', N'Đắk Nông')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (39, N'CM', N'Cà Mau')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (40, N'VL', N'Vĩnh Long')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (41, N'NB', N'Ninh Bình')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (42, N'PT', N'Phú Thọ')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (43, N'NT', N'Ninh Thuận')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (44, N'PY', N'Phú Yên')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (45, N'HNA', N'Hà Nam')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (46, N'HT', N'Hà Tĩnh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (47, N'DDT', N'Đồng Tháp')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (48, N'ST', N'Sóc Trăng')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (49, N'KT', N'Kon Tum')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (50, N'QB', N'Quảng Bình')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (51, N'QT', N'Quảng Trị')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (52, N'TV', N'Trà Vinh')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (53, N'HGI', N'Hậu Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (54, N'SL', N'Sơn La')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (55, N'BL', N'Bạc Liêu')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (56, N'YB', N'Yên Bái')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (57, N'TQ', N'Tuyên Quang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (58, N'DDB', N'Điện Biên')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (59, N'LCH', N'Lai Châu')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (60, N'LS', N'Lạng Sơn')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (61, N'HG', N'Hà Giang')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (62, N'BK', N'Bắc Kạn')
GO
INSERT [dbo].[province] ([province_id], [province_code], [province_name]) VALUES (63, N'CB', N'Cao Bằng')
GO
SET IDENTITY_INSERT [dbo].[province] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'ROLE_USER')
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'ROLE_ADMIN')
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'ROLE_MODERATOR')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[user_address] ([address_id], [user_id]) VALUES (1, 1)
GO
INSERT [dbo].[user_address] ([address_id], [user_id]) VALUES (2, 2)
GO
INSERT [dbo].[user_address] ([address_id], [user_id]) VALUES (3, 3)
GO
INSERT [dbo].[user_address] ([address_id], [user_id]) VALUES (4, 5)
GO
INSERT [dbo].[user_address] ([address_id], [user_id]) VALUES (5, 6)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 1)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 2)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 3)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (2, 2)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (3, 1)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (3, 2)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (5, 1)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (5, 2)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (6, 1)
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (6, 2)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [email], [first_name], [image], [last_name], [password], [phone], [status], [username]) VALUES (1, N'quan.vn@gmail.com', N'Quân', N'Defaul.png', N'Đậu Trường', N'$2a$10$J0M/ffrs24ARFPUnmqGpi.slYmQXEJ85fjtiU4q0aeaauhV.q3dWq', N'0935856510', 1, N'anhyeuem')
GO
INSERT [dbo].[users] ([id], [email], [first_name], [image], [last_name], [password], [phone], [status], [username]) VALUES (2, N'reintrinh1306@gmail.com', N'Trinh', N'Defaul.png', N'Nguyễn Ngọc Phương', N'$2a$10$h6PhySSEDqk46Fu/UrWube/CmPRCsCYkh7p/iEvpl.AypIXxzJX2O', N'0396311734', 1, N'reintrinh')
GO
INSERT [dbo].[users] ([id], [email], [first_name], [image], [last_name], [password], [phone], [status], [username]) VALUES (3, N'hathimo@gmail.com', N'Mơ', N'Defaul.png', N'Hà Thị', N'$2a$10$j6tKHaZT.ivt3n4KSm//NOsKh1rHkUt/HE64qP5mFiV3.8XFcOUYO', N'0123456789', 1, N'hathimo')
GO
INSERT [dbo].[users] ([id], [email], [first_name], [image], [last_name], [password], [phone], [status], [username]) VALUES (5, N'phuc@gmail.com', N'Phúc', N'Defaul.png', N'Phạm Đức Phú', N'$2a$10$/.bT7XFBHceICaRDX.FciuSCvg8HYE4WfnclA7.3YK2goIWyMWXrq', N'0123456780', 1, N'phuc')
GO
INSERT [dbo].[users] ([id], [email], [first_name], [image], [last_name], [password], [phone], [status], [username]) VALUES (6, N'tieuhocat2012@gmail.com', NULL, N'Defaul.png', NULL, N'$2a$10$NqFFTKvSd/tfO91oW3E2f.hJj7nZvTYtUE9V5HFrImCvBRO5DcqYu', N'0123456781', 1, N'nhinguyen')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[ward] ON 
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (1, N'An Phú Tây', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (2, N'Bình Chánh', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (3, N'Bình Hưng', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (4, N'Bình Lợi', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (5, N'Đa Phước', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (6, N'Hưng Long', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (7, N'Lê Minh Xuân', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (8, N'Phạm Văn Hai', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (9, N'Phong Phú', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (10, N'Quy Đức', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (11, N'Tân Kiên', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (12, N'Tân Nhựt', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (13, N'Tân Quý Tây', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (14, N'Tân Túc', N'Thị trấn', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (15, N'Vĩnh Lộc A', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (16, N'Vĩnh Lộc B', N'Xã', 1)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (17, N'An Lạc', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (18, N'An Lạc A', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (19, N'Bình Hưng Hòa', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (20, N'Bình Hưng Hòa A', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (21, N'Bình Hưng Hòa B', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (22, N'Bình Trị Đông', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (23, N'Bình Trị Đông A', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (24, N'Bình Trị Đông B', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (25, N'Tân Tạo', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (26, N'Tân Tạo A', N'Phường', 2)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (27, N'1', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (28, N'11', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (29, N'12', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (30, N'13', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (31, N'14', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (32, N'15', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (33, N'17', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (34, N'19', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (35, N'2', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (36, N'21', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (37, N'22', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (38, N'24', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (39, N'25', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (40, N'26', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (41, N'27', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (42, N'28', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (43, N'3', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (44, N'5', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (45, N'6', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (46, N'7', N'Phường', 3)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (47, N'An Thới Đông', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (48, N'Bình Khánh', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (49, N'Cần Thạnh ', N'Phường', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (50, N'Long Hòa', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (51, N'Lý Nhơn', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (52, N'Tam Thôn Hiệp', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (53, N'Thạnh An', N'Xã', 4)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (54, N'An Nhơn Tây', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (55, N'An Phú', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (56, N'An Phú Trung', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (57, N'Bình Mỹ', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (58, N'Củ Chi', N'Thị trấn', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (59, N'Hòa Phú', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (60, N'Nhuận Đức', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (61, N'Phạm Văn Cội', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (62, N'Phú Hòa Đông', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (63, N'Phú Mỹ Hưng', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (64, N'Phước Hiệp', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (65, N'Phước Thạnh', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (66, N'Phước Vĩnh An', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (67, N'Tân An Hội', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (68, N'Tân Phú Trung', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (69, N'Tân Thạnh Đông', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (70, N'Tân Thạnh Tây', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (71, N'Tân Thông Hội', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (72, N'Thái Mỹ', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (73, N'Trung An', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (74, N'Trung Lập Hạ', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (75, N'Trung Lập Hạ', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (76, N'Trung Lập Thượng', N'Xã', 5)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (77, N'1', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (78, N'10', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (79, N'11', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (80, N'12', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (81, N'13', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (82, N'14', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (83, N'15', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (84, N'16', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (85, N'17', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (86, N'3', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (87, N'4', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (88, N'5', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (89, N'6', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (90, N'7', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (91, N'8', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (92, N'9', N'Phường', 6)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (93, N' Đông Thạnh', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (94, N' Hóc Môn', N'Phường', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (95, N'Bà Điểm', N'Phường', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (96, N'Nhị Bình', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (97, N'Tân Hiệp', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (98, N'Tân Thới Nhì', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (99, N'Tân Xuân', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (100, N'Thới Tam Thôn', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (101, N'Trung Chánh', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (102, N'Xuân Thới Đông', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (103, N'Xuân Thới Sơn', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (104, N'Xuân Thới Thượng', N'Xã', 7)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (105, N'Hiệp Phước', N'Phường', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (106, N'Long Thới', N'Xã', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (107, N'Nhà Bè', N'Thị trấn', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (108, N'Nhơn Đức', N'Xã', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (109, N'Phú Xuân', N'Xã', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (110, N'Phước Kiển', N'Xã', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (111, N'Phước Lộc', N'Xã', 8)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (112, N'1', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (113, N'10', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (114, N'11', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (115, N'12', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (116, N'13', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (117, N'14', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (118, N'15', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (119, N'17', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (120, N'2', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (121, N'25', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (122, N'3', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (123, N'4', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (124, N'5', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (125, N'6', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (126, N'7', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (127, N'8', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (128, N'9', N'Phường', 9)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (129, N'Bến Nghé', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (130, N'Bến Thành', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (131, N'Cầu Kho', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (132, N'Cầu Ông Lãnh', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (133, N'Cô Giang', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (134, N'Đa Kao', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (135, N'Nguyễn Cư Trinh', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (136, N'Nguyễn Thái Bình', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (137, N'Phạm Ngũ Lão', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (138, N'Tân Định', N'Phường', 10)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (139, N'1', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (140, N'10', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (141, N'11', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (142, N'12', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (143, N'13', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (144, N'14', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (145, N'15', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (146, N'2', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (147, N'3', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (148, N'4', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (149, N'5', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (150, N'6', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (151, N'7', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (152, N'8', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (153, N'9', N'Phường', 11)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (154, N'1', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (155, N'10', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (156, N'11', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (157, N'12', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (158, N'13', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (159, N'14', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (160, N'15', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (161, N'16', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (162, N'2', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (163, N'3', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (164, N'4', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (165, N'5', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (166, N'6', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (167, N'7', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (168, N'8', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (169, N'9', N'Phường', 12)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (170, N'An Phú Đông', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (171, N'Đông Hưng Thuận', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (172, N'Hiệp Thành', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (173, N'Tân Chánh Hiệp', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (174, N'Tân Hưng Thuận', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (175, N'Tân Thới Hiệp', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (176, N'Tân Thới Nhất', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (177, N'Thạnh Lộc', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (178, N'Thạnh Xuân', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (179, N'Thới An', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (180, N'Trung Mỹ Tây', N'Phường', 13)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (181, N' Thạnh Mỹ Lợi', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (182, N'An Khánh', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (183, N'An Lợi Đông', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (184, N'An Phú', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (185, N'Bình An', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (186, N'Bình Khánh', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (187, N'Bình Trưng Đông', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (188, N'Bình Trưng Tây', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (189, N'Cát Lái', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (190, N'Thảo Điền', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (191, N'Thủ Thiêm', N'Phường', 14)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (192, N'1', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (193, N'10', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (194, N'11', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (195, N'12', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (196, N'13', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (197, N'14', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (198, N'2', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (199, N'3', N'Phường', 15)
GO
INSERT [dbo].[ward] ([ward_id], [ward_name], [ward_prefix], [district_id]) VALUES (200, N'4', N'Phường', 15)
GO
SET IDENTITY_INSERT [dbo].[ward] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_6dotkott2kjsp8vw4d0m25fb7]    Script Date: 3/14/2022 10:50:34 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_du5v5sr43g5bfnji4vb8hg5s3]    Script Date: 3/14/2022 10:50:34 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_du5v5sr43g5bfnji4vb8hg5s3] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK6dotkott2kjsp8vw4d0m25fb7]    Script Date: 3/14/2022 10:50:34 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKr43af9ap4edm43mmtq01oddj6]    Script Date: 3/14/2022 10:50:34 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UKr43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [FKdaaxogn1ss81gkcsdn05wi6jp] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [FKdaaxogn1ss81gkcsdn05wi6jp]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [FKrmincuqpi8m660j1c57xj7twr] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [FKrmincuqpi8m660j1c57xj7twr]
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
