USE [master]
GO
/****** Object:  Database [PetShop]    Script Date: 5/29/2024 11:43:38 AM ******/
CREATE DATABASE [PetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetShop_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PetShop] SET  MULTI_USER 
GO
ALTER DATABASE [PetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetShop', N'ON'
GO
ALTER DATABASE [PetShop] SET QUERY_STORE = OFF
GO
USE [PetShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [nvarchar](max) NOT NULL,
	[Dog_item_id] [int] NOT NULL,
	[Date] [nvarchar](max) NOT NULL,
	[Hour] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Phone_number] [nvarchar](max) NOT NULL,
	[User_name] [nvarchar](max) NOT NULL,
	[Service] [nvarchar](max) NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Is_cancel] [bit] NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[VerificationToken] [nvarchar](max) NULL,
	[VerifiedAt] [datetime2](7) NULL,
	[PasswordResetToken] [nvarchar](max) NULL,
	[ResetTokenExpires] [datetime2](7) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [nvarchar](450) NOT NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](450) NULL,
	[ProductItemId] [int] NULL,
	[DogItemId] [int] NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[CartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetailDogItem]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetailDogItem](
	[cartDetailsCartDetailId] [int] NOT NULL,
	[dogItemsDogItemId] [int] NOT NULL,
 CONSTRAINT [PK_CartDetailDogItem] PRIMARY KEY CLUSTERED 
(
	[cartDetailsCartDetailId] ASC,
	[dogItemsDogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetailDogProductItem]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetailDogProductItem](
	[cartDetailsCartDetailId] [int] NOT NULL,
	[dogProductItemsDogProductItemId] [int] NOT NULL,
 CONSTRAINT [PK_CartDetailDogProductItem] PRIMARY KEY CLUSTERED 
(
	[cartDetailsCartDetailId] ASC,
	[dogProductItemsDogProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checkout]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [nvarchar](max) NOT NULL,
	[Total] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Payment] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Checkout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [nvarchar](max) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[IsAccept] [bit] NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogItem]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogItem](
	[DogItemId] [int] IDENTITY(1,1) NOT NULL,
	[DogName] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[Sex] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Origin] [nvarchar](max) NOT NULL,
	[HealthStatus] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Images] [nvarchar](max) NULL,
	[IsInStock] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DogSpeciesId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_DogItem] PRIMARY KEY CLUSTERED 
(
	[DogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogProductItem]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogProductItem](
	[DogProductItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Images] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[IsInStock] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_DogProductItem] PRIMARY KEY CLUSTERED 
(
	[DogProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogSpecies]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogSpecies](
	[DogSpeciesId] [int] IDENTITY(1,1) NOT NULL,
	[DogSpeciesName] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_DogSpecies] PRIMARY KEY CLUSTERED 
(
	[DogSpeciesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityUser]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityUser](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](450) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_IdentityUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PaymentMethod] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Total] [int] NOT NULL,
	[ShipInfoId] [int] NOT NULL,
	[OrderStatus] [int] NULL,
	[ShipmentStatus] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [smallint] NOT NULL,
	[IsDeleted] [bit] NULL,
	[DogItemId] [int] NOT NULL,
	[DogProductItemId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfo]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfo](
	[ShipInfoId] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[District] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ShipInfo] PRIMARY KEY CLUSTERED 
