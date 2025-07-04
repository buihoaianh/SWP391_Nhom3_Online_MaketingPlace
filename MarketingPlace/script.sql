USE [master]
GO
/****** Object:  Database [Online_Maketingplace15]    Script Date: 6/25/2025 11:15:41 PM ******/
CREATE DATABASE [Online_Maketingplace15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Maketingplace15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Online_Maketingplace15.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_Maketingplace15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Online_Maketingplace15_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Online_Maketingplace15] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Maketingplace15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Maketingplace15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Online_Maketingplace15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Maketingplace15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Maketingplace15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online_Maketingplace15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Maketingplace15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_Maketingplace15] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Maketingplace15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Maketingplace15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Maketingplace15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Maketingplace15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Maketingplace15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Maketingplace15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Online_Maketingplace15] SET QUERY_STORE = ON
GO
ALTER DATABASE [Online_Maketingplace15] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Online_Maketingplace15]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[ImageURL] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[remember_token] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[ImageURL] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountPeriod]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPeriod](
	[DiscountPeriodID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DiscountPeriod] PRIMARY KEY CLUSTERED 
(
	[DiscountPeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](255) NOT NULL,
	[DiscountType] [nvarchar](255) NOT NULL,
	[DiscountValue] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[FeedbackText] [nvarchar](255) NOT NULL,
	[Rating] [int] NOT NULL,
	[CreateFeedbackDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
	[TotalAmount] [varchar](255) NOT NULL,
	[PaymentID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageURL] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[DiscountID] [int] NULL,
	[CreateProductDate] [datetime] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [nvarchar](max) NULL,
	[ImageID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductVariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ColorId] [int] NULL,
	[SizeId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [bigint] NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerRequests]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RequestDate] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[ReviewedBy] [int] NULL,
	[ReviewDate] [datetime] NULL,
	[RejectReason] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/25/2025 11:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [RoleID], [ImageURL], [FullName], [Email], [Password], [PhoneNumber], [Address], [CreateDate], [Status], [Description], [remember_token]) VALUES (17, 2, N'https://toigingiuvedep.vn/wp-content/uploads/2021/07/mau-anh-the-dep-nam.jpeg', N'Minh Lam', N'he187170tranminhlam@gmail.com', N'$2a$10$oAnJm7bVShIfFp4W6vLauu4GFCBvq6UePrSUtAYmjD7RJuiGIfgNG', N'0378890999', N'72, Xã Quảng Tâm, Huyện Tuy Đức, Tỉnh Đắk Nông', CAST(N'2025-06-23T06:54:30.170' AS DateTime), 0, N'Nguoi ban My Pham', N'e8f0b2e8-964b-4844-a8c7-ce8a2632f4c8')
INSERT [dbo].[Account] ([AccountID], [RoleID], [ImageURL], [FullName], [Email], [Password], [PhoneNumber], [Address], [CreateDate], [Status], [Description], [remember_token]) VALUES (18, 1, NULL, N'Minh Trần', N'minhtran488930@gmail.com', N'$2a$10$oDoaXouDdSEVxtkGCbGdl.y/CXjmmkBdUuRcUmdVS.duzZI2waTH2', N'0378890999', N'72, Xã Thiện Phiến, Huyện Tiên Lữ, Tỉnh Hưng Yên', CAST(N'2025-06-23T01:49:20.867' AS DateTime), 1, N'', N'51e8e5bc-4310-4ba7-8247-b230cf18937c')
INSERT [dbo].[Account] ([AccountID], [RoleID], [ImageURL], [FullName], [Email], [Password], [PhoneNumber], [Address], [CreateDate], [Status], [Description], [remember_token]) VALUES (19, 3, NULL, N'Minh Horri', N'nguyenhaiphong518@gmail.com', N'$2a$10$ns.0P176.iOgj4dMOpoCOuLM709L2V4f1ETKpDmgURBzCv6Oynk9O', N'0978777666', N'54, Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', CAST(N'2025-06-23T04:18:59.150' AS DateTime), 1, N'', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (1, N'Dien tu', NULL, N'Thiet bi dien tu va linh kien')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (2, N'Thoi trang', NULL, N'Quan ao, giay dep va phu kien thoi trang')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (3, N'My pham', NULL, N'San pham lam dep va cham soc da')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (4, N'Đồ điện tử', N'uploads/huong_dan_cach_kinh_doanh_onl_hieu_qua-06...', N'Thiết bị điện tử và linh kiện')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (5, N'Thời trang', N'https://hmk eyewear.com/wp-content/uploads/2024/10/phu...', N'Quần áo, giày dép và phụ kiện thời trang')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (6, N'Mỹ phẩm', N'https://owa.bestprice.vn/images/articles/uploads/tu-a-z-kin...', N'Sản phẩm làm đẹp và chăm sóc da')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (7, N'Đồ nội thất', N'https://fedic.vn/wp-content/uploads/2018/07/10IKEA-18.jpg', N'Đồ nội thất trong gia đình')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (8, N'Đồ Gia Dụng', N'https://trumsiaz.com/upload/images/giad2.jpg', N'Đồ Gia Dụng Trong Gia Đình')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (9, N'Đồ chơi', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9Gc...', N'Đồ chơi cho trẻ em')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (10, N'Tủ kệ', N'uploads/mau-ke-tivi-dep-kem-tu-trang-tri-hien-dai-v3-5219...', N'Tủ kệ trong gia đình')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (11, N'Sách Vở', N'uploads/trang-web-14.webp', N'Sách vở cho học sinh và sinh viên')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ImageURL], [Description]) VALUES (12, N'Dụng cụ học tập', N'uploads/60012357_copy_3ad435fc31574bb0aea39542f1...', N'Dụng cụ học tập cho bé')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (1, N'Blue')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (2, N'White')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (3, N'Black')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (4, N'Red')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (5, N'Yellow')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (6, N'Green')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (7, N'Gray')
INSERT [dbo].[Color] ([ColorId], [ColorName]) VALUES (8, N'Pink')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountID], [DiscountName], [DiscountType], [DiscountValue], [Status], [Description]) VALUES (1, N'Summer10', N'PERCENT', N'10', 1, N'Giam 10% cho don hang mua he')
INSERT [dbo].[Discounts] ([DiscountID], [DiscountName], [DiscountType], [DiscountValue], [Status], [Description]) VALUES (2, N'Off50K', N'AMOUNT', N'50000', 1, N'Giam 50000 cho don tren 500000')
INSERT [dbo].[Discounts] ([DiscountID], [DiscountName], [DiscountType], [DiscountValue], [Status], [Description]) VALUES (3, N'Buy1Get1Drink', N'BOGO', N'1', 1, N'Mua 1 tang 1 cho tat ca cac loai do uong')
INSERT [dbo].[Discounts] ([DiscountID], [DiscountName], [DiscountType], [DiscountValue], [Status], [Description]) VALUES (4, N'Weekend15', N'PERCENT', N'15', 1, N'Giam 15% vao cuoi tuan')
INSERT [dbo].[Discounts] ([DiscountID], [DiscountName], [DiscountType], [DiscountValue], [Status], [Description]) VALUES (5, N'Welcome20', N'AMOUNT', N'20000', 1, N'Giam 20000 cho khach hang moi')
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName], [Description]) VALUES (1, N'Cash Payment', N'Thanh toan bang tien mat')
INSERT [dbo].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName], [Description]) VALUES (2, N'Online Payment', N'Thanh toan truc tuyen')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [PaymentDate], [PaymentMethodID]) VALUES (1, CAST(N'2025-06-10T10:05:00.000' AS DateTime), 2)
INSERT [dbo].[Payments] ([PaymentID], [PaymentDate], [PaymentMethodID]) VALUES (2, CAST(N'2025-06-11T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentID], [PaymentDate], [PaymentMethodID]) VALUES (3, CAST(N'2025-06-12T15:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payments] ([PaymentID], [PaymentDate], [PaymentMethodID]) VALUES (4, CAST(N'2025-06-13T09:30:00.000' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentID], [PaymentDate], [PaymentMethodID]) VALUES (5, CAST(N'2025-06-14T16:10:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [AccountID], [ProductName], [CategoryID], [DiscountID], [CreateProductDate], [Description], [Status], [ImageID]) VALUES (8, 17, N'Áo Hoodie', 2, NULL, CAST(N'2025-06-23T21:22:54.437' AS DateTime), N'đẹp', N'Active', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductVariant] ON 

INSERT [dbo].[ProductVariant] ([ProductVariantId], [ProductId], [ColorId], [SizeId], [Quantity], [Price], [Status]) VALUES (13, 8, 5, 4, 66, 200000, NULL)
SET IDENTITY_INSERT [dbo].[ProductVariant] OFF
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Customer')
GO
SET IDENTITY_INSERT [dbo].[SellerRequests] ON 

INSERT [dbo].[SellerRequests] ([RequestID], [AccountID], [RequestDate], [Status], [ReviewedBy], [ReviewDate], [RejectReason]) VALUES (9, 17, CAST(N'2025-06-23T15:00:08.793' AS DateTime), N'Reject', 17, CAST(N'2025-06-23T15:00:31.333' AS DateTime), N'dell thik
')
INSERT [dbo].[SellerRequests] ([RequestID], [AccountID], [RequestDate], [Status], [ReviewedBy], [ReviewDate], [RejectReason]) VALUES (10, 17, CAST(N'2025-06-23T15:00:43.527' AS DateTime), N'Approve', 17, CAST(N'2025-06-23T15:00:54.560' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SellerRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (1, N'S')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (2, N'M')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (3, N'L')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (5, N'XXL')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (6, N'36')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (7, N'37')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (8, N'38')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (9, N'39')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (10, N'40')
INSERT [dbo].[Size] ([SizeId], [SizeName]) VALUES (11, N'41')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SellerRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[SellerRequests] ADD  DEFAULT ('PENDING') FOR [Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Roles1]
GO
ALTER TABLE [dbo].[DiscountPeriod]  WITH CHECK ADD  CONSTRAINT [FK_DiscountPeriod_Discounts] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[DiscountPeriod] CHECK CONSTRAINT [FK_DiscountPeriod_Discounts]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payments] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payments]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductVariant]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethod] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentMethod]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Account]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Discounts] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Discounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_MainImage] FOREIGN KEY([ImageID])
REFERENCES [dbo].[ProductImages] ([ImageID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_MainImage]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Color]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Products]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Size]
GO
ALTER TABLE [dbo].[SellerRequests]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[SellerRequests]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[SellerRequests]  WITH CHECK ADD FOREIGN KEY([ReviewedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[SellerRequests]  WITH CHECK ADD FOREIGN KEY([ReviewedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [CHK_ProductVariant_Status] CHECK  (([Status]='Inactive' OR [Status]='Active'))
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [CHK_ProductVariant_Status]
GO
USE [master]
GO
ALTER DATABASE [Online_Maketingplace15] SET  READ_WRITE 
GO