(
	[ShipInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 5/29/2024 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](450) NOT NULL,
	[Discount_type] [nvarchar](max) NOT NULL,
	[Discount_value] [int] NOT NULL,
	[Start_date] [nvarchar](max) NOT NULL,
	[End_date] [nvarchar](max) NOT NULL,
	[Max_usage] [int] NOT NULL,
	[Current_usage] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreateAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231008145130_createStore', N'6.0.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231225075519_add-checkout', N'6.0.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231226161731_add-voucher', N'6.0.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231226185134_add-appointment', N'6.0.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231227101621_add-comment', N'6.0.22')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2181b388-b788-4780-b501-3aee8855fd39', N'User', N'USER', N'07a9f07a-c954-4a1c-bbff-a1da80e3e13a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7117da05-6f04-4aff-b4af-d38082978fe5', N'Admin', N'ADMIN', N'84aca924-7ed5-4740-9e5c-731adf77bf1e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4c26016d-ae46-4f5e-b5df-96f1662dd196', N'2181b388-b788-4780-b501-3aee8855fd39')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'527ad9fa-a913-481b-abaa-2454a0449117', N'2181b388-b788-4780-b501-3aee8855fd39')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'af474462-c6b0-40b6-9b90-c9c7a6ee802c', N'2181b388-b788-4780-b501-3aee8855fd39')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fac4066f-c09a-456b-b818-9322a7d9bfe4', N'2181b388-b788-4780-b501-3aee8855fd39')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', N'7117da05-6f04-4aff-b4af-d38082978fe5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [VerificationToken], [VerifiedAt], [PasswordResetToken], [ResetTokenExpires], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', N'Võ', N'Ly', CAST(N'2024-05-10T15:26:46.6844592' AS DateTime2), CAST(N'2024-05-19T06:25:57.8362189' AS DateTime2), N'1j2YS57D', CAST(N'2024-05-10T22:27:12.3438017' AS DateTime2), N'VTWSM4ti', CAST(N'2024-05-28T01:48:08.9002463' AS DateTime2), N'blenee', N'BLENEE', N'vothibichly43@gmail.com', N'VOTHIBICHLY43@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHfIOXnkMUEjvzxhBDzDEkRCQlYb6KtsgODUtwG5rCVj5T2QRtmE7Swi/MZmKb19pw==', N'DAVYPGDBKPMJDGMKJKVNFW67D2JO3YZX', N'c1abe3e1-9ba9-4f27-8e69-d47d3e0ed2ff', N'0819713627', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [VerificationToken], [VerifiedAt], [PasswordResetToken], [ResetTokenExpires], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4c26016d-ae46-4f5e-b5df-96f1662dd196', N'Nguyễn', N'Minh', CAST(N'2024-05-27T16:58:50.2945241' AS DateTime2), NULL, N'h2fhqFSj', NULL, NULL, NULL, N'minh', N'MINH', N'minh@gmail.com', N'MINH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGHa9myXqPPhR+Ew8DdnZPbFW10pg9DhSMeXNmza6G+9VWeNKMW2cX+dfkDa4TFauA==', N'OVOQ55ZID2733RJPHB66HHZQNBNEEYGH', N'cd5d3b56-5eee-475e-858a-a099846289cc', N'02324523456', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [VerificationToken], [VerifiedAt], [PasswordResetToken], [ResetTokenExpires], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'527ad9fa-a913-481b-abaa-2454a0449117', N'Võ', N'Ly', CAST(N'2024-05-29T01:59:19.1354184' AS DateTime2), NULL, N'kITRAm1R', CAST(N'2024-05-29T08:59:36.4573916' AS DateTime2), NULL, NULL, N'ngocne', N'NGOCNE', N'21522317@gm.uit.edu.vn', N'21522317@GM.UIT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEJMbMtBs1tovXfMT5B+jI9/3rMHuhSXD6ZuW8upRzTpuRRCvwfDFuhNn6vZKI5BosA==', N'IZUIYDUI7EEDKLRFWYMZDNKWRT2D4BVN', N'ea6997eb-5a44-49b7-b01e-be74c021ddc4', N'0819713627', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [VerificationToken], [VerifiedAt], [PasswordResetToken], [ResetTokenExpires], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'af474462-c6b0-40b6-9b90-c9c7a6ee802c', N'Mai', N'Bảo', CAST(N'2024-05-10T11:17:24.2827354' AS DateTime2), NULL, N'8MVMSHK1', NULL, NULL, NULL, N'user01', N'SRING', N'uer@example.com', N'UER@EXAMPLE.COM', 0, N'AQAAAAEAACcQAAAAEJpkme1rYFwa9MiMG4gRC83uRkoR4BNHd5XCXqoVGGnkskS8orv+jCcBsCeWKYVxmA==', N'JVGF6RSCQFRK7GOZC2XRURB6G5SSBHEV', N'abbbad87-94e3-4245-b949-304108d1870a', N'0321356671', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [VerificationToken], [VerifiedAt], [PasswordResetToken], [ResetTokenExpires], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fac4066f-c09a-456b-b818-9322a7d9bfe4', N'Trần', N'Trân', CAST(N'2024-05-10T11:02:52.8222821' AS DateTime2), NULL, N'wR2hm5Ge', NULL, NULL, NULL, N'user02', N'STRING', N'user@example.com', N'USER@EXAMPLE.COM', 0, N'AQAAAAEAACcQAAAAEFQbiGkZNTJxvrI9f/S6jEIg7RvbQfqED3n5Dg0AutKnZZYQze0ffnEGRLMWhLYO/A==', N'XRFYF7XG4ODFBQQJ5QTC6FOXFHGULB4N', N'102dd35f-dfb4-4f21-ab05-3a20bf690e65', N'0123456762', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Checkout] ON 
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (1, N'0106b861-6f67-4670-8254-c874d3eb9db2', 12111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thủ đức, TPHCM', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'blee', N'[{"id":2,"name":"Pate loại 1","quantity":1,"type":"product","price":1000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1715422207/PetShop/dhxqyd12th6ckddyj30e.jpg"]},{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":111,"totalPrice":null,"images":[]}]', CAST(N'2024-05-12T09:52:53.3873991' AS DateTime2), CAST(N'2024-05-12T09:52:53.3875100' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (2, N'4a3ecb29-b017-48b8-be6c-591de2216baa', 25222, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc , Ho Chi Minh City', N'Đang giao', N'chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Vo', N'[{"id":2,"name":"Pate loại 1","quantity":3,"type":"product","price":1000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1715422207/PetShop/dhxqyd12th6ckddyj30e.jpg"]},{"id":4,"name":"111","quantity":2,"type":"product","price":11111,"stock":111,"totalPrice":null,"images":[]}]', CAST(N'2024-05-13T14:15:02.3701627' AS DateTime2), CAST(N'2024-05-20T09:55:37.5610210' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (3, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, TPHCM', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Vo', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":109,"totalPrice":null,"images":[]}]', CAST(N'2024-05-18T11:04:38.1779109' AS DateTime2), CAST(N'2024-05-18T11:04:38.1779650' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (4, N'0106b861-6f67-4670-8254-c874d3eb9db2', -88889, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Vo', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":109,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T10:05:24.0918696' AS DateTime2), CAST(N'2024-05-20T10:05:24.0919507' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (5, N'0106b861-6f67-4670-8254-c874d3eb9db2', -88889, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Vo', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":109,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T10:33:44.2271238' AS DateTime2), CAST(N'2024-05-20T10:33:44.2272402' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (6, N'0106b861-6f67-4670-8254-c874d3eb9db2', -88889, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Vo', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":109,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T10:36:22.1655622' AS DateTime2), CAST(N'2024-05-20T10:36:22.1656445' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (7, N'0106b861-6f67-4670-8254-c874d3eb9db2', 1000000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":1,"name":"do an","quantity":1,"type":"product","price":1000000,"stock":1,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716196663/PetShop/oa7ni99yf9i7s1crbwfw.jpg"]}]', CAST(N'2024-05-20T10:43:57.7167291' AS DateTime2), CAST(N'2024-05-20T10:43:57.7168009' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (8, N'0106b861-6f67-4670-8254-c874d3eb9db2', 1000000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":3,"name":"abc","quantity":1,"type":"product","price":1000000,"stock":1,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716196690/PetShop/kauxuu409c9z0fbpjzc1.png"]}]', CAST(N'2024-05-20T11:02:47.8245149' AS DateTime2), CAST(N'2024-05-20T11:02:47.8246019' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (9, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":108,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:06:15.6268902' AS DateTime2), CAST(N'2024-05-20T11:06:15.6270302' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (10, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:07:38.6822828' AS DateTime2), CAST(N'2024-05-20T11:07:38.6823712' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (11, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:07:38.6822749' AS DateTime2), CAST(N'2024-05-20T11:07:38.6823581' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (12, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:19:38.2191952' AS DateTime2), CAST(N'2024-05-20T11:19:38.2192944' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (13, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:22:45.6744687' AS DateTime2), CAST(N'2024-05-20T11:22:45.6744694' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (14, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:32:49.6991757' AS DateTime2), CAST(N'2024-05-20T11:32:49.6991767' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (15, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:36:12.3776253' AS DateTime2), CAST(N'2024-05-20T11:36:12.3776258' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (16, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:40:49.9784174' AS DateTime2), CAST(N'2024-05-20T11:40:49.9784187' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (17, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:49:43.1982446' AS DateTime2), CAST(N'2024-05-20T11:49:43.1982454' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (18, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:50:29.3654579' AS DateTime2), CAST(N'2024-05-20T11:50:29.3654586' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (19, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T11:57:21.1056917' AS DateTime2), CAST(N'2024-05-20T11:57:21.1056925' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (20, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'sd', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":107,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:03:43.3136231' AS DateTime2), CAST(N'2024-05-20T12:03:43.3136238' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (21, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang giao', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":106,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:07:15.6922833' AS DateTime2), CAST(N'2024-05-22T22:59:07.1884792' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (22, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Thành công', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":106,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:09:51.2441656' AS DateTime2), CAST(N'2024-05-22T22:59:46.6165828' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (23, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":105,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:16:01.4849548' AS DateTime2), CAST(N'2024-05-20T12:16:01.4851119' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (24, N'0106b861-6f67-4670-8254-c874d3eb9db2', 10900, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":11,"name":"string","quantity":1,"type":"animal","price":10900,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716146558/PetShop/c1flli8mjz3s9nckwfr1.png"]}]', CAST(N'2024-05-20T12:22:33.1026678' AS DateTime2), CAST(N'2024-05-20T12:22:33.1027644' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (25, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":104,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:27:49.3336380' AS DateTime2), CAST(N'2024-05-22T23:08:27.1836241' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (26, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":103,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T12:31:45.4196743' AS DateTime2), CAST(N'2024-05-20T12:31:45.4196748' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (27, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":5,"name":"sda","quantity":1,"type":"product","price":1111,"stock":1,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T15:27:29.5075643' AS DateTime2), CAST(N'2024-05-20T15:27:29.5075650' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (28, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":6,"name":"SLKDFJSD","quantity":1,"type":"product","price":10000,"stock":1,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1715422939/PetShop/xtej8qbqsbnqv2cesk4n.png"]}]', CAST(N'2024-05-20T15:32:45.1889435' AS DateTime2), CAST(N'2024-05-20T15:32:45.1889444' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (29, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":12,"name":"chó 2","quantity":1,"type":"animal","price":10000,"stock":0,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T15:57:53.4741279' AS DateTime2), CAST(N'2024-05-20T15:57:53.4742236' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (30, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":102,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T16:10:50.9905219' AS DateTime2), CAST(N'2024-05-20T16:10:50.9905790' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (31, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":101,"totalPrice":null,"images":[]}]', CAST(N'2024-05-20T16:13:15.6334175' AS DateTime2), CAST(N'2024-05-20T16:13:15.6334182' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (32, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":13,"name":"aaa","quantity":1,"type":"animal","price":0,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1711188673/PetShop/b9ygrqiiwkxui4ynacmb.png"]}]', CAST(N'2024-05-20T16:31:03.8688632' AS DateTime2), CAST(N'2024-05-20T16:31:03.8688636' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (33, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11112, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":100,"totalPrice":null,"images":[]},{"id":14,"name":"sưqe","quantity":1,"type":"animal","price":1,"stock":0,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T08:10:36.1110617' AS DateTime2), CAST(N'2024-05-22T08:10:36.1111543' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (34, N'0106b861-6f67-4670-8254-c874d3eb9db2', 3288756, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":8,"name":"QKJWEHJWK","quantity":2,"type":"product","price":1689378,"stock":12,"totalPrice":null,"images":[]},{"id":12,"name":"Xương cho chó gặm sạch răng VEGEBRAND 360 Bone Prevent Tartar","quantity":1,"type":"product","price":10000,"stock":10,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T08:18:06.1765835' AS DateTime2), CAST(N'2024-05-22T08:18:06.1765840' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (35, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":99,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T08:32:43.7371280' AS DateTime2), CAST(N'2024-05-22T08:32:43.7372658' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (36, N'0106b861-6f67-4670-8254-c874d3eb9db2', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":16,"name":"ads","quantity":1,"type":"animal","price":100,"stock":0,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T08:34:38.8221416' AS DateTime2), CAST(N'2024-05-22T08:34:38.8221425' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (37, N'0106b861-6f67-4670-8254-c874d3eb9db2', 4000000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":17,"name":"corgi Béo Tròn 3 Tháng Tuổi Tiêm 2 Mũi","quantity":1,"type":"animal","price":4000000,"stock":0,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T08:38:03.6649834' AS DateTime2), CAST(N'2024-05-22T08:38:03.6649839' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (38, N'0106b861-6f67-4670-8254-c874d3eb9db2', 301980, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'lY', N'[{"id":11,"name":"string","quantity":2,"type":"animal","price":10900,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716146558/PetShop/c1flli8mjz3s9nckwfr1.png"]},{"id":7,"name":"DSFKND","quantity":2,"type":"product","price":190090,"stock":5,"totalPrice":null,"images":[]}]', CAST(N'2024-05-22T15:11:40.7059257' AS DateTime2), CAST(N'2024-05-22T15:11:40.7059266' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (39, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":98,"totalPrice":null,"images":[]}]', CAST(N'2024-05-23T00:18:12.7031860' AS DateTime2), CAST(N'2024-05-23T00:18:12.7034662' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (40, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":98,"totalPrice":null,"images":[]}]', CAST(N'2024-05-23T00:34:26.2066238' AS DateTime2), CAST(N'2024-05-23T00:34:26.2066245' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (41, N'0106b861-6f67-4670-8254-c874d3eb9db2', 11111, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'vothibichly43@gmail.com', N'0819713627', N'Ly', N'[{"id":4,"name":"111","quantity":1,"type":"product","price":11111,"stock":98,"totalPrice":null,"images":[]}]', CAST(N'2024-05-23T00:41:22.7767387' AS DateTime2), CAST(N'2024-05-23T00:41:22.7769270' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (42, N'6f61f597-27ba-4cb4-8685-3cd85477678f', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thủ Đức, TPHCM', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Danh', N'[{"id":11,"name":"Chó Doberman","quantity":1,"type":"animal","price":10900,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427247/PetShop/q9brtsikoo9bm34mf1nu.jpg"]}]', CAST(N'2024-05-23T01:32:46.5688857' AS DateTime2), CAST(N'2024-05-23T01:32:46.5689996' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (43, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 2900000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryvi', N'Đang giao', N'chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Ly', N'[{"id":11,"name":"Chó Doberman","quantity":1,"type":"animal","price":1090000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427247/PetShop/q9brtsikoo9bm34mf1nu.jpg"]},{"id":12,"name":"Chó lạp xưởng 2 tháng tuổi","quantity":1,"type":"animal","price":10000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427299/PetShop/vjn3rlec4bvksabq17pt.jpg"]},{"id":1,"name":"Sữa Tắm SOS Cho Chó Lông Trắng","quantity":10,"type":"product","price":180000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716428336/PetShop/papzn5pbhh9ob5aul2ta.webp"]}]', CAST(N'2024-05-23T03:09:36.3857332' AS DateTime2), CAST(N'2024-05-23T03:15:24.9149898' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (44, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 2490000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Nam', N'[{"id":14,"name":"Chó Poodle tiny thuần chủng siêu phẩm","quantity":1,"type":"animal","price":2000000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427662/PetShop/dlpekbxh4ggtoeeliaio.jpg"]},{"id":2,"name":"Vòng Cổ Trị Ve Rận Cho Chó Mèo Bioline","quantity":7,"type":"product","price":70000,"stock":7,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716428973/PetShop/askw8lxxmeiupwmoaaq1.webp"]}]', CAST(N'2024-05-27T05:45:52.0707164' AS DateTime2), CAST(N'2024-05-27T05:45:52.0707172' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (45, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 70000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, No, TPHCM', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hòa', N'[{"id":4,"name":"Rọ Mõm Inox Cho Chó","quantity":1,"type":"product","price":70000,"stock":97,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]}]', CAST(N'2024-05-27T14:10:31.7406723' AS DateTime2), CAST(N'2024-05-27T14:10:31.7407336' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (46, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 170000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thủ Đức, Hồ Chí Minh', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Ly', N'[{"id":5,"name":"Cát Vệ Sinh Catlike Hương Cà Phê","quantity":1,"type":"product","price":170000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429219/PetShop/wuxj0q7glu89dfwkpexo.webp"]}]', CAST(N'2024-05-27T17:40:59.7194244' AS DateTime2), CAST(N'2024-05-27T17:40:59.7195396' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (47, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 1405000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thủ đức, TPHCM', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hòa', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":12,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]},{"id":13,"name":"poodle cái trắng kem","quantity":1,"type":"animal","price":1000000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427586/PetShop/frgecuerustdcykxmted.jpg"]}]', CAST(N'2024-05-29T01:53:16.0273390' AS DateTime2), CAST(N'2024-05-29T01:53:16.0274928' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (48, N'527ad9fa-a913-481b-abaa-2454a0449117', 1090000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hoa', N'[{"id":11,"name":"Chó Doberman","quantity":1,"type":"animal","price":1090000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427247/PetShop/q9brtsikoo9bm34mf1nu.jpg"]}]', CAST(N'2024-05-29T02:54:55.2018322' AS DateTime2), CAST(N'2024-05-29T02:54:55.2019221' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (49, N'527ad9fa-a913-481b-abaa-2454a0449117', 7930000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Ly', N'[{"id":16,"name":"Husky Đen Trắng Cái C13157","quantity":1,"type":"animal","price":7990000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716826594/PetShop/tvp8pln2ojgpxygnzznl.jpg"]},{"id":4,"name":"Rọ Mõm Inox Cho Chó","quantity":2,"type":"product","price":70000,"stock":96,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]}]', CAST(N'2024-05-29T02:56:36.1111230' AS DateTime2), CAST(N'2024-05-29T02:56:36.1111240' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (50, N'527ad9fa-a913-481b-abaa-2454a0449117', 900000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Nam', N'[{"id":12,"name":"Chó lạp xưởng 2 tháng tuổi","quantity":1,"type":"animal","price":1000000,"stock":0,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716427299/PetShop/vjn3rlec4bvksabq17pt.jpg"]}]', CAST(N'2024-05-29T03:22:02.6308299' AS DateTime2), CAST(N'2024-05-29T03:22:02.6308309' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (51, N'527ad9fa-a913-481b-abaa-2454a0449117', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Ly', N'[{"id":4,"name":"Rọ Mõm Inox Cho Chó","quantity":1,"type":"product","price":70000,"stock":94,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]}]', CAST(N'2024-05-29T03:26:15.3078497' AS DateTime2), CAST(N'2024-05-29T03:26:15.3078505' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (52, N'527ad9fa-a913-481b-abaa-2454a0449117', 0, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hoàng', N'[{"id":4,"name":"Rọ Mõm Inox Cho Chó","quantity":1,"type":"product","price":70000,"stock":93,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]}]', CAST(N'2024-05-29T03:29:31.0465399' AS DateTime2), CAST(N'2024-05-29T03:29:31.0465405' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (53, N'527ad9fa-a913-481b-abaa-2454a0449117', 70000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Kha', N'[{"id":4,"name":"Rọ Mõm Inox Cho Chó","quantity":1,"type":"product","price":70000,"stock":92,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]}]', CAST(N'2024-05-29T03:33:51.9113390' AS DateTime2), CAST(N'2024-05-29T03:33:51.9113398' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (54, N'527ad9fa-a913-481b-abaa-2454a0449117', 405000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Oanh', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":11,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T03:36:47.9397314' AS DateTime2), CAST(N'2024-05-29T03:36:47.9397324' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (55, N'527ad9fa-a913-481b-abaa-2454a0449117', 305000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hoa', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:02:43.6732177' AS DateTime2), CAST(N'2024-05-29T04:02:43.6732184' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (56, N'527ad9fa-a913-481b-abaa-2454a0449117', 305000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Nam, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hoa', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":10,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:02:43.6855364' AS DateTime2), CAST(N'2024-05-29T04:02:43.6855372' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (57, N'527ad9fa-a913-481b-abaa-2454a0449117', 405000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Khang', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":9,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:04:49.7953151' AS DateTime2), CAST(N'2024-05-29T04:04:49.7953157' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (58, N'527ad9fa-a913-481b-abaa-2454a0449117', 405000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Hoài', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":8,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:06:19.7861437' AS DateTime2), CAST(N'2024-05-29T04:06:19.7861444' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (59, N'527ad9fa-a913-481b-abaa-2454a0449117', 305000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Chưa thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Lanh', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":7,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:08:27.9389884' AS DateTime2), CAST(N'2024-05-29T04:08:27.9389892' AS DateTime2))
GO
INSERT [dbo].[Checkout] ([Id], [User_id], [Total], [Address], [Status], [Payment], [Email], [PhoneNumber], [Name], [Data], [CreateAt], [UpdatedAt]) VALUES (60, N'527ad9fa-a913-481b-abaa-2454a0449117', 405000, N'108/5 Chuong Duong Street, Linh Chieu, Thu Duc District, Thu Duc, Quarryville', N'Đang lấy hàng', N'Đã thanh toán', N'21522317@gm.uit.edu.vn', N'0819713627', N'Khang', N'[{"id":3,"name":"Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ","quantity":1,"type":"product","price":405000,"stock":6,"totalPrice":null,"images":["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]}]', CAST(N'2024-05-29T04:11:25.3465655' AS DateTime2), CAST(N'2024-05-29T04:11:25.3465661' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Checkout] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([Comment_id], [User_id], [Product_id], [Content], [Type], [Username], [IsAccept], [CreateAt], [UpdatedAt]) VALUES (14, N'20fe25d6-c52e-4d4c-9bfe-73d80cb1a0eb', 11, N'Chó khỏe mạnh, dễ thương xỉu ~', N'', N'blenee', 1, CAST(N'2024-05-27T17:02:16.4076333' AS DateTime2), CAST(N'2024-05-27T17:02:27.6428753' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[DogItem] ON 
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (11, N'Chó Doberman', 1090000, N'string', N'female', 1, N'string', N'Tốt', N'Hợp đồng, bảo hành, cam kết thuần chủng.
Sổ theo dõi sức khoẻ.
Tẩy giun.
Tiêm chủng cập nhật.
Điều trị chống ký sinh trùng.
Spa & Grooming trước khi về nhà mới.
Hỗ trợ bác sĩ thú y miễn phí trọn đời.
Sách hướng dẫn chăm sóc, huấn luyện.
Giảm trọn đời 20% Spa Grooming; 5% phụ kiện.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427247/PetShop/q9brtsikoo9bm34mf1nu.jpg"]', 1, 0, 5, CAST(N'2024-03-22T17:01:55.9959831' AS DateTime2), CAST(N'2024-05-29T02:58:48.4785450' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (12, N'Chó lạp xưởng 2 tháng tuổi', 1000000, N'đen', N'female', 2, N'mỹ', N'Sức khỏe tốt', N'Chó lạp xưởng...', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427299/PetShop/vjn3rlec4bvksabq17pt.jpg"]', 0, 0, 7, CAST(N'2024-03-22T19:32:41.2778624' AS DateTime2), CAST(N'2024-05-29T02:59:39.9796559' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (13, N'poodle cái trắng kem', 1000000, N'â', N'female', 7, N'1', N'Đã xổ giun tiêm phòng mũi 5 bệnh', N'Bé khoẻ lanh lợi aec nào cần nhắn tin cho mình bên chợ tốt nhé mình không nhận cuộc gọi', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427586/PetShop/frgecuerustdcykxmted.jpg"]', 0, 0, 1, CAST(N'2024-03-23T10:11:16.3493938' AS DateTime2), CAST(N'2024-05-23T01:31:59.7848928' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (14, N'Chó Poodle tiny thuần chủng siêu phẩm', 2000000, N'ưqeq', N'female', 1, N'Việt Nam', N'Đã tiêm chủng', N'Poodle thuần Chủng
Dễ nuôi, dễ chăm sóc, ăn cơm cháo và hạt khô ngon lành
Đã tiêm 1 mũi vaccine 5in1 và tẩy giun định kì cho cún.
SHIP CÚN TOÀN QUỐC( Nhận cún kiểm tra rồi thanh toán)', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427662/PetShop/dlpekbxh4ggtoeeliaio.jpg"]', 0, 0, 8, CAST(N'2024-04-15T02:13:09.6978429' AS DateTime2), CAST(N'2024-05-23T01:27:44.6764227' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (15, N'Corgi mông bự cute', 1700000, N'ád', N'male', 10, N'sdfd', N'Tốt', N'Corgi thuần chủng', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427750/PetShop/xketgcukhtnukxjdh1sj.jpg"]', 1, 0, 4, CAST(N'2024-05-15T11:48:18.9035393' AS DateTime2), CAST(N'2024-05-23T01:29:12.3060618' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (16, N'Husky Đen Trắng Cái C13157', 7990000, N'Đen,Trắng', N'female', 10, N'Mỹ', N'Tốt', N'Hợp đồng, bảo hành, cam kết thuần chủng.
Sổ theo dõi sức khoẻ.
Tẩy giun.
Tiêm chủng cập nhật.
Điều trị chống ký sinh trùng.
Spa & Grooming trước khi về nhà mới.
Hỗ trợ bác sĩ thú y miễn phí trọn đời.
Sách hướng dẫn chăm sóc, huấn luyện.
Giảm trọn đời 20% Spa Grooming; 5% phụ kiện.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716826594/PetShop/tvp8pln2ojgpxygnzznl.jpg"]', 0, 0, 3, CAST(N'2024-05-19T06:50:51.0270879' AS DateTime2), CAST(N'2024-05-27T16:16:36.3949487' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (17, N'Corgi Béo Tròn 3 Tháng Tuổi Tiêm 2 Mũi', 4000000, N'Trắng', N'female', 3, N'Nhật Bản', N'Khỏe mạnh', N'Giới thiệu giống chó corgi
- 3 Tháng tuổi , đã tiêm phòng đầy đủ 2 mũi vaxin an tâm cho bé
- ưu điểm ( ăn tốt , nghe lời , quấn chủ , thông mình và đáng yêu
- chế độ bảo hành đầy đủ . 3 ngày 1 đổi 1 : 2 bệnh virut - 7 ngày hỗ trợ viện phí 10%
Thẻ bảo hành , sổ tiêm ngừa đầy đủ', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716427780/PetShop/bokzz7f8yhlamxrtbskl.jpg"]', 1, 0, 4, CAST(N'2024-05-19T09:03:34.2307828' AS DateTime2), CAST(N'2024-05-23T01:29:42.6642377' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (18, N'Cho Alaka', 1999990, N'Den', N'male', 10, N'My', N'Suc kheo tot', N'aba', N'[]', 1, 1, 2, CAST(N'2024-05-22T15:26:45.1530260' AS DateTime2), CAST(N'2024-05-22T15:26:45.1530266' AS DateTime2))
GO
INSERT [dbo].[DogItem] ([DogItemId], [DogName], [Price], [Color], [Sex], [Age], [Origin], [HealthStatus], [Description], [Images], [IsInStock], [IsDeleted], [DogSpeciesId], [CreateAt], [UpdatedAt]) VALUES (19, N'Chó Husky', 100000, N'Đen', N'male', 10, N'Việt Nam', N'Tốt', N'Chó', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716432573/PetShop/ujvaie9qjwxjbi3u81b5.jpg"]', 1, 0, 3, CAST(N'2024-05-23T02:50:02.8995130' AS DateTime2), CAST(N'2024-05-23T02:50:02.8995836' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[DogItem] OFF
GO
SET IDENTITY_INSERT [dbo].[DogProductItem] ON 
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (1, N'Sữa Tắm SOS Cho Chó Lông Trắng', 180000, N'Sữa tắm', N'- Sữa Tắm SOS Cho Chó Lông Trắng màu xanh ngọc dành riêng cho chó có lông màu trắng. Có tác dụng làm mềm mượt lông, phục hồi hư tổn đối với thú cưng có bộ lông bị khô, xơ trở nên bóng, khỏe, trắng hơn và không bị bạc màu.

- Với Sữa Tắm SOS Cho Chó Lông Trắng 530ml dùng được rất lâu, mỗi lần sử dụng chỉ lấy một lượng nhỏ vừa đủ hòa với nước để tắm gội, cún của bạn sẽ sạch sẽ thơm tho cả tuần.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716428336/PetShop/papzn5pbhh9ob5aul2ta.webp"]', 0, 0, 0, CAST(N'2024-03-24T16:48:52.4714530' AS DateTime2), CAST(N'2024-05-23T08:39:01.9539129' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (2, N'Vòng Cổ Trị Ve Rận Cho Chó Mèo Bioline', 70000, N'Vòng Cổ', N'Ve rận là loài ký sinh trùng rất nguy hiểm tới thú cưng. Trong trường hợp này, chủ nhân cần tìm cách điều trị ve tận gốc. Vòng cổ trị ve đang là 1 trong những sự lựa chọn của nhiều “sen” để đánh bay loài ký sinh trùng này. Nhưng tìm sản phẩm có thể đánh bay hết lũ ve trên cơ thể “boss” không hề dễ. Vậy hãy cùng FamiPet khám phá Vòng Cổ Trị Ve Rận Cho Chó Mèo Bioline. 

Mô Tả Sản Phẩm Vòng Cổ Trị Ve Rận Cho Chó Mèo Bioline
Sản phẩm Vòng Cổ Trị Ve Rận Cho Chó Mèo Bioline có tác dụng lớn trong việc điều trị ve rận ở chó mèo. Đồng thời cũng ngăn ngừa sự phát triển ký sinh trùng ở chó mèo. 

Sản phẩm có sẵn và được bán với giá tốt nhất tại siêu thị thú cưng FamiPet.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716428973/PetShop/askw8lxxmeiupwmoaaq1.webp"]', 0, 0, 0, CAST(N'2024-05-10T19:23:27.4837375' AS DateTime2), CAST(N'2024-05-23T08:50:15.9479532' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (3, N'Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ', 405000, N'Dây dắt', N'Giới Thiệu Sản Phẩm Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ
+ Sản phẩm Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ có chất liệu dây dắt bền chắc và tay cầm được thiết kế tinh xảo, tạo được sự an toàn và tiện dụng.

+ Đây là dòng sản phẩm dây dắt cao cấp của Flexi bạn sẽ không phải vất vả điều chỉnh cỡ dây cho bé cún của mình nữa.

+ Sản phẩm dây dắt cho chó có sẵn và được bán giá tốt nhất tại siêu thị thú cưng FamiPet.

Chất Liệu
Sản phẩm được làm từ những chất liệu an toàn, thân thiện với thú cưng. Các chất liệu tạo ra sản phẩm đều được kiểm nghiệm, phù hợp cho chó. Dây Dắt Tự Động Cho Chó Dưới 20Kg Flexi Fun Màu Đỏ sử dụng thành phần chủ yếu là nhựa tự nhiên và dây cao su. Chất liệu không gây hại cho chó, không có chất hoá học, đảm bảo an toàn cho cả người sử dụng và thú cưng.

Phần tay cầm được gia cố chắc chắn, giúp bạn cầm chắc tay mà vẫn không bị đau, tê tay. Chất liệu dây cao su có độ co dãn cao, có thể điều chỉnh dài ngắn khác nhau. Móc bằng kim loại đảm bảo chắc chắn, có độ bền cao. ', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716429087/PetShop/yglkitpnqxair8gldvzy.webp"]', 5, 1, 0, CAST(N'2024-05-11T17:14:41.1640967' AS DateTime2), CAST(N'2024-05-28T00:33:41.5559324' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (4, N'Rọ Mõm Inox Cho Chó', 70000, N'Rọ Mõm', N'Khi bạn muốn dắt chú chó của mình đi dạo chơi trên đường hoặc đến những nơi công cộng, bạn cần chắc chắn rằng chú chó của bạn sẽ không cắn linh tình, không sủa gây náo loạn nơi công cộng. Vì vậy, những chiếc rọ mõm sẽ là một phụ kiện giúp bạn xử lý việc đó.

Rọ Mõm Inox Cho Chó sẽ là một phụ kiện không thể thiếu giúp đảm bảo an toàn cho những người xung quanh khi bạn đưa cún yêu đến những nơi công cộng.

Đặc Điểm Nổi Bật Của Rọ Mõm Inox Cho Chó
- Thiết kế Rọ Mõm Inox Cho Chó chắc chắn, đảm bảo an toàn. Đồng thời đầu rọ mõm thông khí giúp mang đến cho chú cún cưng cảm giác thoải mái khi đeo

- Chi tiết được ghép nối chắc chắn, bảo đảm độ bền cho sản phẩm.

- Được tạo bằng chất liệu Inox cao cấp chống gỉ, cho độ bền cao. có bổ sung miếng đệm êm ái trên phần mũi khiến chú chó cảm thấy dễ chịu hơn.

- Thiết kế khóa nới linh động giúp bạn dễ dàng canh chỉnh sao cho chú cún cưng cảm thấy thoải mái nhất.

Đối Tượng Sử Dụng Của Rọ Mõm Inox Cho Chó
Với Rọ Mõm Inox Cho Chó phù hợp với từng loại chó khác nhau:

Size nhỏ: Cho chó nhỏ dưới 15kg
Size nhỡ: cho chó lớn từ 15kg – 30kg 
Size to: cho chó lớn từ 30kg – 40kg
Size đại: cho chó lớn từ 40kg – 60kg
Bạn hoàn toàn yên tâm cho boss của mình đeo Rọ Mõm Inox Cho Chó khi đi ra ngoài nhé, bởi thiết kế nhằm tạo sự thoáng mát, thoải mái nhất cho cún cưng, không gây cọ sát hay làm đau chúng.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716429149/PetShop/xp4yrtahqevqziezfz6x.webp"]', 91, 1, 0, CAST(N'2024-05-11T17:17:31.6484594' AS DateTime2), CAST(N'2024-05-23T08:52:31.2956170' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (5, N'Cát Vệ Sinh Catlike Hương Cà Phê', 170000, N'Cát vệ sinh', N'Cho mèo đi vệ sinh vào khay là điều hết sức cần thiết. Việc tạo thói quen đi vệ sinh đúng chỗ không chỉ giúp bạn đỡ vất vả mà cũng làm ngôi nhà của bạn sạch đẹp hơn. Tuy nhiên, cho mèo đi vệ sinh vào khay cũng cần đến cát vệ sinh. Các loại cát vệ sinh sẽ giúp khử mùi hiệu quả, ngăn ngừa vi khuẩn. Sản phẩm Cát Vệ Sinh Catlike Hương Cà Phê 15l sẽ giúp bạn giải quyết những vấn đề này. 

Mô Tả Sản Phẩm Cát Vệ Sinh Catlike Hương Cà Phê
Cát Vệ Sinh Catlike Hương Cà Phê 15l là sản phẩm cát vệ sinh cho mèo rất an toàn. Được làm từ thành phần tự nhiên, không độc hại cho mèo, đảm bảo an toàn vệ sinh. Với nguồn gốc, xuất xứ rõ ràng, được nhiều "sen" lựa chọn, sản phẩm này giúp việc dọn vệ sinh cho mèo dễ dàng hơn.

Đồng thời, Cát Vệ Sinh Catlike Hương Cà Phê cũng ngăn ngừa sự phát triển của vi khuẩn. Khiến ngôi nhà của bạn luôn sạch sẽ, thơm tho, đảm bảo không có mùi chất thải cuả mèo.

Cát Vệ Sinh Catlike Hương Cà Phê 15l có sẵn và được bán giá siêu tốt tại cửa hàng thú cưng FamiPet.

Xuất Xứ Cát Vệ Sinh Catlike Hương Cà Phê
Sản phẩm Cát Vệ Sinh Catlike Hương Cà Phê 15l được nhập khẩu từ Nhật Bản. Với các chứng nhận, kiểm định chặt chẽ, nghiêm khắc, đảm bảo sản phẩm này rất an toàn cho mèo. Sản phẩm có nguồn gốc, xuất xứ rõ ràng, vì thế bạn không cần quá lo lắng về chất lượng của chúng!

Lợi Ích Sản Phẩm 
Cát Vệ Sinh Catlike Hương Cà Phê là một trong số những loại cát vệ sinh cho mèo chất lượng và giá cả hợp lý nhất trên thị trường hiện nay. Ưu điểm nổi bật của sản phẩm này nằm ở độ thấm hút nhanh và hương thơm bền lâu.

Với hương cà phê đặc trưng, sản phẩm này sẽ giúp khử mùi tối ưu. Đem lại hương thơm cho khu vực vệ sinh của mèo. Đồng thời cũng ngăn ngừa được vi khuẩn, tạo môi trường hợp vệ sinh.

Thêm vào đó, sản phẩm được đóng gói khá kỹ càng và đẹp mắt giúp cho việc vận chuyển vô cùng dễ dàng. Với tay xách tiện lợi, bạn có thể mang cát theo mèo đi bất cứ đâu.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716429219/PetShop/wuxj0q7glu89dfwkpexo.webp"]', 9, 1, 0, CAST(N'2024-05-11T17:19:36.4249691' AS DateTime2), CAST(N'2024-05-23T08:53:45.6043944' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (6, N'𝐗𝐢̣𝐭 𝐤𝐡𝐮̛̉ 𝐦𝐮̀𝐢 𝐜𝐡𝐨́ 𝐦𝐞̀𝐨 𝐃𝐄𝐎𝐃𝐎𝐑𝐀𝐍𝐓 𝐒𝐏𝐑𝐀𝐘', 150000, N'Xịt khử mùi', N'🔔🔔𝐗𝐢̣𝐭 𝐤𝐡𝐮̛̉ 𝐦𝐮̀𝐢 𝐜𝐡𝐨́ 𝐦𝐞̀𝐨 𝐃𝐄𝐎𝐃𝐎𝐑𝐀𝐍𝐓 𝐒𝐏𝐑𝐀𝐘🔔🔔

Có 3 mùi:

👉 Hương nước hoa - xanh dương

👉 Hương sữa hạnh nhân - xanh lá

👉 Hương táo kiwi - hồng

 

#DEODORANT_SPRAY là sản phẩm khử mùi cao cấp với thành phần tự nhiên an toàn cho thú nuôi và môi trường.

- Với công thức đặc biệt DEODORANT SPRAY có tính an toàn cao cho con người và tất cả động vật nuôi, có thể sử dụng rộng rãi trong tất cả các phạm vi thú nuôi thường sinh hoạt. Loại bỏ mùi nước tiểu, phân của vật cưng vấy lên thảm, ghế sofa, nội thất, nệm xe hơi, chuồng của vật nuôi,...

*Công Dụng:

1️⃣ Hạn chế sự phát triển của vi khuẩn, nấm mốc

2️⃣ Khử mùi nơi thú nuôi sinh hoạt.

3️⃣ Lưu lại mùi hương tươi mát, dễ chịu.

*HƯỚNG DẪN SỬ DỤNG:

✅ Lắc đều trước khi sử dụng

✅ Xịt nhanh và đều tay để dung dịch phủ đều lên tất cả vùng lông của thú cưng. Sau đó dùng tay xoa thật nhẹ nhàng và dùng máy sấy để làm khô lông

✅ Có thể xịt xung quanh thú cưng hay nằm, chuồng, đệm, khu vệ sinh

✅ Có thể xịt khử mùi để huấn luyện các bé đi vệ sinh đúng chỗ

*BẢO QUẢN:

- Nơi khô ráo thoáng mát.

- Để xa tầm tay trẻ em.

- Tránh tiếp xúc trực tiếp với anh nắng mặt trời

Sản Phẩm Chất Lượng Cao - Đảm Bảo Sự Hài Lòng Tới Quý Khách !

Shop Cam Kết Bằng Uy Tín Và Chất Lượng.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716829910/PetShop/ihasw51qsu6o73wru651.webp"]', 10, 1, 0, CAST(N'2024-05-11T17:22:21.1936059' AS DateTime2), CAST(N'2024-05-28T00:11:51.9765017' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (7, N'Bánh Thưởng Dạng Kem Vị Cá Hồi Me-O', 190090, N'Bánh thưởng', N'Mô Tả Sản Phẩm Bánh Thưởng Me-o Creamy Treats Salmon Flavor
Tên sản phẩm: Bánh Thưởng Cho Mèo Vị Cá Hồi Me-O Creamy Treats Salmon Flavor 60g

Khối lượng: 60g

Bánh Thưởng Dạng Kem Me-O Vị Cá Hồi ngon tuyệt hảo, giàu dưỡng chất giúp mèo ăn ngon miệng, mau lớn. Đây là món ăn nhẹ thơm ngon với hương vị cá hồi thơm ngon. Nó giúp cho những chú mèo nhà bạn trở nên năng động và hoạt bát hơn!

Sản phẩm Bánh Thưởng Dạng Kem Me-O Vị Cá Hồi có sẵn và được bán giá tốt nhất tại siêu thị thú cưng FamiPet.

Xuất Xứ
Sản phẩm Bánh Thưởng Dạng Kem Me-O Vị Cá Hồi là kết quả của các chuyên gia đến từ Thái Lan. Được nhập khẩu tại Thái Lan, với chất lượng an toàn. Đây là 1 dòng sản phẩm thuộc thương hiệu Me-O rất quen thuộc với chúng ta rồi! Me-O là thương hiệu có nguồn gốc từ Thái Lan, chuyên sản xuất các sản phẩm dành cho mèo. 

Thức ăn Me-O được sản xuất tai nhà máy chỉ sản xuất thức ăn dành cho vật nuôi, có chứng nhận GMP và HACCP. Chính vì vậy, về chất lượng sản phẩm Bánh Thưởng Dạng Kem Me-O Cho Mèo thì khỏi phải bàn!!

Thành Phần
Sản phẩm Bánh Thưởng Dạng Kem Me-O Vị Cá Hồi sử dụng những thành phần được chọn lọc kỹ lưỡng. Các nguyên liệu đều đảm bảo an toàn cho chú mèo của bạn. 
Thành phần: Thịt gà, Gan gà, Bột cá hồi, Thân gà, Cá hồi thủy phân, Dầu gà, Chất tạo hương, Tinh bột biến tính, Chất tạo đông, Các vitamin & khoáng chất, DL-Methionin, Chất tạo màu, Taurine, Nước', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830054/PetShop/weqgrwnf4b7cxzxt37ey.webp"]', 3, 1, 0, CAST(N'2024-05-11T17:23:06.7516212' AS DateTime2), CAST(N'2024-05-28T00:14:16.2670685' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (8, N'Bánh Thưởng Cho Chó Steamed Bread 120g', 150000, N'Bánh thưởng', N'Sản phẩm Bánh Thưởng Cho Chó Steamed Bread 120g là vừa là một loại thức ăn, vừa lại là một dụng cụ hết sức hữu hiệu trong huấn luyện chó. Và cũng rất hay đó là việc kết hợp một cách hài hòa giữa các viên bánh thưởng này với các dụng cụ huấn luyện khác làm tăng hiệu quả của việc huấn luyện chó như Đồ Chơi âm thanh, Bóng cao su có dây...', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830105/PetShop/rtmvjx191mbakun202cz.webp"]', 10, 1, 0, CAST(N'2024-05-11T17:23:55.4892767' AS DateTime2), CAST(N'2024-05-28T00:15:07.3837669' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (9, N'Sữa Bột Predogen cho chó hộp 110g', 45000, N'Sữa bột', N'ữa là một phần không thể thiếu cho những chú cún con. Mà ta lại không thể sử dụng các loại sữa của người để cho cún uống được, như vậy rất nguy hiểm. Chính vì vậy, dòng sữa chuyên biệt cho cún là rất cần thiết. Cùng tìm hiểu thêm các công dụng hữu ích của dòng sản phẩm Sữa Predogen cho chó này nhé:
 

Thông Tin Sữa Bột Cho Chó - Dr.Kyan Predogen Hộp 110g
Sữa bột dành cho chó PREDOGEN được sản xuất theo công thức của WONDERLIFE PHARMA  (mỹ) là một thực phẩm bổ dưỡng cho chó yêu của bạn ngoài những thức ăn thông thường, giúp chó yêu cảm thấy ngon miệng hơn, bồi bổ cơ thể và cung cấp những thứ cần thiết để phát triển toàn diện.

Thành phần dinh dưỡng:
- Năng lượng / Energy : 440kcal
- Độ ẩm/Moisture:   5gr.
- Chất đạm/ Protein :  15gr.
- Chất béo/ fat :  18,9gr.
- Xơ thô/ Fiber :  0,05gr.
- Khoáng chất/ Mineral:  5gr.

>>> Xem thêm: Các loại sữa bột cho chó khác tại FamiPet

Thành Phần: 

Sữa bột nguyên kem, Sữa bột gầy,Nondairy creamer, Maltodẽtrin,Sucrose,Whey protein concentrate,Hương dùng trong thực phẩm,Chất xơ Inulin, Lysine, Nano - Precipitated Calcium Carbonate,Vitamin C, Vitamin K1, Vitamin B6, Vitamin B1, VitaminB2, Vitamin D3, Vitamin
A, Vitamin B12, Vitamin Axit Pantothenic, Biotine, Axit Folic...', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830188/PetShop/slg31kce3hgds6phv4fq.webp"]', 1, 1, 0, CAST(N'2024-05-11T17:24:49.5719305' AS DateTime2), CAST(N'2024-05-28T00:16:30.6668956' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (10, N'BỌT TẮM KHÔ CHO THÚ CƯNG SUPER CLEAR AMITAVET 250ML', 160000, N'Bọt tắm khô', N'Khi bạn muốn tắm cho Boss nhà mình , nhưng thời tiết dạo này lạnh quá 🤧 , vậy thì hãy để #Famipet hỗ trợ mình nhé

🤗𝑩𝒐̣𝒕 𝒕𝒂̆́𝒎 𝒌𝒉𝒐̂ 𝒄𝒉𝒐 𝒄𝒉𝒐́ 𝒎𝒆̀𝒐 𝑺𝒖𝒑𝒆𝒓 𝑪𝒍𝒆𝒂𝒓 𝑨𝒎𝒊𝒕𝒂𝒗𝒆𝒕 250𝒎𝒍

❌𝘊𝑜̂𝘯𝘨 𝘥𝑢̣𝘯𝘨:

- Không cần dùng nước tránh nguy cơ bệnh.

- Tiện lợi nhanh chóng.

- Khử mùi lưu lại hương thơm

- Không cần rửa lại bằng nước cũng đạt hiệu quả khử trùng , diệt khuẩn và vệ sinh cơ thể.

- Có khả năng khử mùi, dưỡng lông , làm sạch cơ thể thú cưng.

- Sản phẩm có công thức tính nhẹ nhàng, phù hợp với chó mèo ở mọi độ tuổi.

⚡𝘗𝘩𝑢̛𝑜̛𝘯𝘨 𝘱𝘩𝑎́𝘱 𝘴𝑢̛̉ 𝘥𝑢̣𝘯𝘨:

- Cho một lượng sữa tắm thích hợp vào lòng bàn tay hoặc xịt trực tiếp lên thú cưng .

- Dùng tay hoặc khăn nhẹ nhàng massage lên toàn thân chó mèo.

- Có thể sử dụng lược chuyên dùng cho thú cưng để chải lông,sau đó dùng khăn lau khô.

🚫𝑳𝒖̛𝒖 𝒚́:

Bảo quản nơi khô ráo và tránh ánh nắng trực tiếp từ mặt trời.

----------------------------------------------

Sản phẩm hiện có tại các cơ sở:

🌟🌟🌟#FamiPet_Shop 🌟🌟🌟

🏘CS1: 209 Thụy Khuê - Tây Hồ - Hà Nội

🏘CS2:15/132 Nguyên Xá-Minh Khai-Bắc Từ Liêm - Hà Nội

☎️:086.505.6669

🎁 Shopee: https://shopee.vn/famipet

🎁 Web: https://famipet.vn

🎁 Lazada: http://lazada.vn/famipet.

#CÙNG_FamiPet_CHĂM_SÓC_PET_YÊU🥰🥰', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830366/PetShop/vwunn0houy4b0i3qownb.webp"]', 1, 1, 0, CAST(N'2024-05-11T17:25:41.8303542' AS DateTime2), CAST(N'2024-05-28T00:19:28.2906038' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (11, N'Thức Ăn Khô Cho Chó Con Smart Heart Gold Puppy 1kg', 135000, N'Thức ăn', N'Sản phẩm Thức Ăn Khô Cho Chó Con Smart Heart Gold Puppy 1kg là loại thức ăn hạt dành riêng cho chó nhỏ tầm dưới 12 tháng tuổi. Dòng sản phẩm SmartHeart đang ngày càng được ưa chuộng trong cộng đồng thú cưng vì hương vi thơm ngon, dễ ăn và được các bé cún yêu thích.

Mô Tả Sản Phẩm Thức Ăn Khô Cho Chó SmartHeart Gold Puppy
Trọng lượng: 1kg

Xuất xứ: Thái Lan

- Smart Heart Gold Puppy là thức ăn khô cho chó nhỏ với chất lượng được đảm bảo.

- Với các chú chó nhỏ, bạn cần cung cấp cho chúng một chế độ dinh dưỡng đầy đủ các chất để đáp ứng nhu cầu duy trì và phục hồi các mô cơ trong cơ thể của chúng.

- Là đồ ăn cho chó  có chất lượng tốt, chứa dầu cá, DHA, Axit béo O-mega 3, giàu Colin...giúp phát triển trí não và tăng cường sức khỏe cho tim mạch.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830548/PetShop/mntgmzvluygrcrc35tlu.webp"]', 22, 1, 0, CAST(N'2024-05-11T17:45:25.1599222' AS DateTime2), CAST(N'2024-05-28T00:22:30.5012847' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (12, N'Xương cho chó gặm sạch răng VEGEBRAND 360 Bone Prevent Tartar', 10000, N'Đồ ăn', N'Xương cho chó gặm sạch răng VEGEBRAND 360 Bone Prevent Tartar là thức ăn dinh dưỡng dành riêng cho các giống chó.

Lợi ích chính
VEGEBRAND 360 Bone Prevent Tartar với các thành phần từ tự nhiên tạo nên hương vị thơm ngon, bổ dưỡng
Hỗ trợ rất tốt cho sức khỏe của thú cưng
Sản phẩm xương gặm giúp loại bỏ 99% những mảng bám răng cứng đầu, làm giảm mùi hôi miệng
Thúc đẩy hệ tiêu hóa và tránh được những bệnh về đường ruột
Ngăn chặn hành vi cắn phá của chó cưng
Thành phần dinh dưỡng
Xương cho chó gặm sạch răng VEGEBRAND 360 Bone Prevent Tartar với các thành phần như ngũ cốc, thịt và động vật. Dẫn xuất có nguồn gốc thực vật, rau, khoáng chất. Vitamin E. Feroh Sulphate Monohydrate, Zinc Sulphate Monohydrate, Mangan Sulphate Monohydrate. Màu sắc, hương vị, chất bảo quản.

Phân tích đảm bảo: Protein thô (tối thiểu) 10%. Chất béo thô (tối thiểu) 0,4%. Sợi thô (tối đa) 4%. Tro (tối đa) 5%. Độ ẩm (tối đa) 16%. Canxi (tối thiểu) 0,05%. Photpho (tối thiểu) 0,04%. Natri (tối thiểu) 0,02%.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830594/PetShop/lt1moesfainkjyhsnevy.webp"]', 9, 1, 0, CAST(N'2024-05-20T00:11:13.0228116' AS DateTime2), CAST(N'2024-05-28T00:23:16.2933692' AS DateTime2))
GO
INSERT [dbo].[DogProductItem] ([DogProductItemId], [ItemName], [Price], [Category], [Description], [Images], [Quantity], [IsInStock], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (13, N'Khay vệ sinh vuông cho chó thành cao có cọc', 170000, N'Khay vệ sinh', N'+ Được thiết kế dành riêng cho cún đi vệ sinh, nên hộp đi vệ sinh cho bên mình nhập về có kiểu dáng bắt mắt, chất lượng nhựa bền, đẹp.
Đối tượng: Khay vệ sinh cho chó phù hợp với các dòng chó như : Pomeranian, Binchon, pooder, minpincher … vv
+ Tất cả đều lắp ghép và dễ dàng dọn dẹp .
Huấn luyện : Có thể sử dụng bình xịt vệ sinh hoặc có ít mùi nước tiểu wc của nó trên khay. Bắt đầu huấn luyện ngay khi con chó của bạn vừa về nhà mới. Cần cố định thời gian cho chó uống nước, cụ thể là 3 lần uống / ngày ngay sau khi vừa ăn xong. Tiếp đến nắm vững thói quen đi wc của nó. Thường thì chó dưới 6 tháng đi tiểu 4 tiếng 1 lần. Chó trên 6 tháng đi tiểu 8 tiếng 1 lần.
Việc còn lại là đưa nó vào trong nhà wc đặt khay wc, hoặc đặt khay wc ngay cạnh chuồng của nó.', N'["https://res.cloudinary.com/du36crm0k/image/upload/v1716830631/PetShop/wbi67xknmb1ypzihivvd.webp"]', 10, 1, 0, CAST(N'2024-05-23T08:40:00.6440046' AS DateTime2), CAST(N'2024-05-28T00:23:53.1659070' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[DogProductItem] OFF
GO
SET IDENTITY_INSERT [dbo].[DogSpecies] ON 
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (1, N'Golden Retriever', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (2, N'Alaska', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (3, N'Husky', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (4, N'Corgi', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (5, N'Doberman', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (6, N'Pitbull', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (7, N'Lạp Xưởng', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (8, N'Poodle', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (9, N'Chihuahua', NULL, NULL, NULL)
GO
INSERT [dbo].[DogSpecies] ([DogSpeciesId], [DogSpeciesName], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (10, N'Shiba', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DogSpecies] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (1, N'001', N'fixed_amount', 100000, N'05 09 2024', N'05 24 2024', 1, 1, 1, CAST(N'2024-05-13T14:17:24.4885959' AS DateTime2), CAST(N'2024-05-13T14:17:24.4885969' AS DateTime2))
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (2, N'002', N'fixed_amount', 100000, N'05 20 2024', N'05 25 2024', 10, 10, 1, CAST(N'2024-05-20T12:35:52.2866289' AS DateTime2), CAST(N'2024-05-20T12:35:52.2866301' AS DateTime2))
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (3, N'003', N'fixed_amount', 100000, N'05 22 2024', N'05 23 2024', 10, 5, 0, CAST(N'2024-05-22T08:17:32.0611291' AS DateTime2), CAST(N'2024-05-22T08:17:32.0612116' AS DateTime2))
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (4, N'HAM5', N'fixed_amount', 200000, N'05 27 2024', N'05 31 2024', 7, 7, 0, CAST(N'2024-05-27T04:18:47.0591078' AS DateTime2), CAST(N'2024-05-27T04:18:47.0591489' AS DateTime2))
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (5, N'XA34A', N'fixed_amount', 100000, N'05 29 2024', N'05 31 2024', 10, 10, 0, CAST(N'2024-05-29T03:02:08.0575624' AS DateTime2), CAST(N'2024-05-29T03:02:08.0575633' AS DateTime2))
GO
INSERT [dbo].[Voucher] ([Voucher_id], [Code], [Discount_type], [Discount_value], [Start_date], [End_date], [Max_usage], [Current_usage], [IsDeleted], [CreateAt], [UpdatedAt]) VALUES (6, N'AAZE', N'fixed_amount', 100000, N'05 29 2024', N'05 31 2024', 20, 1, 0, CAST(N'2024-05-29T04:09:19.7487167' AS DateTime2), CAST(N'2024-05-29T04:09:19.7487180' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CartDetail_CartId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetail_CartId] ON [dbo].[CartDetail]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartDetailDogItem_dogItemsDogItemId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetailDogItem_dogItemsDogItemId] ON [dbo].[CartDetailDogItem]
(
	[dogItemsDogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartDetailDogProductItem_dogProductItemsDogProductItemId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetailDogProductItem_dogProductItemsDogProductItemId] ON [dbo].[CartDetailDogProductItem]
(
	[dogProductItemsDogProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DogItem_DogSpeciesId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DogItem_DogSpeciesId] ON [dbo].[DogItem]
(
	[DogSpeciesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityUser_PhoneNumber]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityUser_PhoneNumber] ON [dbo].[IdentityUser]
(
	[PhoneNumber] ASC
)
WHERE ([PhoneNumber] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice_OrderId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Invoice_OrderId] ON [dbo].[Invoice]
(
	[OrderId] ASC
)
WHERE ([OrderId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_ShipInfoId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Order_ShipInfoId] ON [dbo].[Order]
(
	[ShipInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_UserId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Order_UserId] ON [dbo].[Order]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_DogItemId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_DogItemId] ON [dbo].[OrderDetail]
(
	[DogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_DogProductItemId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_DogProductItemId] ON [dbo].[OrderDetail]
(
	[DogProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Voucher_Code]    Script Date: 5/29/2024 11:43:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Voucher_Code] ON [dbo].[Voucher]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart_CartId]
GO
ALTER TABLE [dbo].[CartDetailDogItem]  WITH CHECK ADD  CONSTRAINT [FK_CartDetailDogItem_CartDetail_cartDetailsCartDetailId] FOREIGN KEY([cartDetailsCartDetailId])
REFERENCES [dbo].[CartDetail] ([CartDetailId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetailDogItem] CHECK CONSTRAINT [FK_CartDetailDogItem_CartDetail_cartDetailsCartDetailId]
GO
ALTER TABLE [dbo].[CartDetailDogItem]  WITH CHECK ADD  CONSTRAINT [FK_CartDetailDogItem_DogItem_dogItemsDogItemId] FOREIGN KEY([dogItemsDogItemId])
REFERENCES [dbo].[DogItem] ([DogItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetailDogItem] CHECK CONSTRAINT [FK_CartDetailDogItem_DogItem_dogItemsDogItemId]
GO
ALTER TABLE [dbo].[CartDetailDogProductItem]  WITH CHECK ADD  CONSTRAINT [FK_CartDetailDogProductItem_CartDetail_cartDetailsCartDetailId] FOREIGN KEY([cartDetailsCartDetailId])
REFERENCES [dbo].[CartDetail] ([CartDetailId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetailDogProductItem] CHECK CONSTRAINT [FK_CartDetailDogProductItem_CartDetail_cartDetailsCartDetailId]
GO
ALTER TABLE [dbo].[CartDetailDogProductItem]  WITH CHECK ADD  CONSTRAINT [FK_CartDetailDogProductItem_DogProductItem_dogProductItemsDogProductItemId] FOREIGN KEY([dogProductItemsDogProductItemId])
REFERENCES [dbo].[DogProductItem] ([DogProductItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetailDogProductItem] CHECK CONSTRAINT [FK_CartDetailDogProductItem_DogProductItem_dogProductItemsDogProductItemId]
GO
ALTER TABLE [dbo].[DogItem]  WITH CHECK ADD  CONSTRAINT [FK_DogItem_DogSpecies_DogSpeciesId] FOREIGN KEY([DogSpeciesId])
REFERENCES [dbo].[DogSpecies] ([DogSpeciesId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DogItem] CHECK CONSTRAINT [FK_DogItem_DogSpecies_DogSpeciesId]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Order_OrderId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShipInfo_ShipInfoId] FOREIGN KEY([ShipInfoId])
REFERENCES [dbo].[ShipInfo] ([ShipInfoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShipInfo_ShipInfoId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_DogItem_DogItemId] FOREIGN KEY([DogItemId])
REFERENCES [dbo].[DogItem] ([DogItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_DogItem_DogItemId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_DogProductItem_DogProductItemId] FOREIGN KEY([DogProductItemId])
REFERENCES [dbo].[DogProductItem] ([DogProductItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_DogProductItem_DogProductItemId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
USE [master]
GO
ALTER DATABASE [PetShop] SET  READ_WRITE 
GO
