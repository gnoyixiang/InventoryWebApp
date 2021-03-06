USE [master]
GO
/****** Object:  Database [Team8_SSIS]    Script Date: 2/5/2018 9:21:57 PM ******/
CREATE DATABASE [Team8_SSIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Team8_SSIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Team8_SSIS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Team8_SSIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Team8_SSIS_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Team8_SSIS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Team8_SSIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Team8_SSIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Team8_SSIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Team8_SSIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Team8_SSIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Team8_SSIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Team8_SSIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Team8_SSIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Team8_SSIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Team8_SSIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Team8_SSIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Team8_SSIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Team8_SSIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Team8_SSIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Team8_SSIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Team8_SSIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Team8_SSIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Team8_SSIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Team8_SSIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Team8_SSIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Team8_SSIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Team8_SSIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Team8_SSIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Team8_SSIS] SET RECOVERY FULL 
GO
ALTER DATABASE [Team8_SSIS] SET  MULTI_USER 
GO
ALTER DATABASE [Team8_SSIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Team8_SSIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Team8_SSIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Team8_SSIS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Team8_SSIS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Team8_SSIS', N'ON'
GO
USE [Team8_SSIS]
GO
/****** Object:  Table [dbo].[Adjustment]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjustment](
	[AdjustmentCode] [nvarchar](20) NOT NULL,
	[ItemCode] [nvarchar](20) NULL,
	[AdjustmentQuant] [int] NULL,
	[DateCreated] [date] NULL,
	[DateApproved] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Notes] [nvarchar](200) NULL,
	[Reason] [nvarchar](200) NULL,
	[HeadRemarks] [nvarchar](200) NULL,
	[UserName] [nvarchar](256) NULL,
	[ApprovedBy] [nvarchar](256) NULL,
 CONSTRAINT [PK_Adjustment] PRIMARY KEY CLUSTERED 
(
	[AdjustmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignRole]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignRole](
	[AssignRoleCode] [nvarchar](20) NOT NULL,
	[TemporaryRoleCode] [nvarchar](128) NULL,
	[EmployeeCode] [nvarchar](20) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[AssignedBy] [nvarchar](256) NULL,
 CONSTRAINT [PK_AssignRole] PRIMARY KEY CLUSTERED 
(
	[AssignRoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryCode] [nvarchar](20) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CollectionPoint]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionPoint](
	[CollectionPointCode] [nvarchar](20) NOT NULL,
	[CollectionVenue] [nvarchar](100) NULL,
	[CollectionTime] [time](7) NULL,
	[SClerkInCharge] [nvarchar](20) NULL,
 CONSTRAINT [PK_CollectionPoint] PRIMARY KEY CLUSTERED 
(
	[CollectionPointCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentCode] [nvarchar](20) NOT NULL,
	[DepartmentName] [nvarchar](100) NULL,
	[CollectionPointCode] [nvarchar](20) NULL,
	[Contact_Name] [nvarchar](50) NULL,
	[TelephoneNo] [nvarchar](50) NULL,
	[FaxNo] [nvarchar](50) NULL,
	[HeadCode] [nvarchar](20) NULL,
	[RepresentativeCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disbursement]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disbursement](
	[DisbursementCode] [nvarchar](20) NOT NULL,
	[DateCreated] [date] NULL,
	[Status] [nvarchar](20) NULL CONSTRAINT [DF_Disbursement_Status]  DEFAULT ('not disbursed'),
	[DepartmentCode] [nvarchar](20) NULL,
	[DateDisbursed] [date] NULL,
	[Notes] [nvarchar](200) NULL,
	[UserName] [nvarchar](256) NULL,
	[ReceivedBy] [nvarchar](256) NULL,
	[CollectionPointCode] [nvarchar](20) NULL,
	[DatePlanToCollect] [date] NULL,
 CONSTRAINT [PK_Disbursement] PRIMARY KEY CLUSTERED 
(
	[DisbursementCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisbursementDetail]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisbursementDetail](
	[DisbursementCode] [nvarchar](20) NOT NULL,
	[RequestCode] [nvarchar](20) NOT NULL,
	[ItemCode] [nvarchar](20) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Notes] [nvarchar](200) NULL,
	[ActualQuantity] [int] NULL,
 CONSTRAINT [PK_DisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[DisbursementCode] ASC,
	[RequestCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeCode] [nvarchar](20) NOT NULL,
	[ReportTo] [nvarchar](20) NULL,
	[DepartmentCode] [nvarchar](20) NULL,
	[CurrentRoleCode] [nvarchar](128) NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[EmployeeTitle] [nvarchar](10) NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PODetail]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODetail](
	[ItemCode] [nvarchar](20) NOT NULL CONSTRAINT [DF_PODetail_ItemCode]  DEFAULT ('pending'),
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[PurchaseOrderCode] [nvarchar](20) NOT NULL,
	[Notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_PODetail_1] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[PurchaseOrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderCode] [nvarchar](20) NOT NULL,
	[DateCreated] [date] NULL,
	[DateApproved] [date] NULL,
	[Notes] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NULL CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT ('pending'),
	[SupplierCode] [nvarchar](20) NULL,
	[DateReceived] [date] NULL,
	[DateSupplyExpected] [date] NULL,
	[HeadRemarks] [nvarchar](200) NULL,
	[ApprovedBy] [nvarchar](256) NULL,
	[UserName] [nvarchar](256) NULL,
	[ReceivedBy] [nvarchar](256) NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[DateLastUpdated] [date] NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestCode] [nvarchar](20) NOT NULL,
	[DepartmentCode] [nvarchar](20) NULL,
	[DateCreated] [date] NULL,
	[DateApproved] [date] NULL,
	[Status] [nvarchar](50) NULL CONSTRAINT [DF_Request_Status]  DEFAULT ('pending'),
	[Notes] [nvarchar](200) NULL,
	[HeadRemarks] [nvarchar](200) NULL,
	[UserName] [nvarchar](256) NULL,
	[ApprovedBy] [nvarchar](256) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestDetail]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetail](
	[RequestCode] [nvarchar](20) NOT NULL,
	[ItemCode] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](50) NULL CONSTRAINT [DF_RequestDetail_Status]  DEFAULT (''),
	[RemainingQuant] [int] NULL,
	[Quantity] [int] NULL,
	[Notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_RequestDetail_1] PRIMARY KEY CLUSTERED 
(
	[RequestCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Retrieval]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retrieval](
	[RetrievalCode] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](50) NULL CONSTRAINT [DF_Retrieval_Status]  DEFAULT ('retrieving'),
	[Notes] [nvarchar](200) NULL,
	[DateRetrieved] [date] NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Retrieval] PRIMARY KEY CLUSTERED 
(
	[RetrievalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RetrievalDetails]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetrievalDetails](
	[ItemCode] [nvarchar](20) NOT NULL,
	[QuantityRetrieved] [int] NULL,
	[Notes] [nvarchar](200) NULL,
	[RetrievalCode] [nvarchar](20) NOT NULL,
	[QuantityNeeded] [int] NULL,
 CONSTRAINT [PK_RetrievalDetails] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[RetrievalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StationeryCatalogue]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationeryCatalogue](
	[ItemCode] [nvarchar](20) NOT NULL,
	[CategoryCode] [nvarchar](20) NULL,
	[Description] [nvarchar](100) NULL,
	[ReorderLevel] [int] NULL,
	[ReorderQuantity] [int] NULL,
	[MeasureUnit] [nvarchar](10) NULL,
	[Price] [decimal](18, 2) NULL,
	[Stock] [int] NULL,
	[Supplier1] [nvarchar](20) NULL,
	[Supplier2] [nvarchar](20) NULL,
	[Supplier3] [nvarchar](20) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_StationeryCatalogue] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierCode] [nvarchar](20) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[ContactTitle] [nvarchar](10) NULL,
	[ContactName] [nvarchar](100) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[FaxNo] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[GSTRegistrationNo] [nvarchar](50) NULL,
	[Notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierDetail]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierDetail](
	[SupplierCode] [nvarchar](20) NOT NULL,
	[ItemCode] [nvarchar](20) NOT NULL,
	[Price] [decimal](18, 2) NULL CONSTRAINT [DF_SupplierDetail_Price]  DEFAULT ((1)),
 CONSTRAINT [PK_SupplierDetail] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tender]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender](
	[TenderCode] [nvarchar](20) NOT NULL,
	[SupplierCode] [nvarchar](20) NULL,
	[DateCreated] [date] NULL,
	[Notes] [nvarchar](200) NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Tender] PRIMARY KEY CLUSTERED 
(
	[TenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenderDetails]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderDetails](
	[TenderCode] [nvarchar](20) NOT NULL,
	[ItemCode] [nvarchar](20) NOT NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TenderDetails] PRIMARY KEY CLUSTERED 
(
	[TenderCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](512) NULL,
	[SecurityStamp] [nvarchar](512) NULL,
	[PhoneNumber] [nvarchar](128) NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaim]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/5/2018 9:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserRole2] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'123456', N'Rep', N'11003', NULL, NULL, N'chia')
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'1234561', N'Rep', N'11024', NULL, NULL, N'tan')
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'1234562', N'Rep', N'11014', NULL, NULL, N'low')
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'123458', N'Rep', N'11008', NULL, NULL, N'ezra')
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'AS180205145420442', N'Rep', N'11006', NULL, NULL, NULL)
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'AS20180204141418935', N'ActHead', N'11015', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-07' AS Date), N'low')
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'AS20180205154444148', N'Rep', N'11011', NULL, NULL, NULL)
INSERT [dbo].[AssignRole] ([AssignRoleCode], [TemporaryRoleCode], [EmployeeCode], [StartDate], [EndDate], [AssignedBy]) VALUES (N'AS20180205154504842', N'ActHead', N'11012', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-08' AS Date), N'liong')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Clip', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Envelope', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Eraser', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Excercise', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'File', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Pad', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Paper', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Pen', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Puncher', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Ruler', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Scissors', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Sharpener', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Shorthand', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Stapler', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Tacks', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Tape', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Tparency', NULL)
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'Tray', NULL)
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'ENGSCH', N'Engineering School', CAST(N'11:00:00' AS Time), N'11018')
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'MANSCH', N'Management School', CAST(N'11:00:00' AS Time), N'11019')
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'MEDSCH', N'Medical School', CAST(N'09:30:00' AS Time), N'11020')
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'SCISCH', N'Science School', CAST(N'09:30:00' AS Time), N'11021')
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'STATSTO', N'Stationery Store - Administration Building', CAST(N'09:30:00' AS Time), N'11018')
INSERT [dbo].[CollectionPoint] ([CollectionPointCode], [CollectionVenue], [CollectionTime], [SClerkInCharge]) VALUES (N'UNIHOS', N'University Hospital', CAST(N'11:00:00' AS Time), N'11019')
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'COMM', N'Commerce Dept', N'SCISCH', N'Mr Mohd. Azman', N'874 1284', N'892 1256', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'CPSC', N'Computer Science', N'STATSTO', N'Mr Wee Kian Fatt', N'890 1235', N'892 1457', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'ENGL', N'English Dept', N'MANSCH', N'Mrs Pamela Kow', N'874 2234', N'892 1456', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'ISS1', N'Institute of Systems Science', N'MANSCH', N'Mrs Esther Tan', N'892 2382', N'871 3482', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'REGR', N'Registrar Dept', N'UNIHOS', N'Ms Helen Ho', N'890 1266', N'892 1465', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'STOR', N'Stationery Store', N'UNIHOS', N'Mr. Amit Mohanty', N'839 3942', N'827 3943', NULL, NULL)
INSERT [dbo].[Department] ([DepartmentCode], [DepartmentName], [CollectionPointCode], [Contact_Name], [TelephoneNo], [FaxNo], [HeadCode], [RepresentativeCode]) VALUES (N'ZOOL', N'Zoology Dept', N'MEDSCH', N'Mr. Peter Tan Ah Meng', N'890 1266', N'892 1465', NULL, NULL)
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551550', NULL, N'disbursed', N'COMM', CAST(N'2018-02-05' AS Date), NULL, NULL, N'tracy', N'SCISCH', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551551', NULL, N'disbursed', N'REGR', CAST(N'2018-02-05' AS Date), NULL, NULL, N'anni', N'UNIHOS', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551552', NULL, N'disbursed', N'ISS1', CAST(N'2018-02-05' AS Date), NULL, NULL, N'khaing', N'ENGSCH', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551553', NULL, N'disbursed', N'ENGL', CAST(N'2018-02-05' AS Date), NULL, NULL, N'balaji', N'MANSCH', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551554', NULL, N'disbursed', N'ZOOL', CAST(N'2018-02-05' AS Date), NULL, NULL, N'dongchen', N'MEDSCH', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050201551555', NULL, N'disbursed', N'CPSC', CAST(N'2018-02-05' AS Date), NULL, NULL, N'yuenkwan', N'STATSTO', CAST(N'2018-02-07' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050345200640', NULL, N'disbursing', N'COMM', NULL, NULL, NULL, NULL, N'SCISCH', CAST(N'2018-02-06' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050345200641', NULL, N'disbursing', N'ZOOL', NULL, NULL, NULL, NULL, N'MEDSCH', CAST(N'2018-02-06' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050345200642', NULL, N'disbursed', N'ISS1', CAST(N'2018-02-05' AS Date), NULL, NULL, N'amit', N'MANSCH', CAST(N'2018-02-06' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050345200643', NULL, N'disbursing', N'ENGL', NULL, NULL, NULL, NULL, N'MANSCH', CAST(N'2018-02-06' AS Date))
INSERT [dbo].[Disbursement] ([DisbursementCode], [DateCreated], [Status], [DepartmentCode], [DateDisbursed], [Notes], [UserName], [ReceivedBy], [CollectionPointCode], [DatePlanToCollect]) VALUES (N'DBM1802050345200644', NULL, N'disbursing', N'CPSC', NULL, NULL, NULL, NULL, N'STATSTO', CAST(N'2018-02-06' AS Date))
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'C001', CAST(0.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'C006', CAST(2.50 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'E001', CAST(0.30 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'E004', CAST(0.35 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'H011', CAST(2.00 AS Decimal(18, 2)), 35, NULL, 35)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202204124409', N'S040', CAST(3.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202211558736', N'C004', CAST(1.50 AS Decimal(18, 2)), 15, NULL, 15)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180202211558736', N'P035', CAST(15.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'C001', CAST(0.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'E001', CAST(0.30 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'E020', CAST(1.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'E033', CAST(4.50 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'E036', CAST(3.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'F031', CAST(3.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'F035', CAST(3.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'H012', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'H014', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'H033', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'P012', CAST(3.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'P020', CAST(15.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'P036', CAST(20.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'P039', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'R001', CAST(7.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'S011', CAST(260.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'S021', CAST(2.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'S101', CAST(1.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'T001', CAST(30.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'T021', CAST(10.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'T022', CAST(10.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551550', N'RQ180204041603857', N'T100', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'C001', CAST(0.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'C002', CAST(0.60 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'C006', CAST(2.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'E002', CAST(0.30 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'E004', CAST(0.35 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180202212733946', N'E007', CAST(0.45 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'C001', CAST(0.50 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'C002', CAST(0.60 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'E001', CAST(0.30 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'E004', CAST(0.35 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'E020', CAST(1.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'F023', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'H014', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'P014', CAST(4.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'P035', CAST(15.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'P036', CAST(20.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'P046', CAST(7.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'S010', CAST(270.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'S101', CAST(1.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551551', N'RQ180204043324733', N'T100', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'C002', CAST(0.60 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'E008', CAST(0.45 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'E036', CAST(3.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'H031', CAST(7.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'P016', CAST(5.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'P036', CAST(20.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'P046', CAST(7.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212147157', N'S100', CAST(3.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212424273', N'C002', CAST(0.60 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212424273', N'C003', CAST(0.70 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212424273', N'C005', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212424273', N'E001', CAST(0.30 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180202212424273', N'E008', CAST(0.45 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'C006', CAST(2.50 AS Decimal(18, 2)), 7, NULL, 7)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'E002', CAST(0.30 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'E008', CAST(0.45 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'E021', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'E030', CAST(2.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'E032', CAST(4.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'F020', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'F024', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'H011', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'H031', CAST(7.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P016', CAST(5.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P020', CAST(15.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P021', CAST(7.50 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P030', CAST(12.00 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P033', CAST(15.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P034', CAST(15.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P040', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'P045', CAST(6.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'S010', CAST(270.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'S023', CAST(25.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'S100', CAST(3.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'T002', CAST(20.00 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551552', N'RQ180204042918679', N'T023', CAST(10.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'C001', CAST(0.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'E002', CAST(0.30 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'E020', CAST(1.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'E036', CAST(3.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'F023', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'H013', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'H033', CAST(15.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'P016', CAST(5.50 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'P021', CAST(7.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'P040', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'R002', CAST(9.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551553', N'RQ180204042515533', N'S010', CAST(270.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'C001', CAST(0.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'E004', CAST(0.35 AS Decimal(18, 2)), 50, NULL, 50)
GO
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'E005', CAST(0.40 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'E033', CAST(4.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'E034', CAST(7.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'F032', CAST(3.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'F033', CAST(3.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'H033', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'P010', CAST(2.50 AS Decimal(18, 2)), 60, NULL, 60)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'P030', CAST(12.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'P031', CAST(12.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'P040', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'P041', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'S011', CAST(260.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'S012', CAST(251.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'T001', CAST(30.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551554', N'RQ180204043833780', N'T100', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'C004', CAST(1.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E002', CAST(0.30 AS Decimal(18, 2)), 60, NULL, 60)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E004', CAST(0.35 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E006', CAST(0.40 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E020', CAST(1.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E032', CAST(4.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'E034', CAST(7.00 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'F020', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'F023', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'F031', CAST(3.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'F033', CAST(3.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'H012', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'H032', CAST(10.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'P013', CAST(4.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'P021', CAST(7.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'P034', CAST(15.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'P040', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'R001', CAST(7.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'S020', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'S041', CAST(3.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'S101', CAST(1.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'T001', CAST(30.00 AS Decimal(18, 2)), 60, NULL, 60)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'T023', CAST(10.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050201551555', N'RQ180204042221835', N'T100', CAST(15.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180202204124409', N'S040', CAST(3.00 AS Decimal(18, 2)), 15, NULL, 15)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180202211558736', N'C005', CAST(2.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180202211558736', N'H014', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180202211558736', N'S040', CAST(3.00 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180204041603857', N'E021', CAST(2.00 AS Decimal(18, 2)), 100, NULL, 100)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180204041603857', N'E033', CAST(4.50 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180204041603857', N'H014', CAST(2.00 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180204041603857', N'R001', CAST(7.00 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200640', N'RQ180204041603857', N'S040', CAST(3.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200641', N'RQ180204043833780', N'P010', CAST(2.50 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200641', N'RQ180204043833780', N'P030', CAST(12.00 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200641', N'RQ180204043833780', N'T002', CAST(20.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180204042918679', N'C006', CAST(2.50 AS Decimal(18, 2)), 3, N'defect', 0)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180204042918679', N'H031', CAST(7.00 AS Decimal(18, 2)), 40, NULL, 40)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180204042918679', N'S100', CAST(3.00 AS Decimal(18, 2)), 20, NULL, 20)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180204042918679', N'T002', CAST(20.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205151104758', N'E001', CAST(0.30 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205151104758', N'E004', CAST(0.35 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205151104758', N'S023', CAST(25.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205153524372', N'C002', CAST(0.60 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205153524372', N'F021', CAST(2.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205153524372', N'P030', CAST(12.00 AS Decimal(18, 2)), 25, NULL, 25)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205153605314', N'E002', CAST(0.30 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200642', N'RQ180205153605314', N'P039', CAST(22.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200643', N'RQ180204042515533', N'E021', CAST(2.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200643', N'RQ180204042515533', N'P016', CAST(5.50 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'C005', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'E021', CAST(2.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'E033', CAST(4.50 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'E034', CAST(7.00 AS Decimal(18, 2)), 10, NULL, 10)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'P010', CAST(2.50 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'P030', CAST(12.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'S011', CAST(260.00 AS Decimal(18, 2)), 50, NULL, 50)
INSERT [dbo].[DisbursementDetail] ([DisbursementCode], [RequestCode], [ItemCode], [Price], [Quantity], [Notes], [ActualQuantity]) VALUES (N'DBM1802050345200644', N'RQ180204042221835', N'S100', CAST(3.00 AS Decimal(18, 2)), 30, NULL, 30)
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11001', NULL, N'COMM', NULL, N'Chia Leow Bee', N'Dr', N'chia')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11002', NULL, N'COMM', NULL, N'Pham Ngoc Quynh Trang', N'Ms', N'tracy')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11003', NULL, N'COMM', NULL, N'Quan JunYe', N'Mr', N'junye')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11004', NULL, N'CPSC', NULL, N'Soh Kian Wee', N'Dr', N'soh')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11005', NULL, N'CPSC', NULL, N'Derek Kiong', N'Mr', N'derek')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11006', NULL, N'CPSC', NULL, N'Chia YuenKwan', N'Mr', N'yuenkwan')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11007', NULL, N'ENGL', NULL, N'Ezra Pound', N'Prof', N'ezra')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11008', NULL, N'ENGL', NULL, N'Balaji Mohanty', N'Mr', N'balaji')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11009', NULL, N'ENGL', NULL, N'Xavier', N'Mr', N'xavier')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11010', NULL, N'ISS1', NULL, N'Liong Choon
', N'Mr', N'liong')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11011', NULL, N'ISS1', NULL, N'Amit Mohanty', N'Mr', N'amit')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11012', NULL, N'ISS1', NULL, N'Myo Thazin Khaing', N'Ms', N'khaing')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11013', NULL, N'REGR', NULL, N'Low Kway Boo
', N'Mrs', N'low')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11014', NULL, N'REGR', NULL, N'Zhao Anni', N'Ms', N'anni')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11015', NULL, N'REGR', NULL, N'Wang YuFei', N'Ms', N'yufei')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11016', NULL, N'STOR', NULL, N'Albert Einstein
', N'Mr', N'einstein')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11017', NULL, N'STOR', NULL, N'Jennifer Laurence
', N'Ms', N'jennifer')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11018', NULL, N'STOR', NULL, N'Esther Tan', N'Dr', N'esther')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11019', NULL, N'STOR', NULL, N'Koh MengKiak', N'Mr', N'mengkiak')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11020', NULL, N'STOR', NULL, N'Tran Thi Nhu Y', N'Ms', N'nathalie')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11021', NULL, N'STOR', NULL, N'Ong YiXiang', N'Mr', N'yixiang')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11022', NULL, N'ZOOL', NULL, N'Tan', N'Prof', N'tan')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11023', NULL, N'ZOOL', NULL, N'Ton That Minh Nhat', N'Mr', N'nathan')
INSERT [dbo].[Employee] ([EmployeeCode], [ReportTo], [DepartmentCode], [CurrentRoleCode], [EmployeeName], [EmployeeTitle], [UserName]) VALUES (N'11024', NULL, N'ZOOL', NULL, N'Dong Chen
', N'Mr', N'dongchen')
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'C001', CAST(0.50 AS Decimal(18, 2)), 10000, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'C002', CAST(0.60 AS Decimal(18, 2)), 30, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'C005', CAST(2.00 AS Decimal(18, 2)), 30, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E001', CAST(0.30 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E002', CAST(0.30 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E003', CAST(0.35 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E004', CAST(0.35 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E005', CAST(0.40 AS Decimal(18, 2)), 400, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E006', CAST(0.40 AS Decimal(18, 2)), 400, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E007', CAST(0.45 AS Decimal(18, 2)), 400, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E008', CAST(0.45 AS Decimal(18, 2)), 400, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E021', CAST(2.00 AS Decimal(18, 2)), 50, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E030', CAST(2.00 AS Decimal(18, 2)), 50, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E031', CAST(2.50 AS Decimal(18, 2)), 50, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E032', CAST(4.00 AS Decimal(18, 2)), 50, N'CHEP180205110323305', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E033', CAST(4.50 AS Decimal(18, 2)), 50, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E034', CAST(7.00 AS Decimal(18, 2)), 50, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E035', CAST(3.00 AS Decimal(18, 2)), 50, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'E036', CAST(3.50 AS Decimal(18, 2)), 50, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F021', CAST(2.00 AS Decimal(18, 2)), 100, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F022', CAST(2.00 AS Decimal(18, 2)), 100, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F023', CAST(2.00 AS Decimal(18, 2)), 150, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F024', CAST(2.00 AS Decimal(18, 2)), 150, N'BANE180205110323314', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F031', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F032', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F033', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F034', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'F035', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'H011', CAST(2.00 AS Decimal(18, 2)), 80, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'H012', CAST(2.00 AS Decimal(18, 2)), 80, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'H013', CAST(2.00 AS Decimal(18, 2)), 80, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'H014', CAST(2.00 AS Decimal(18, 2)), 80, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'H031', CAST(7.00 AS Decimal(18, 2)), 20, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P010', CAST(2.50 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P011', CAST(3.00 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P012', CAST(3.50 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P013', CAST(4.00 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P014', CAST(4.50 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P016', CAST(5.50 AS Decimal(18, 2)), 60, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P020', CAST(15.00 AS Decimal(18, 2)), 500, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P021', CAST(7.50 AS Decimal(18, 2)), 500, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P030', CAST(12.00 AS Decimal(18, 2)), 50, N'OMEG180205110323324', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P031', CAST(12.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P032', CAST(12.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P033', CAST(15.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P034', CAST(15.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P035', CAST(15.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P036', CAST(20.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P037', CAST(20.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P038', CAST(22.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P039', CAST(22.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P040', CAST(22.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P041', CAST(22.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P042', CAST(6.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P043', CAST(7.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P044', CAST(6.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P045', CAST(6.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'P046', CAST(7.00 AS Decimal(18, 2)), 50, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'S010', CAST(270.00 AS Decimal(18, 2)), 80, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'S011', CAST(260.00 AS Decimal(18, 2)), 80, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'S012', CAST(251.00 AS Decimal(18, 2)), 80, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T020', CAST(10.00 AS Decimal(18, 2)), 200, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T021', CAST(10.00 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T022', CAST(10.00 AS Decimal(18, 2)), 200, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T023', CAST(10.00 AS Decimal(18, 2)), 200, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T024', CAST(10.00 AS Decimal(18, 2)), 200, N'ALPA180205110323294', NULL)
INSERT [dbo].[PODetail] ([ItemCode], [Price], [Quantity], [PurchaseOrderCode], [Notes]) VALUES (N'T025', CAST(15.00 AS Decimal(18, 2)), 400, N'ALPA180205110323294', NULL)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderCode], [DateCreated], [DateApproved], [Notes], [Status], [SupplierCode], [DateReceived], [DateSupplyExpected], [HeadRemarks], [ApprovedBy], [UserName], [ReceivedBy], [LastUpdatedBy], [DateLastUpdated]) VALUES (N'ALPA180205110323294', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, N'RECEIVED', N'ALPA', CAST(N'2018-02-05' AS Date), NULL, NULL, N'jennifer', N'esther', N'esther', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderCode], [DateCreated], [DateApproved], [Notes], [Status], [SupplierCode], [DateReceived], [DateSupplyExpected], [HeadRemarks], [ApprovedBy], [UserName], [ReceivedBy], [LastUpdatedBy], [DateLastUpdated]) VALUES (N'BANE180205110323314', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, N'RECEIVED', N'BANE', CAST(N'2018-02-05' AS Date), NULL, NULL, N'jennifer', N'esther', N'esther', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderCode], [DateCreated], [DateApproved], [Notes], [Status], [SupplierCode], [DateReceived], [DateSupplyExpected], [HeadRemarks], [ApprovedBy], [UserName], [ReceivedBy], [LastUpdatedBy], [DateLastUpdated]) VALUES (N'CHEP180205110323305', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, N'RECEIVED', N'CHEP', CAST(N'2018-02-05' AS Date), NULL, NULL, N'jennifer', N'esther', N'esther', NULL, NULL)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderCode], [DateCreated], [DateApproved], [Notes], [Status], [SupplierCode], [DateReceived], [DateSupplyExpected], [HeadRemarks], [ApprovedBy], [UserName], [ReceivedBy], [LastUpdatedBy], [DateLastUpdated]) VALUES (N'OMEG180205110323324', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, N'RECEIVED', N'OMEG', CAST(N'2018-02-05' AS Date), NULL, NULL, N'jennifer', N'esther', N'esther', NULL, NULL)
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180202204124409', N'COMM', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-02' AS Date), N'incompleted', NULL, NULL, N'tracy', N'chia')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180202211558736', N'COMM', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-04' AS Date), N'processing', NULL, NULL, N'junye', N'chia')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180202212147157', N'ISS1', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-02' AS Date), N'completed', NULL, N'Good', N'amit', N'liong')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180202212424273', N'ISS1', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-02' AS Date), N'completed', NULL, N'Hello World', N'khaing', N'liong')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180202212733946', N'REGR', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-02' AS Date), N'completed', NULL, N'Go ahead', N'yufei', N'low')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204041603857', N'COMM', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'processing', NULL, NULL, N'tracy', N'chia')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204042221835', N'CPSC', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'processing', NULL, NULL, N'derek', N'Soh')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204042515533', N'ENGL', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'processing', NULL, NULL, N'xavier', N'ezra')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204042918679', N'ISS1', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'incompleted', NULL, NULL, N'amit', N'liong')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204043324733', N'REGR', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'completed', NULL, NULL, N'yufei', N'yufei')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180204043833780', N'ZOOL', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-04' AS Date), N'incompleted', NULL, NULL, N'nathan', N'tan')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180205141723676', N'COMM', CAST(N'2018-02-05' AS Date), NULL, N'pending', NULL, NULL, N'junye', NULL)
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180205150855403', N'ISS1', CAST(N'2018-02-05' AS Date), NULL, N'rejected', NULL, N'Reject', N'amit', NULL)
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180205151104758', N'ISS1', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), N'completed', NULL, NULL, N'khaing', N'liong')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180205153524372', N'ISS1', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), N'completed', NULL, NULL, N'khaing', N'liong')
INSERT [dbo].[Request] ([RequestCode], [DepartmentCode], [DateCreated], [DateApproved], [Status], [Notes], [HeadRemarks], [UserName], [ApprovedBy]) VALUES (N'RQ180205153605314', N'ISS1', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), N'completed', NULL, NULL, N'khaing', N'liong')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'C001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'C006', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'E001', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'E004', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'H011', N'completed', 0, 35, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202204124409', N'S040', N'incompleted', 15, 25, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202211558736', N'C004', N'completed', 0, 15, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202211558736', N'C005', NULL, 10, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202211558736', N'H014', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202211558736', N'P035', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202211558736', N'S040', NULL, 40, 40, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'C002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'E008', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'E036', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'H031', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'P016', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'P036', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'P046', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212147157', N'S100', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212424273', N'C002', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212424273', N'C003', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212424273', N'C005', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212424273', N'E001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212424273', N'E008', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'C001', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'C002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'C006', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'E002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'E004', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180202212733946', N'E007', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'C001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'E001', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'E020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'E021', NULL, 100, 100, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'E033', N'incompleted', 40, 60, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'E036', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'F031', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'F035', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'H012', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'H014', N'incompleted', 20, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'H033', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'P012', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'P020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'P036', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'P039', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'R001', N'incompleted', 20, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'S011', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'S021', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'S040', NULL, 50, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'S101', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'T001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'T021', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'T022', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204041603857', N'T100', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'C004', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'C005', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E002', N'completed', 0, 60, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E004', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E006', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E020', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E021', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E032', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E033', NULL, 50, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'E034', N'incompleted', 10, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'F020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'F023', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'F031', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'F033', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'H012', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'H032', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P010', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P013', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P021', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P030', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P034', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'P040', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'R001', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'S011', NULL, 50, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'S020', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'S041', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'S100', NULL, 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'S101', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'T001', N'completed', 0, 60, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'T023', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042221835', N'T100', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'C001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'E002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'E020', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'E021', NULL, 10, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'E036', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'F023', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'H013', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'H033', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'P016', N'incompleted', 10, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'P021', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'P040', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'R002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042515533', N'S010', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'C006', N'incompleted', 3, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'E002', N'completed', 0, 30, N'')
GO
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'E008', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'E021', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'E030', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'E032', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'F020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'F024', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'H011', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'H031', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P016', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P021', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P030', N'completed', 0, 40, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P033', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P034', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P040', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'P045', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'S010', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'S023', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'S100', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'T002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204042918679', N'T023', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'C001', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'C002', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'E001', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'E004', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'E020', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'F023', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'H014', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'P014', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'P035', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'P036', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'P046', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'S010', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'S101', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043324733', N'T100', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'C001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'E004', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'E005', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'E033', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'E034', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'F032', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'F033', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'H033', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'P010', N'incompleted', 40, 100, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'P030', N'incompleted', 40, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'P031', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'P040', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'P041', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'S011', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'S012', N'completed', 0, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'T001', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'T002', NULL, 50, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180204043833780', N'T100', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205141723676', N'C004', NULL, 80, 80, NULL)
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205141723676', N'E001', NULL, 21, 21, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205141723676', N'T100', NULL, 50, 50, NULL)
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205150855403', N'E002', N'rejected', 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205150855403', N'H011', N'rejected', 30, 30, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205151104758', N'E001', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205151104758', N'E004', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205151104758', N'S023', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205153524372', N'C002', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205153524372', N'F021', N'completed', 0, 50, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205153524372', N'P030', N'completed', 0, 25, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205153605314', N'E002', N'completed', 0, 10, N'')
INSERT [dbo].[RequestDetail] ([RequestCode], [ItemCode], [Status], [RemainingQuant], [Quantity], [Notes]) VALUES (N'RQ180205153605314', N'P039', N'completed', 0, 50, N'')
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180202213132120', N'retrieved', NULL, CAST(N'2018-02-02' AS Date), N'nathalie')
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180202232717047', N'retrieved', NULL, CAST(N'2018-02-02' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180203090130986', N'retrieved', NULL, CAST(N'2018-02-03' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180203090530342', N'retrieved', NULL, CAST(N'2018-02-03' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204100326979', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204115626345', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204142643349', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204143206153', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204152213524', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204152322467', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204160846813', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204193220410', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204195846851', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204210726287', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180204211715500', N'retrieved', NULL, CAST(N'2018-02-04' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205090931663', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205091243521', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205095646840', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205105435578', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205110608761', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205140147475', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[Retrieval] ([RetrievalCode], [Status], [Notes], [DateRetrieved], [UserName]) VALUES (N'RT180205154519102', N'retrieved', NULL, CAST(N'2018-02-05' AS Date), NULL)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 80, NULL, N'RT180202213132120', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 75, N'5 spoiled', N'RT180202232717047', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 80, NULL, N'RT180203090130986', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 80, N'', N'RT180203090530342', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, N'', N'RT180204143206153', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, N'', N'RT180204152322467', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, N'', N'RT180204160846813', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, N'', N'RT180204193220410', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, NULL, N'RT180204195846851', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, NULL, N'RT180204210726287', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, NULL, N'RT180204211715500', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', -25, NULL, N'RT180205090931663', -25)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 10, NULL, N'RT180205091243521', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 70, NULL, N'RT180205095646840', 170)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 60, N'5 feb', N'RT180205105435578', 2170)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 2000, N'', N'RT180205110608761', 2000)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C001', 240, N'', N'RT180205140147475', 240)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 110, NULL, N'RT180202213132120', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 110, N'', N'RT180202232717047', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 110, NULL, N'RT180203090130986', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 110, N'', N'RT180203090530342', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 50, NULL, N'RT180204210726287', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 5, NULL, N'RT180204211715500', 5)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', -30, NULL, N'RT180205090931663', -30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 14, NULL, N'RT180205091243521', 14)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 20, NULL, N'RT180205095646840', 44)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 20, NULL, N'RT180205105435578', 44)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 140, N'', N'RT180205140147475', 140)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C002', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, NULL, N'RT180204210726287', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C003', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C004', 15, NULL, N'RT180204210726287', 15)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C004', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C004', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C004', 45, N'', N'RT180205140147475', 45)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, NULL, N'RT180202213132120', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, N'', N'RT180202232717047', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, NULL, N'RT180203090130986', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, N'', N'RT180203090530342', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, NULL, N'RT180204210726287', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 50, N'', N'RT180205140147475', 90)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C005', 40, NULL, N'RT180205154519102', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 40, NULL, N'RT180202213132120', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 40, N'', N'RT180202232717047', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 40, NULL, N'RT180203090130986', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 40, N'', N'RT180203090530342', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', -30, NULL, N'RT180205090931663', -30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 13, NULL, N'RT180205091243521', 13)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 23, NULL, N'RT180205095646840', 23)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 23, NULL, N'RT180205105435578', 23)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 47, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'C006', 3, NULL, N'RT180205154519102', 3)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 60, NULL, N'RT180202213132120', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 60, N'', N'RT180202232717047', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 60, NULL, N'RT180203090130986', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 60, N'', N'RT180203090530342', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 40, NULL, N'RT180205095646840', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 90, N'5 feb', N'RT180205105435578', 2040)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 410, N'', N'RT180205110608761', 2000)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 100, N'', N'RT180205140147475', 100)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E001', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', -30, NULL, N'RT180205090931663', -30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 14, NULL, N'RT180205091243521', 14)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 70, NULL, N'RT180205095646840', 134)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 70, NULL, N'RT180205105435578', 134)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 150, N'', N'RT180205140147475', 150)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E002', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E003', 50, NULL, N'RT180204210726287', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 40, NULL, N'RT180202213132120', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 40, N'', N'RT180202232717047', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 40, NULL, N'RT180203090130986', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 40, N'', N'RT180203090530342', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', -30, NULL, N'RT180205090931663', -30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 12, NULL, N'RT180205091243521', 12)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 70, NULL, N'RT180205095646840', 122)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 70, NULL, N'RT180205105435578', 122)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 150, N'', N'RT180205140147475', 150)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E004', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E005', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E005', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E005', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E006', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E006', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E006', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, NULL, N'RT180202213132120', 30)
GO
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, NULL, N'RT180204100326979', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', -30, NULL, N'RT180205090931663', -30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 23, NULL, N'RT180205091243521', 23)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 23, NULL, N'RT180205095646840', 23)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 23, NULL, N'RT180205105435578', 23)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E007', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 60, NULL, N'RT180202213132120', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 60, N'', N'RT180202232717047', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 60, NULL, N'RT180203090130986', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 60, N'', N'RT180203090530342', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E008', 90, N'', N'RT180205140147475', 90)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E020', 100, NULL, N'RT180205095646840', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E020', 100, NULL, N'RT180205105435578', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E020', 120, N'', N'RT180205140147475', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E021', 100, NULL, N'RT180205095646840', 190)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E021', 100, NULL, N'RT180205105435578', 190)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E021', 50, N'', N'RT180205140147475', 190)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E021', 140, NULL, N'RT180205154519102', 140)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E030', 10, NULL, N'RT180205095646840', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E030', 10, NULL, N'RT180205105435578', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E030', 10, N'', N'RT180205140147475', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E032', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E032', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E032', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E033', 100, NULL, N'RT180205095646840', 140)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E033', 100, NULL, N'RT180205105435578', 140)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E033', 50, N'', N'RT180205140147475', 140)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E033', 90, NULL, N'RT180205154519102', 90)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E034', 80, NULL, N'RT180205095646840', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E034', 80, NULL, N'RT180205105435578', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E034', 70, N'', N'RT180205140147475', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E034', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 100, NULL, N'RT180205095646840', 100)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 100, NULL, N'RT180205105435578', 100)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'E036', 130, N'', N'RT180205140147475', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F020', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F020', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F020', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F021', 50, NULL, N'RT180205154519102', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F023', 100, NULL, N'RT180205095646840', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F023', 100, NULL, N'RT180205105435578', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F023', 130, N'', N'RT180205140147475', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F024', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F024', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F024', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F031', 80, NULL, N'RT180205095646840', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F031', 80, NULL, N'RT180205105435578', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F031', 80, N'', N'RT180205140147475', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F032', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F032', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F032', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F033', 80, NULL, N'RT180205095646840', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F033', 80, NULL, N'RT180205105435578', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F033', 80, N'', N'RT180205140147475', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F035', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F035', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'F035', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 35, NULL, N'RT180202213132120', 35)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 35, N'', N'RT180202232717047', 35)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 35, NULL, N'RT180203090130986', 35)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 35, N'', N'RT180203090530342', 35)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H011', 85, N'', N'RT180205140147475', 85)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H012', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H012', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H012', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H013', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H013', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H013', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H014', 30, NULL, N'RT180204210726287', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H014', 70, NULL, N'RT180205095646840', 100)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H014', 70, NULL, N'RT180205105435578', 100)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H014', 80, N'', N'RT180205140147475', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H014', 50, NULL, N'RT180205154519102', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 10, NULL, N'RT180202213132120', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 10, N'', N'RT180202232717047', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 10, NULL, N'RT180203090130986', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 10, N'', N'RT180203090530342', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 20, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 20, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 20, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H031', 40, NULL, N'RT180205154519102', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H032', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H032', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H032', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H033', 100, NULL, N'RT180205095646840', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H033', 100, NULL, N'RT180205105435578', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'H033', 110, N'', N'RT180205140147475', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P010', 100, NULL, N'RT180205095646840', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P010', 100, NULL, N'RT180205105435578', 130)
GO
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P010', 60, N'', N'RT180205140147475', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P010', 70, NULL, N'RT180205154519102', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P012', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P012', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P012', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P013', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P013', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P013', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P014', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P014', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P014', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 50, NULL, N'RT180202213132120', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 50, N'', N'RT180202232717047', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 50, NULL, N'RT180203090130986', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 50, N'', N'RT180203090530342', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 100, N'', N'RT180205140147475', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P016', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P020', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P020', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P020', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P021', 70, NULL, N'RT180205095646840', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P021', 70, NULL, N'RT180205105435578', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P021', 70, N'', N'RT180205140147475', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P030', 100, NULL, N'RT180205095646840', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P030', 100, NULL, N'RT180205105435578', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P030', 50, N'', N'RT180205140147475', 120)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P030', 95, NULL, N'RT180205154519102', 95)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P031', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P031', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P031', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P033', 10, NULL, N'RT180205095646840', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P033', 10, NULL, N'RT180205105435578', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P033', 10, N'', N'RT180205140147475', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P034', 20, NULL, N'RT180205095646840', 20)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P034', 20, NULL, N'RT180205105435578', 20)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P034', 20, N'', N'RT180205140147475', 20)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P035', 10, NULL, N'RT180204210726287', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P035', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P035', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P035', 40, N'', N'RT180205140147475', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P036', 90, N'', N'RT180205140147475', 90)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P039', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P039', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P039', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P039', 50, NULL, N'RT180205154519102', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P040', 100, NULL, N'RT180205095646840', 200)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P040', 100, NULL, N'RT180205105435578', 200)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P040', 200, N'', N'RT180205140147475', 200)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P041', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P041', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P041', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P045', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P045', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P045', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'P046', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R001', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R001', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R001', 40, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R001', 20, NULL, N'RT180205154519102', 20)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R002', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R002', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'R002', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S010', 70, NULL, N'RT180205095646840', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S010', 70, NULL, N'RT180205105435578', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S010', 70, N'', N'RT180205140147475', 70)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S011', 100, NULL, N'RT180205095646840', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S011', 100, NULL, N'RT180205105435578', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S011', 80, N'', N'RT180205140147475', 130)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S011', 50, NULL, N'RT180205154519102', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S012', 30, NULL, N'RT180205095646840', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S012', 30, NULL, N'RT180205105435578', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S012', 30, N'', N'RT180205140147475', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S020', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S020', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S020', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S021', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S021', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S021', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S023', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S023', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S023', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S023', 10, NULL, N'RT180205154519102', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 25, NULL, N'RT180202213132120', 25)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 25, N'', N'RT180202232717047', 25)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 25, NULL, N'RT180203090130986', 25)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 25, N'', N'RT180203090530342', 25)
GO
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 40, NULL, N'RT180204210726287', 40)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 10, N'', N'RT180205140147475', 115)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S040', 105, NULL, N'RT180205154519102', 105)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S041', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S041', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S041', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 30, NULL, N'RT180202213132120', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 30, N'', N'RT180202232717047', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 30, NULL, N'RT180203090130986', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 30, N'', N'RT180203090530342', 30)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 40, N'', N'RT180205140147475', 90)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S100', 50, NULL, N'RT180205154519102', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S101', 100, NULL, N'RT180205095646840', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S101', 100, NULL, N'RT180205105435578', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'S101', 110, N'', N'RT180205140147475', 110)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T001', 100, NULL, N'RT180205095646840', 160)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T001', 100, NULL, N'RT180205105435578', 160)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T001', 160, N'', N'RT180205140147475', 160)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T002', 80, NULL, N'RT180205095646840', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T002', 80, NULL, N'RT180205105435578', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T002', 20, N'', N'RT180205140147475', 80)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T002', 60, NULL, N'RT180205154519102', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T021', 50, NULL, N'RT180205095646840', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T021', 50, NULL, N'RT180205105435578', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T021', 50, N'', N'RT180205140147475', 50)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T022', 10, NULL, N'RT180205095646840', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T022', 10, NULL, N'RT180205105435578', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T022', 10, N'', N'RT180205140147475', 10)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T023', 60, NULL, N'RT180205095646840', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T023', 60, NULL, N'RT180205105435578', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T023', 60, N'', N'RT180205140147475', 60)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T100', 150, NULL, N'RT180205095646840', 200)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T100', 150, NULL, N'RT180205105435578', 200)
INSERT [dbo].[RetrievalDetails] ([ItemCode], [QuantityRetrieved], [Notes], [RetrievalCode], [QuantityNeeded]) VALUES (N'T100', 200, N'', N'RT180205140147475', 200)
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ActHead', N'Acting Department Head')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ActSMan', N'Acting Store Manager')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ActSSup', N'Acting Store Supervisor')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'Empl', N'Employee')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'Head', N'Department Head')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'Rep', N'Department Representative')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'SClerk', N'Store Clerk')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'SManager', N'Store Manager')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'SSupervisor', N'Store Supervisor')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C001', N'Clip', N'Clips Double 1"', 50, 30, N'Dozen', CAST(0.50 AS Decimal(18, 2)), 7870, N'ALPA', N'CHEP', N'BANE', N'A1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C002', N'Clip', N'Clips Double 2"', 50, 30, N'Dozen', CAST(0.60 AS Decimal(18, 2)), 350, N'ALPA', N'CHEP', N'BANE', N'A1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C003', N'Clip', N'Clips Double 3/4"', 50, 30, N'Dozen', CAST(0.70 AS Decimal(18, 2)), 40, N'ALPA', N'CHEP', N'BANE', N'A1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C004', N'Clip', N'Clips Paper Large', 50, 30, N'Box', CAST(1.50 AS Decimal(18, 2)), 210, N'ALPA', N'CHEP', N'BANE', N'A2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C005', N'Clip', N'Clips Paper Medium ', 50, 30, N'Box', CAST(2.00 AS Decimal(18, 2)), 320, N'ALPA', N'CHEP', N'BANE', N'A2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'C006', N'Clip', N'Clips Paper Small', 50, 30, N'Box', CAST(2.50 AS Decimal(18, 2)), 360, N'ALPA', N'CHEP', N'BANE', N'A2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E001', N'Envelope', N'Envelope Brown (3"x6")', 600, 400, N'Each', CAST(0.30 AS Decimal(18, 2)), 390, N'ALPA', N'CHEP', N'BANE', N'A3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E002', N'Envelope', N'Envelope Brown (3"x6") w/ Window', 600, 400, N'Each', CAST(0.30 AS Decimal(18, 2)), 240, N'ALPA', N'CHEP', N'BANE', N'A3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E003', N'Envelope', N'Envelope Brown (5"x7")', 600, 400, N'Each', CAST(0.35 AS Decimal(18, 2)), 450, N'ALPA', N'CHEP', N'BANE', N'A3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E004', N'Envelope', N'Envelope Brown (5"x7") w/ Window', 600, 400, N'Each', CAST(0.35 AS Decimal(18, 2)), 240, N'ALPA', N'CHEP', N'BANE', N'A4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E005', N'Envelope', N'Envelope White (3"x6")', 600, 400, N'Each', CAST(0.40 AS Decimal(18, 2)), 400, N'CHEP', N'ALPA', N'BANE', N'A4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E006', N'Envelope', N'Envelope White (3"x6") w/ Window', 600, 400, N'Each', CAST(0.40 AS Decimal(18, 2)), 400, N'CHEP', N'ALPA', N'BANE', N'A4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E007', N'Envelope', N'Envelope White (5"x7")', 600, 400, N'Each', CAST(0.45 AS Decimal(18, 2)), 417, N'CHEP', N'ALPA', N'BANE', N'A5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E008', N'Envelope', N'Envelope White (5"x7") w/ Window', 600, 400, N'Each', CAST(0.45 AS Decimal(18, 2)), 380, N'CHEP', N'ALPA', N'BANE', N'A5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E020', N'Eraser', N'Eraser (hard)', 50, 20, N'Each', CAST(1.00 AS Decimal(18, 2)), 380, N'CHEP', N'ALPA', N'BANE', N'A5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E021', N'Eraser', N'Eraser (soft)', 100, 50, N'Each', CAST(2.00 AS Decimal(18, 2)), 220, N'CHEP', N'ALPA', N'BANE', N'A6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E030', N'Excercise', N'Exercise Book (100 pg)', 100, 50, N'Each', CAST(2.00 AS Decimal(18, 2)), 130, N'CHEP', N'ALPA', N'BANE', N'A6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E031', N'Excercise', N'Exercise Book (120 pg)', 100, 50, N'Each', CAST(2.50 AS Decimal(18, 2)), 150, N'CHEP', N'ALPA', N'BANE', N'A6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E032', N'Excercise', N'Exercise Book A4 Hardcover (100 pg)', 100, 50, N'Each', CAST(4.00 AS Decimal(18, 2)), 360, N'CHEP', N'ALPA', N'BANE', N'A7')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E033', N'Excercise', N'Exercise Book A4 Hardcover (120 pg)', 100, 50, N'Each', CAST(4.50 AS Decimal(18, 2)), 270, N'BANE', N'OMEG', N'ALPA', N'A7')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E034', N'Excercise', N'Exercise Book A4 Hardcover (200 pg)', 100, 50, N'Each', CAST(7.00 AS Decimal(18, 2)), 350, N'BANE', N'OMEG', N'ALPA', N'A7')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E035', N'Excercise', N'Exercise Book Hardcover (100 pg)', 100, 50, N'Each', CAST(3.00 AS Decimal(18, 2)), 150, N'BANE', N'OMEG', N'ALPA', N'A8')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'E036', N'Excercise', N'Exercise Book Hardcover (120 pg)', 100, 50, N'Each', CAST(3.50 AS Decimal(18, 2)), 370, N'BANE', N'OMEG', N'ALPA', N'A8')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F020', N'File', N'File Separator', 100, 50, N'Set', CAST(2.00 AS Decimal(18, 2)), 78, N'BANE', N'OMEG', N'ALPA', N'A8')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F021', N'File', N'File-Blue Plain', 200, 100, N'Each', CAST(2.00 AS Decimal(18, 2)), 150, N'BANE', N'OMEG', N'ALPA', N'B1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F022', N'File', N'File-Blue with Logo', 200, 100, N'Each', CAST(2.00 AS Decimal(18, 2)), 200, N'BANE', N'OMEG', N'ALPA', N'B1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F023', N'File', N'File-Brown w/o Logo', 200, 150, N'Each', CAST(2.00 AS Decimal(18, 2)), 20, N'BANE', N'OMEG', N'ALPA', N'B1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F024', N'File', N'File-Brown with Logo', 200, 150, N'Each', CAST(2.00 AS Decimal(18, 2)), 190, N'BANE', N'OMEG', N'CHEP', N'B2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F031', N'File', N'Folder Plastic Blue', 200, 150, N'Each', CAST(3.00 AS Decimal(18, 2)), 90, N'OMEG', N'BANE', N'CHEP', N'B2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F032', N'File', N'Folder Plastic Clear', 200, 150, N'Each', CAST(3.00 AS Decimal(18, 2)), 150, N'OMEG', N'BANE', N'CHEP', N'B2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F033', N'File', N'Folder Plastic Green', 200, 150, N'Each', CAST(3.00 AS Decimal(18, 2)), 90, N'OMEG', N'BANE', N'CHEP', N'B3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F034', N'File', N'Folder Plastic Pink', 200, 150, N'Each', CAST(3.00 AS Decimal(18, 2)), 250, N'OMEG', N'BANE', N'CHEP', N'B3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'F035', N'File', N'Folder Plastic Yellow', 200, 150, N'Each', CAST(3.00 AS Decimal(18, 2)), 190, N'OMEG', N'BANE', N'CHEP', N'B3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H011', N'Pen', N'Highlighter Blue', 100, 80, N'Box', CAST(2.00 AS Decimal(18, 2)), 45, N'OMEG', N'BANE', N'CHEP', N'B4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H012', N'Pen', N'Highlighter Green', 100, 80, N'Box', CAST(2.00 AS Decimal(18, 2)), 60, N'OMEG', N'BANE', N'CHEP', N'B4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H013', N'Pen', N'Highlighter Pink', 100, 80, N'Box', CAST(2.00 AS Decimal(18, 2)), 80, N'OMEG', N'BANE', N'CHEP', N'B4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H014', N'Pen', N'Highlighter Yellow', 100, 80, N'Box', CAST(2.00 AS Decimal(18, 2)), 310, N'OMEG', N'BANE', N'CHEP', N'B5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H031', N'Puncher', N'Hole Puncher 2 holes', 50, 20, N'Each', CAST(7.00 AS Decimal(18, 2)), 320, N'OMEG', N'BANE', N'CHEP', N'B5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H032', N'Puncher', N'Hole Puncher 3 holes', 50, 20, N'Each', CAST(10.00 AS Decimal(18, 2)), 360, N'OMEG', N'BANE', N'CHEP', N'B5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'H033', N'Puncher', N'Hole Puncher Adjustable', 50, 20, N'Each', CAST(15.00 AS Decimal(18, 2)), 390, N'OMEG', N'BANE', N'ALPA', N'B6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P010', N'Pad', N'Pad Postit Memo 1"x2"', 100, 60, N'Packet', CAST(2.50 AS Decimal(18, 2)), 290, N'OMEG', N'BANE', N'ALPA', N'B6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P011', N'Pad', N'Pad Postit Memo 1/2"x1"', 100, 60, N'Packet', CAST(3.00 AS Decimal(18, 2)), 160, N'OMEG', N'BANE', N'ALPA', N'B6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P012', N'Pad', N'Pad Postit Memo 1/2"x2"', 100, 60, N'Packet', CAST(3.50 AS Decimal(18, 2)), 360, N'OMEG', N'BANE', N'ALPA', N'C1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P013', N'Pad', N'Pad Postit Memo 2"x3"', 100, 60, N'Packet', CAST(4.00 AS Decimal(18, 2)), 100, N'OMEG', N'BANE', N'ALPA', N'C1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P014', N'Pad', N'Pad Postit Memo 2"x4"', 100, 60, N'Packet', CAST(4.50 AS Decimal(18, 2)), 360, N'OMEG', N'BANE', N'ALPA', N'C1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P015', N'Pad', N'Pad Postit Memo 2"x5"', 100, 60, N'Packet', CAST(5.00 AS Decimal(18, 2)), 191, N'OMEG', N'BANE', N'ALPA', N'C2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P016', N'Pad', N'Pad Postit Memo 3/4"x2"', 100, 60, N'Packet', CAST(5.50 AS Decimal(18, 2)), 350, N'OMEG', N'BANE', N'ALPA', N'C2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P020', N'Paper', N'Paper Photostat A3', 500, 500, N'Box', CAST(15.00 AS Decimal(18, 2)), 480, N'OMEG', N'ALPA', N'BANE', N'C2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P021', N'Paper', N'Paper Photostat A4', 500, 500, N'Box', CAST(7.50 AS Decimal(18, 2)), 460, N'OMEG', N'ALPA', N'BANE', N'C3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P030', N'Pen', N'Pen Ballpoint Black', 100, 50, N'Dozen', CAST(12.00 AS Decimal(18, 2)), 265, N'OMEG', N'ALPA', N'BANE', N'C3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P031', N'Pen', N'Pen Ballpoint Blue', 100, 50, N'Dozen', CAST(12.00 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'C3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P032', N'Pen', N'Pen Ballpoint Red', 100, 50, N'Dozen', CAST(12.00 AS Decimal(18, 2)), 150, N'ALPA', N'OMEG', N'BANE', N'C4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P033', N'Pen', N'Pen Felt Tip Black', 100, 50, N'Dozen', CAST(15.00 AS Decimal(18, 2)), 130, N'ALPA', N'CHEP', N'BANE', N'C4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P034', N'Pen', N'Pen Felt Tip Blue', 100, 50, N'Dozen', CAST(15.00 AS Decimal(18, 2)), 110, N'ALPA', N'CHEP', N'BANE', N'C4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P035', N'Pen', N'Pen Felt Tip Red', 100, 50, N'Dozen', CAST(15.00 AS Decimal(18, 2)), 360, N'ALPA', N'CHEP', N'BANE', N'C5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P036', N'Pen', N'Pen Transparency Permanent', 100, 50, N'Packet', CAST(20.00 AS Decimal(18, 2)), 410, N'ALPA', N'CHEP', N'BANE', N'C5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P037', N'Pen', N'Pen Transparency Soluble', 100, 50, N'Packet', CAST(20.00 AS Decimal(18, 2)), 150, N'ALPA', N'CHEP', N'BANE', N'C5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P038', N'Pen', N'Pen Whiteboard Marker Black', 100, 50, N'Box', CAST(22.00 AS Decimal(18, 2)), 150, N'ALPA', N'CHEP', N'BANE', N'C6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P039', N'Pen', N'Pen Whiteboard Marker Blue', 100, 50, N'Box', CAST(22.00 AS Decimal(18, 2)), 310, N'ALPA', N'CHEP', N'BANE', N'C6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P040', N'Pen', N'Pen Whiteboard Marker Green', 100, 50, N'Box', CAST(22.00 AS Decimal(18, 2)), 300, N'ALPA', N'OMEG', N'BANE', N'C6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P041', N'Pen', N'Pen Whiteboard Marker Red', 100, 50, N'Box', CAST(22.00 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'D1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P042', N'Pen', N'Pencil 2B', 100, 50, N'Dozen', CAST(6.00 AS Decimal(18, 2)), 150, N'ALPA', N'OMEG', N'BANE', N'D1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P043', N'Pen', N'Pencil 2B with Eraser End', 100, 50, N'Dozen', CAST(7.00 AS Decimal(18, 2)), 150, N'ALPA', N'OMEG', N'BANE', N'D1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P044', N'Pen', N'Pencil 4H ', 100, 50, N'Dozen', CAST(6.00 AS Decimal(18, 2)), 150, N'ALPA', N'OMEG', N'BANE', N'D2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P045', N'Pen', N'Pencil B', 100, 50, N'Dozen', CAST(6.00 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'D2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'P046', N'Pen', N'Pencil B with Eraser End', 100, 50, N'Dozen', CAST(7.00 AS Decimal(18, 2)), 60, N'ALPA', N'OMEG', N'BANE', N'D2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'R001', N'Ruler', N'Ruler 6"', 50, 20, N'Dozen', CAST(7.00 AS Decimal(18, 2)), 340, N'ALPA', N'OMEG', N'BANE', N'D3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'R002', N'Ruler', N'Ruler 12"', 50, 20, N'Dozen', CAST(9.00 AS Decimal(18, 2)), 40, N'ALPA', N'OMEG', N'BANE', N'D3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S010', N'Shorthand', N'Shorthand Book (100 pg)', 100, 80, N'Each', CAST(270.00 AS Decimal(18, 2)), 40, N'ALPA', N'OMEG', N'BANE', N'D3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S011', N'Shorthand', N'Shorthand Book (120 pg)', 100, 80, N'Each', CAST(260.00 AS Decimal(18, 2)), 310, N'ALPA', N'OMEG', N'BANE', N'D4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S012', N'Shorthand', N'Shorthand Book (80 pg)', 100, 80, N'Each', CAST(251.00 AS Decimal(18, 2)), 120, N'ALPA', N'OMEG', N'BANE', N'D4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S020', N'Stapler', N'Stapler No. 28', 50, 20, N'Each', CAST(2.00 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'D4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S021', N'Stapler', N'Stapler No. 36', 50, 20, N'Each', CAST(2.50 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'D5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S022', N'Stapler', N'Stapler No. 28 - Box', 50, 20, N'Box', CAST(20.00 AS Decimal(18, 2)), 100, N'ALPA', N'OMEG', N'BANE', N'D5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S023', N'Stapler', N'Stapler No. 36 - Box', 50, 20, N'Box', CAST(25.00 AS Decimal(18, 2)), 350, N'ALPA', N'OMEG', N'BANE', N'D5')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S040', N'Tape', N'Scotch Tape', 50, 20, N'Each', CAST(3.00 AS Decimal(18, 2)), 255, N'ALPA', N'OMEG', N'BANE', N'D6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S041', N'Tape', N'Scotch Tape Dispenser', 50, 20, N'Each', CAST(3.00 AS Decimal(18, 2)), 360, N'ALPA', N'OMEG', N'BANE', N'D6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S100', N'Scissors', N'Scissors', 50, 20, N'Each', CAST(3.00 AS Decimal(18, 2)), 310, N'ALPA', N'OMEG', N'BANE', N'D6')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'S101', N'Sharpener', N'Sharpener', 50, 20, N'Each', CAST(1.00 AS Decimal(18, 2)), 390, N'ALPA', N'OMEG', N'BANE', N'E1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T001', N'Tacks', N'Thumb Tacks Large', 10, 10, N'Box', CAST(30.00 AS Decimal(18, 2)), 340, N'ALPA', N'CHEP', N'BANE', N'E1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T002', N'Tacks', N'Thumb Tacks Medium', 10, 10, N'Box', CAST(20.00 AS Decimal(18, 2)), 300, N'ALPA', N'CHEP', N'BANE', N'E1')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T003', N'Tacks', N'Thumb Tacks Small', 10, 10, N'Box', CAST(10.00 AS Decimal(18, 2)), 100, N'ALPA', N'CHEP', N'BANE', N'E2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T020', N'Tparency', N'Transparency Blue', 100, 200, N'Box', CAST(10.00 AS Decimal(18, 2)), 300, N'ALPA', N'CHEP', N'BANE', N'E2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T021', N'Tparency', N'Transparency Clear', 500, 400, N'Box', CAST(10.00 AS Decimal(18, 2)), 400, N'ALPA', N'CHEP', N'BANE', N'E2')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T022', N'Tparency', N'Transparency Green', 100, 200, N'Box', CAST(10.00 AS Decimal(18, 2)), 280, N'ALPA', N'CHEP', N'BANE', N'E3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T023', N'Tparency', N'Transparency Red', 100, 200, N'Box', CAST(10.00 AS Decimal(18, 2)), 180, N'ALPA', N'CHEP', N'BANE', N'E3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T024', N'Tparency', N'Transparency Reverse Blue', 100, 200, N'Box', CAST(10.00 AS Decimal(18, 2)), 300, N'ALPA', N'CHEP', N'BANE', N'E3')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T025', N'Tparency', N'Transparency Cover 3M', 500, 400, N'Box', CAST(15.00 AS Decimal(18, 2)), 525, N'ALPA', N'CHEP', N'BANE', N'E4')
INSERT [dbo].[StationeryCatalogue] ([ItemCode], [CategoryCode], [Description], [ReorderLevel], [ReorderQuantity], [MeasureUnit], [Price], [Stock], [Supplier1], [Supplier2], [Supplier3], [Location]) VALUES (N'T100', N'Tray', N'Trays In/Out', 20, 10, N'Set', CAST(15.00 AS Decimal(18, 2)), 300, N'ALPA', N'CHEP', N'BANE', N'E4')
INSERT [dbo].[Supplier] ([SupplierCode], [SupplierName], [ContactTitle], [ContactName], [PhoneNo], [FaxNo], [Address], [GSTRegistrationNo], [Notes]) VALUES (N'ALPA', N'ALPHA Office Supplies', N'Ms', N'Irene Tan', N'461 9928', N'461 2238', N'Blk 1128, Ang Mo Kio Industrial Park
#02-1108 Ang Mo Kio Street 62
Singapore 622262
', N'MR-8500440-2', NULL)
INSERT [dbo].[Supplier] ([SupplierCode], [SupplierName], [ContactTitle], [ContactName], [PhoneNo], [FaxNo], [Address], [GSTRegistrationNo], [Notes]) VALUES (N'BANE', N'BANES Shop', N'Mr ', N'Loh Ah Pek', N'478 1234', N'479 2434', N'Blk 124, Alexandra Road
#03-04 Banes Building
Singapore 550315
', N'MR-8200420-2', NULL)
INSERT [dbo].[Supplier] ([SupplierCode], [SupplierName], [ContactTitle], [ContactName], [PhoneNo], [FaxNo], [Address], [GSTRegistrationNo], [Notes]) VALUES (N'CHEP', N'Cheap Stationer', N'Mr', N'Soh Kway Koh', N'354 3234', N'474 2434', N'Blk 34, Clementi Road
#07-02 Ban Ban Soh Building
Singapore 110525
', NULL, NULL)
INSERT [dbo].[Supplier] ([SupplierCode], [SupplierName], [ContactTitle], [ContactName], [PhoneNo], [FaxNo], [Address], [GSTRegistrationNo], [Notes]) VALUES (N'OMEG', N'OMEGA Stationery Supplier', N'Mr ', N'Ronnie Ho', N'767 1233', N'767 1234', N'Blk 11, Hillview Avenue 
#03-04,
Singapore 679036
', N'MR-8555330-1', NULL)
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C001', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C002', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C003', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C004', CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C005', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'C006', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E001', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E002', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E003', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E004', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E005', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E006', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E007', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E008', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E020', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E021', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E030', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E031', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E032', CAST(4.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E033', CAST(4.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E034', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E035', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'E036', CAST(3.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'F020', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'F021', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'F022', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'F023', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'H033', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P010', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P011', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P012', CAST(3.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P013', CAST(4.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P014', CAST(4.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P015', CAST(5.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P016', CAST(5.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P020', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P021', CAST(7.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P030', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P031', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P032', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P033', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P034', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P035', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P036', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P037', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P038', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P039', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P040', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P041', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P042', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P043', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P044', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P045', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'P046', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'R001', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'R002', CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S010', CAST(270.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S011', CAST(260.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S012', CAST(251.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S020', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S021', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S022', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S023', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S040', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S041', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S100', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'S101', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T001', CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T002', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T003', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T020', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T021', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T022', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T023', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T024', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T025', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'ALPA', N'T100', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C001', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C002', CAST(0.80 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C003', CAST(0.90 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C004', CAST(1.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C005', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'C006', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E001', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E002', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E003', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E004', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E005', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E006', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E007', CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E008', CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E020', CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E021', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E030', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E031', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E032', CAST(4.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E033', CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E034', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E035', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'E036', CAST(3.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F020', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F021', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F022', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F023', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F024', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F031', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F032', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F033', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F034', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'F035', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H011', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H012', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H013', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H014', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H031', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H032', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'H033', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P010', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P011', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P012', CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P013', CAST(4.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P014', CAST(4.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P015', CAST(5.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P016', CAST(5.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P020', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P021', CAST(7.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P030', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P031', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P032', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P033', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P034', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P035', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P036', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P037', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P038', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P039', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P040', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P041', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P042', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P043', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P044', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P045', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'P046', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'R001', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'R002', CAST(9.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S010', CAST(270.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S011', CAST(260.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S012', CAST(251.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S020', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S021', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S022', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S023', CAST(25.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S040', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S041', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S100', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'S101', CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T001', CAST(30.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T002', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T003', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T020', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T021', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T022', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T023', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T024', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T025', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'BANE', N'T100', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C001', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C002', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C003', CAST(0.80 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C004', CAST(1.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C005', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'C006', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E001', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E002', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E003', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E004', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E005', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E006', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E007', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E008', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E020', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E021', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E030', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E031', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'E032', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F024', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F031', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F032', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F033', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F034', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'F035', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H011', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H012', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H013', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H014', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H031', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'H032', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P033', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P034', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P035', CAST(15.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P036', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P037', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P038', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'P039', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T001', CAST(30.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T002', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T003', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T020', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T021', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T022', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T023', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T024', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T025', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'CHEP', N'T100', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'E033', CAST(4.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'E034', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'E035', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'E036', CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F020', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F021', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F022', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F023', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F024', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F031', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F032', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F033', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F034', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'F035', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H011', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H012', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H013', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H014', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H031', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H032', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'H033', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P010', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P011', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P012', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P013', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P014', CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P015', CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P016', CAST(5.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P020', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P021', CAST(7.50 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P030', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P031', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P032', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P040', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P041', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P042', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P043', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P044', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P045', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'P046', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'R001', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'R002', CAST(9.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S010', CAST(270.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S011', CAST(260.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S012', CAST(251.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S020', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S021', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S022', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S023', CAST(25.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S040', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S041', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S100', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[SupplierDetail] ([SupplierCode], [ItemCode], [Price]) VALUES (N'OMEG', N'S101', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TALPA160101000000000', N'ALPA', CAST(N'2016-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TALPA170101000000000', N'ALPA', CAST(N'2017-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TALPA180101000000000', N'ALPA', CAST(N'2018-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TBANE160101000000000', N'BANE', CAST(N'2016-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TBANE170101000000000', N'BANE', CAST(N'2017-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TBANE180101000000000', N'BANE', CAST(N'2018-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TCHEP160101000000000', N'CHEP', CAST(N'2016-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TCHEP170101000000000', N'CHEP', CAST(N'2017-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TCHEP180101000000000', N'CHEP', CAST(N'2018-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TOMEG160101000000000', N'OMEG', CAST(N'2016-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TOMEG170101000000000', N'OMEG', CAST(N'2017-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Tender] ([TenderCode], [SupplierCode], [DateCreated], [Notes], [UserName]) VALUES (N'TOMEG180101000000000', N'OMEG', CAST(N'2018-01-01' AS Date), NULL, NULL)
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C001', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C002', CAST(0.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C003', CAST(0.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C004', CAST(1.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C005', CAST(2.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'C006', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E001', CAST(0.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E002', CAST(0.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E003', CAST(0.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E004', CAST(0.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E005', CAST(0.43 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E006', CAST(0.47 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E007', CAST(0.51 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E008', CAST(0.47 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E020', CAST(1.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E021', CAST(2.22 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E030', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E031', CAST(2.57 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E032', CAST(3.89 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E033', CAST(4.51 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E034', CAST(5.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E035', CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'E036', CAST(3.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'F020', CAST(1.95 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'F021', CAST(2.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'F022', CAST(2.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'F023', CAST(1.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'H033', CAST(15.96 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P010', CAST(2.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P011', CAST(2.97 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P012', CAST(4.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P013', CAST(3.73 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P014', CAST(4.04 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P015', CAST(5.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P016', CAST(6.04 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P020', CAST(15.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P021', CAST(8.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P030', CAST(14.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P031', CAST(12.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P032', CAST(13.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P033', CAST(12.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P034', CAST(16.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P035', CAST(18.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P036', CAST(20.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P037', CAST(19.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P038', CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P039', CAST(18.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P040', CAST(19.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P041', CAST(19.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P042', CAST(6.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P043', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P044', CAST(6.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P045', CAST(6.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'P046', CAST(5.67 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'R001', CAST(7.49 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'R002', CAST(7.47 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S010', CAST(288.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S011', CAST(210.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S012', CAST(210.84 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S020', CAST(1.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S021', CAST(2.85 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S022', CAST(18.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S023', CAST(24.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S040', CAST(3.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S041', CAST(2.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S100', CAST(3.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'S101', CAST(0.87 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T001', CAST(30.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T002', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T003', CAST(9.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T020', CAST(11.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T021', CAST(11.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T022', CAST(11.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T023', CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T024', CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T025', CAST(13.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA160101000000000', N'T100', CAST(12.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C001', CAST(0.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C002', CAST(0.57 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C003', CAST(0.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C004', CAST(1.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C005', CAST(1.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'C006', CAST(2.27 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E001', CAST(0.29 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E002', CAST(0.27 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E003', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E004', CAST(0.38 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E005', CAST(0.51 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E006', CAST(0.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E007', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E008', CAST(0.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E020', CAST(1.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E021', CAST(2.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E030', CAST(2.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E031', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E032', CAST(4.83 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E033', CAST(3.94 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E034', CAST(6.62 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E035', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'E036', CAST(3.14 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'F020', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'F021', CAST(2.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'F022', CAST(1.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'F023', CAST(2.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'H033', CAST(12.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P010', CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P011', CAST(3.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P012', CAST(3.81 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P013', CAST(3.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P014', CAST(5.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P015', CAST(5.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P016', CAST(4.67 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P020', CAST(12.38 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P021', CAST(6.38 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P030', CAST(11.97 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P031', CAST(11.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P032', CAST(11.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P033', CAST(13.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P034', CAST(16.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P035', CAST(15.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P036', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P037', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P038', CAST(23.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P039', CAST(22.66 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P040', CAST(20.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P041', CAST(18.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P042', CAST(5.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P043', CAST(7.14 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P044', CAST(6.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P045', CAST(5.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'P046', CAST(6.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'R001', CAST(7.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'R002', CAST(8.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S010', CAST(245.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S011', CAST(213.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S012', CAST(245.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S020', CAST(2.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S021', CAST(2.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S022', CAST(19.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S023', CAST(20.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S040', CAST(3.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S041', CAST(2.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S100', CAST(2.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'S101', CAST(1.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T001', CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T002', CAST(19.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T003', CAST(9.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T020', CAST(9.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T021', CAST(8.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T022', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T023', CAST(9.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T024', CAST(11.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T025', CAST(15.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA170101000000000', N'T100', CAST(16.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C001', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C002', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C003', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C004', CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C005', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'C006', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E001', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E002', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E003', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E004', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E005', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E006', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E007', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E008', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E020', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E021', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E030', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E031', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E032', CAST(4.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E033', CAST(4.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E034', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E035', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'E036', CAST(3.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'F020', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'F021', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'F022', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'F023', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'H033', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P010', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P011', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P012', CAST(3.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P013', CAST(4.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P014', CAST(4.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P015', CAST(5.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P016', CAST(5.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P020', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P021', CAST(7.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P030', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P031', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P032', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P033', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P034', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P035', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P036', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P037', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P038', CAST(22.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P039', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P040', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P041', CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P042', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P043', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P044', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P045', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'P046', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'R001', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'R002', CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S010', CAST(270.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S011', CAST(260.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S012', CAST(251.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S020', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S021', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S022', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S023', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S040', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S041', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S100', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'S101', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T001', CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T002', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T003', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T020', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T021', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T022', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T023', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T024', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T025', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TALPA180101000000000', N'T100', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C001', CAST(0.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C002', CAST(0.96 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C003', CAST(0.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C004', CAST(1.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C005', CAST(2.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'C006', CAST(2.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E001', CAST(0.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E002', CAST(0.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E003', CAST(0.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E004', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E005', CAST(0.54 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E006', CAST(0.57 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E007', CAST(0.74 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E008', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E020', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E021', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E030', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E031', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E032', CAST(4.15 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E033', CAST(4.14 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E034', CAST(7.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E035', CAST(2.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'E036', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F020', CAST(1.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F021', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F022', CAST(2.36 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F023', CAST(2.14 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F024', CAST(1.86 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F031', CAST(2.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F032', CAST(3.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F033', CAST(2.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F034', CAST(3.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'F035', CAST(2.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H011', CAST(2.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H012', CAST(2.05 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H013', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H014', CAST(2.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H031', CAST(7.81 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H032', CAST(12.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'H033', CAST(14.04 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P010', CAST(2.23 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P011', CAST(2.51 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P012', CAST(3.85 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P013', CAST(4.87 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P014', CAST(3.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P015', CAST(5.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P016', CAST(6.32 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P020', CAST(12.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P021', CAST(7.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P030', CAST(12.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P031', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P032', CAST(11.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P033', CAST(16.87 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P034', CAST(13.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P035', CAST(13.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P036', CAST(22.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P037', CAST(19.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P038', CAST(21.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P039', CAST(21.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P040', CAST(24.86 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P041', CAST(21.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P042', CAST(5.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P043', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P044', CAST(5.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P045', CAST(5.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'P046', CAST(7.48 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'R001', CAST(6.48 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'R002', CAST(10.58 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S010', CAST(289.11 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S011', CAST(281.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S012', CAST(298.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S020', CAST(1.93 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S021', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S022', CAST(17.17 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S023', CAST(21.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S040', CAST(3.48 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S041', CAST(3.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S100', CAST(3.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'S101', CAST(0.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T001', CAST(24.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T002', CAST(16.96 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T003', CAST(10.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T020', CAST(11.83 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T021', CAST(10.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T022', CAST(9.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T023', CAST(12.03 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T024', CAST(11.93 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T025', CAST(18.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE160101000000000', N'T100', CAST(16.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C001', CAST(0.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C002', CAST(0.66 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C003', CAST(0.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C004', CAST(1.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C005', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'C006', CAST(2.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E001', CAST(0.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E002', CAST(0.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E003', CAST(0.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E004', CAST(0.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E005', CAST(0.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E006', CAST(0.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E007', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E008', CAST(0.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E020', CAST(1.03 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E021', CAST(2.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E030', CAST(2.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E031', CAST(2.43 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E032', CAST(4.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E033', CAST(3.69 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E034', CAST(6.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E035', CAST(2.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'E036', CAST(4.06 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F020', CAST(2.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F021', CAST(1.78 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F022', CAST(2.04 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F023', CAST(2.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F024', CAST(2.26 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F031', CAST(3.19 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F032', CAST(3.03 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F033', CAST(3.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F034', CAST(3.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'F035', CAST(3.03 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H011', CAST(2.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H012', CAST(1.89 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H013', CAST(1.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H014', CAST(1.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H031', CAST(7.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H032', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'H033', CAST(16.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P010', CAST(3.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P011', CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P012', CAST(3.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P013', CAST(4.79 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P014', CAST(4.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P015', CAST(4.23 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P016', CAST(4.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P020', CAST(17.93 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P021', CAST(8.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P030', CAST(14.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P031', CAST(10.49 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P032', CAST(10.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P033', CAST(16.56 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P034', CAST(14.89 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P035', CAST(18.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P036', CAST(17.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P037', CAST(17.77 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P038', CAST(21.53 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P039', CAST(19.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P040', CAST(21.09 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P041', CAST(23.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P042', CAST(6.94 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P043', CAST(5.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P044', CAST(6.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P045', CAST(5.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'P046', CAST(6.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'R001', CAST(6.19 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'R002', CAST(9.66 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S010', CAST(259.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S011', CAST(312.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S012', CAST(253.71 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S020', CAST(2.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S021', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S022', CAST(22.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S023', CAST(21.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S040', CAST(2.62 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S041', CAST(2.62 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S100', CAST(3.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'S101', CAST(1.03 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T001', CAST(25.97 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T002', CAST(18.78 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T003', CAST(11.73 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T020', CAST(8.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T021', CAST(10.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T022', CAST(9.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T023', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T024', CAST(12.13 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T025', CAST(12.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE170101000000000', N'T100', CAST(15.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C001', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C002', CAST(0.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C003', CAST(0.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C004', CAST(1.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C005', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'C006', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E001', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E002', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E003', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E004', CAST(0.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E005', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E006', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E007', CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E008', CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E020', CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E021', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E030', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E031', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E032', CAST(4.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E033', CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E034', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E035', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'E036', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F020', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F021', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F022', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F023', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F024', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F031', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F032', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F033', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F034', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'F035', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H011', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H012', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H013', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H014', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H031', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H032', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'H033', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P010', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P011', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P012', CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P013', CAST(4.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P014', CAST(4.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P015', CAST(5.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P016', CAST(5.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P020', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P021', CAST(7.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P030', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P031', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P032', CAST(12.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P033', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P034', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P035', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P036', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P037', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P038', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P039', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P040', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P041', CAST(22.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P042', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P043', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P044', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P045', CAST(6.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'P046', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'R001', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'R002', CAST(9.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S010', CAST(270.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S011', CAST(260.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S012', CAST(251.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S020', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S021', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S022', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S023', CAST(25.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S040', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S041', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S100', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'S101', CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T001', CAST(30.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T002', CAST(20.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T003', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T020', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T021', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T022', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T023', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T024', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T025', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TBANE180101000000000', N'T100', CAST(15.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C001', CAST(0.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C002', CAST(0.74 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C003', CAST(0.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C004', CAST(1.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C005', CAST(2.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'C006', CAST(3.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E001', CAST(0.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E002', CAST(0.36 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E003', CAST(0.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E004', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E005', CAST(0.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E006', CAST(0.36 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E007', CAST(0.37 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E008', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E020', CAST(1.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E021', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E030', CAST(1.86 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E031', CAST(2.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'E032', CAST(4.36 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F024', CAST(1.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F031', CAST(2.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F032', CAST(2.94 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F033', CAST(2.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F034', CAST(3.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'F035', CAST(3.58 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H011', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H012', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H013', CAST(2.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H014', CAST(1.95 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H031', CAST(6.84 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'H032', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P033', CAST(13.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P034', CAST(13.13 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P035', CAST(12.83 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P036', CAST(19.09 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P037', CAST(22.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P038', CAST(25.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'P039', CAST(23.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T001', CAST(27.69 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T002', CAST(22.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T003', CAST(11.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T020', CAST(10.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T021', CAST(11.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T022', CAST(10.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T023', CAST(9.89 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T024', CAST(8.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T025', CAST(12.83 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP160101000000000', N'T100', CAST(16.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C001', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C002', CAST(0.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C003', CAST(0.95 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C004', CAST(1.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C005', CAST(2.49 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'C006', CAST(2.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E001', CAST(0.46 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E002', CAST(0.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E003', CAST(0.49 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E004', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E005', CAST(0.37 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E006', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E007', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E008', CAST(0.47 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E020', CAST(0.98 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E021', CAST(1.78 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E030', CAST(2.38 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E031', CAST(2.37 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'E032', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F024', CAST(2.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F031', CAST(3.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F032', CAST(2.56 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F033', CAST(3.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F034', CAST(3.04 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'F035', CAST(3.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H011', CAST(1.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H012', CAST(1.84 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H013', CAST(2.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H014', CAST(1.93 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H031', CAST(8.28 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'H032', CAST(10.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P033', CAST(13.13 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P034', CAST(15.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P035', CAST(18.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P036', CAST(18.29 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P037', CAST(22.71 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P038', CAST(22.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'P039', CAST(20.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T001', CAST(27.39 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T002', CAST(16.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T003', CAST(9.49 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T020', CAST(12.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T021', CAST(9.69 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T022', CAST(10.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T023', CAST(10.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T024', CAST(9.59 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T025', CAST(12.23 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP170101000000000', N'T100', CAST(14.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C001', CAST(0.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C002', CAST(0.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C003', CAST(0.80 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C004', CAST(1.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C005', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'C006', CAST(2.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E001', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E002', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E003', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E004', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E005', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E006', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E007', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E008', CAST(0.45 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E020', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E021', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E030', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E031', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'E032', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F024', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F031', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F032', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F033', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F034', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'F035', CAST(3.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H011', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H012', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H013', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H014', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H031', CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'H032', CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P033', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P034', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P035', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P036', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P037', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P038', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'P039', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T001', CAST(30.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T002', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T003', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T020', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T021', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T022', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T023', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T024', CAST(10.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T025', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TCHEP180101000000000', N'T100', CAST(15.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'E033', CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'E034', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'E035', CAST(3.22 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'E036', CAST(3.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F020', CAST(2.12 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F021', CAST(2.22 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F022', CAST(2.18 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F023', CAST(1.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F024', CAST(2.14 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F031', CAST(3.18 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F032', CAST(3.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F033', CAST(2.76 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F034', CAST(2.97 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'F035', CAST(3.24 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H011', CAST(1.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H012', CAST(1.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H013', CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H014', CAST(1.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H031', CAST(6.51 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H032', CAST(10.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'H033', CAST(17.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P010', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P011', CAST(2.61 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P012', CAST(3.08 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P013', CAST(4.32 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P014', CAST(4.63 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P015', CAST(5.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P016', CAST(4.78 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P020', CAST(13.65 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P021', CAST(6.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P030', CAST(13.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P031', CAST(13.55 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P032', CAST(11.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P040', CAST(25.41 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P041', CAST(26.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P042', CAST(5.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P043', CAST(7.66 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P044', CAST(7.25 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P045', CAST(7.13 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'P046', CAST(7.81 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'R001', CAST(8.44 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'R002', CAST(7.73 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S010', CAST(278.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S011', CAST(306.91 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S012', CAST(246.07 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S020', CAST(2.47 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S021', CAST(2.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S022', CAST(23.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S023', CAST(21.58 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S040', CAST(2.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S041', CAST(3.13 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S100', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG160101000000000', N'S101', CAST(0.93 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'E033', CAST(5.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'E034', CAST(5.89 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'E035', CAST(2.79 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'E036', CAST(3.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F020', CAST(1.78 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F021', CAST(1.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F022', CAST(2.31 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F023', CAST(2.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F024', CAST(2.01 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F031', CAST(2.70 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F032', CAST(3.27 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F033', CAST(3.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F034', CAST(2.43 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'F035', CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H011', CAST(1.86 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H012', CAST(1.88 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H013', CAST(2.34 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H014', CAST(1.84 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H031', CAST(5.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H032', CAST(11.30 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'H033', CAST(17.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P010', CAST(2.65 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P011', CAST(2.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P012', CAST(3.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P013', CAST(4.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P014', CAST(4.90 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P015', CAST(4.20 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P016', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P020', CAST(12.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P021', CAST(8.17 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P030', CAST(10.92 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P031', CAST(11.73 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P032', CAST(14.27 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P040', CAST(26.29 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P041', CAST(24.08 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P042', CAST(6.64 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P043', CAST(8.37 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P044', CAST(6.83 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P045', CAST(5.42 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'P046', CAST(8.16 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'R001', CAST(5.82 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'R002', CAST(10.37 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S010', CAST(245.79 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S011', CAST(210.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S012', CAST(215.94 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S020', CAST(2.52 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S021', CAST(2.15 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S022', CAST(22.11 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S023', CAST(26.35 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S040', CAST(3.72 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S041', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S100', CAST(3.68 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG170101000000000', N'S101', CAST(1.27 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'E033', CAST(4.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'E034', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'E035', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'E036', CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F020', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F021', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F022', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F023', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F024', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F031', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F032', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F033', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F034', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'F035', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H011', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H012', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H013', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H014', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H031', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H032', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'H033', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P010', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P011', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P012', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P013', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P014', CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P015', CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P016', CAST(5.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P020', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P021', CAST(7.50 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P030', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P031', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P032', CAST(12.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P040', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P041', CAST(22.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P042', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P043', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P044', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P045', CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'P046', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'R001', CAST(7.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'R002', CAST(9.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S010', CAST(270.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S011', CAST(260.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S012', CAST(251.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S020', CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S021', CAST(2.60 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S022', CAST(20.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S023', CAST(25.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S040', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S041', CAST(3.10 AS Decimal(18, 2)))
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S100', CAST(3.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[TenderDetails] ([TenderCode], [ItemCode], [Price]) VALUES (N'TOMEG180101000000000', N'S101', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'0f3093b8-4fe7-4421-b6bd-53921e122f73', N'yuenkwan.empl.team8@gmail.com', N'AHP4tIEVugyywKhpU6SDgMssSPVDOaIUhAaebM5TFywahgXYwrXONDWL35qnkP/F8w==', N'4ecb67ef-7525-4ae9-855d-f477935f5def', NULL, 0, N'yuenkwan')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'16958896-028d-4047-a0dd-7ce87041e6ea', N'xavier.empl.team8@gmail.com', N'AF61Jv+BywUFoA0W163ClZ6OU0VGcxj1zg5OMS+iMPJdc/ovZoaDTp15/8dLtyRLOA==', N'5dbda1e6-5eeb-4059-b763-36adc6fb8d03', NULL, 0, N'xavier')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'24af484f-7361-4e7d-8c0a-d48f6001c80b', N'amit.empl.team8@gmail.com', N'AHOKNU8Uh3bL31sBAqTfZcX7aVWNODkUN8ZRbqwfPynq9yldqOGK8br6Xh/JOUNfPA==', N'f171cd0d-1857-42bb-bd71-44b958838280', NULL, 0, N'amit')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'297d6b4e-0605-4f98-920f-bbc4c57537fa', N'tan.head.team8@gmail.com', N'ABeOhrAg7TkmcUmta04393FkD1prOCQpcvSQmLxsVIlkruQAXb0gCXY4LaXCG3E13A==', N'29f4a2e3-143b-44bb-94d7-72c768bc41f8', NULL, 0, N'tan')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'43d99b0b-e615-42fc-b4ec-3fe5aaca0623', N'yufei.empl.team8@gmail.com', N'AHlhLsx3KBhYUnRjbx8XEKx8dmvPMLzzUSecSioU6xS11BGhxl6N3NNfxJWVcvAVqw==', N'81d61cc2-4c29-4d54-80f3-25e145b2d1c5', NULL, 0, N'yufei')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'593bb657-4e8a-4277-8174-be7ccab15e88', N'ssupervisor.team8@gmail.com', N'AM/mm15vktGjXIsnKLrqLWx09BLxS/2hODihf4rx0WVqGUXqXRZz+hqdESlDEDIcAQ==', N'6ca860d9-b182-42d0-b958-3dec96829374', NULL, 0, N'jennifer')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'689ca20e-e9ae-4147-bc48-ce6dccd39eea', N'smanager.team8@gmail.com', N'AAznGcOyKmFNoqOg8L4ObuWETLsBgqX6jYkzGlgm1dWWHR+siaX4JAJgxTpHx/OGSw==', N'fa56fe30-1987-4055-ad35-d2ca56fd4693', NULL, 0, N'einstein')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'7bdb8e11-d368-40cf-b9c6-5df85e327de5', N'nathalie.sclerk.team8@gmail.com', N'AIooJok1gH8CCdqYdRv4vSebMRUQjqvGbPcWyDmgil0mDzYZ7PvrQhWDoYt8xbh6fA==', N'017852e4-1208-44fc-9b45-a9939504d715', NULL, 0, N'nathalie')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'8018856c-3326-4ad0-b87a-1353375559ae', N'tracy.empl.team8@gmail.com', N'ADXw+ls93l7HE5Hlid9ahOPeu+ate/opn4MXou8zVMZPEcbFcOP/fKkXeqoItwaY5A==', N'70275f30-4515-4f9a-a3c9-c5ecb9b8d7b9', NULL, 0, N'tracy')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'86f9961c-1be5-4b1d-b65e-46d11c37804e', N'junye.empl.team8@gmail.com', N'AIqxKCefjGZmhspn8ViuTSLfY87NXT/qjJsZ7oOS/zbv+iOZxrC+cIBc6pOUDeEL0w==', N'a3912290-0180-4518-b51b-6b7de37a9b98', NULL, 0, N'junye')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'9e17f6bb-41c9-4403-8951-b9df0936830a', N'soh.head.team8@gmail.com', N'AMl1rAc26v67ja/0hKvwy7nQ9rW/mElun2DMPMu41V4vS6wTI1PI3aeFLE2ZCEpTog==', N'532881a2-13b4-4a0c-9b6a-17e223617acb', NULL, 0, N'Soh')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'a41dc4fa-8b67-4662-8a48-cf247e8c36a7', N'yixiang.sclerk.team8@gmail.com', N'ACAJoxb7SHx4GXaFv2Fwo1oYrbkYK+YehRb0xYppw+twqpeVKeQnXZCJd5ei1aXThg==', N'c369e4b3-1d7e-46d6-94f9-487830fdec37', NULL, 0, N'yixiang')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'a5340589-b39b-494b-a896-ed194c2bb23a', N'khaing.empl.team8@gmail.com', N'AEqnxbQv4zVdwwCmaHdrEjFDNEBy6MzF6dMnbOMkSpC2pR/w1I3EddWnv6R+k6gq7A==', N'32120fd1-3cd1-44e7-af63-929a764190a2', NULL, 0, N'khaing')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'aa4a3c01-ff5f-4eea-88ee-2400ed6b7ea3', N'balaji.empl.team8@gmail.com', N'ABRlh5vTwZ1+QbpsCEqf0/wckedPPh3VwIXzevUIzujkMD5dgcHOLRgM/7Boblzn5A==', N'5cba1305-a716-46ff-9373-8b68f876b215', NULL, 0, N'balaji')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'b9228728-7a6f-443c-8592-6d9223c03248', N'ezra.head.team8@gmail.com', N'ALq/RpGDpJAHBNwb8tn2d+q129aApbWBu7ginyu299HwhgEBd9pO/6dZiYAMK1lU1g==', N'f58b3aaf-c08e-4294-9d9a-93166819e6d8', NULL, 0, N'ezra')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'bbd7995c-8934-4d03-b42c-87524250476e', N'esther.sclerk.team8@gmail.com', N'AOqzhWOx7RKmiO0A3i/3rfqudamKcNJ4aDqZLU2YlfBrej/xZLSTj+u17EbUS1++0w==', N'42171a59-aa75-452b-b9c1-254bfc0d6dea', NULL, 0, N'esther')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'c5e5267c-3ae0-4843-9ffc-769cf17f0fc3', N'mengkiak.sclerk.team8@gmail.com', N'AH504tIb+7ZGUBKr8uLjPdBZ5wY57WBW6VgYVxtvIXJv8SVo5/A7hq0Lze/1NV9idA==', N'0578e474-871f-40b7-8a84-13827d8632fc', NULL, 0, N'mengkiak')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'd3873b6b-61b9-4254-8620-cc7b29d1852b', N'derek.empl.team8@gmail.com', N'AFsmJd53mxRzN4P7Hu7b37ghnBPTYIfRaRt1d0d+RLEIlpLqIVI4cV527A3S/nPZNg==', N'dd64568d-8c65-4c04-b150-f5a93e775cb0', NULL, 0, N'derek')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'd41bd730-ed22-430c-8b54-9e5a9dba754b', N'liong.head.team8@gmail.com', N'ALyAi0dz/Ubw4s3kejn6luCU5EfBj/tpJJ5FH1D0GNu7yRyTpvahCOT6MSHMomTNUA==', N'87662eb8-82f5-4395-be34-08392ff8998c', NULL, 0, N'liong')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'd4af1d90-1fc3-4640-a93b-0cf38725590a', N'dongchen.empl.team8@gmail.com', N'ABXL4i18QnAJMfWbm6JpvXyN3L5ICEg5i+UbWiBHyyTcIlWjw+xtzeIB8QrrLFc1QA==', N'7a04d00f-3832-4c82-b33a-9f3fbf55725e', NULL, 0, N'dongchen')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'dfaf7594-a820-4ec4-aa0f-4f3181d62896', N'nathan.empl.team8@gmail.com', N'AF4DWk/ucKb8Uvm6Eqz0lzD76qd5wfm1NvtcnqUKbUtm5mrcxgpfAmHCOGdtmTHQUw==', N'd8870831-a6b8-4829-83fe-8de80b5d53bc', NULL, 0, N'nathan')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'f654461a-2690-4682-8663-529c1dcc46f8', N'anni.empl.team8@gmail.com', N'AK9A8skBjzFxUsV/WrQzwAC/K75CDatiAtiXOeZtU2rkxKgyqhJEoEl2ZLs8SG+AQQ==', N'57b53319-4dd7-4140-8c2a-734f1c667597', NULL, 0, N'anni')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'fbe23c8b-cc9c-4b53-9b94-03dde17e3aca', N'low.head.team8@gmail.com', N'AK6wTNU4LyFPl7v/TxVnh7MRVebQN0GFLeFdR/CegmOeFiUKzK5axEMyK6OOiHuBYA==', N'57fb26c0-925a-49a6-9904-ffae793f7e1c', NULL, 0, N'low')
INSERT [dbo].[User] ([Id], [Email], [PasswordHash], [SecurityStamp], [PhoneNumber], [AccessFailedCount], [UserName]) VALUES (N'fe4b781f-f241-450b-8acf-a02862ccaeae', N'chia.head.team8@gmail.com', N'AEedMS5ymUep3zOkIuVNt8dFAd38GXDVYO8cGzYtt33CHS7My7HGDjdaL9sAnEHjnQ==', N'7609ba83-fd49-4e00-84c0-2f78fb68196a', NULL, 0, N'chia')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0f3093b8-4fe7-4421-b6bd-53921e122f73', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'16958896-028d-4047-a0dd-7ce87041e6ea', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'24af484f-7361-4e7d-8c0a-d48f6001c80b', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'297d6b4e-0605-4f98-920f-bbc4c57537fa', N'head')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'43d99b0b-e615-42fc-b4ec-3fe5aaca0623', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'593bb657-4e8a-4277-8174-be7ccab15e88', N'ssupervisor')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'689ca20e-e9ae-4147-bc48-ce6dccd39eea', N'smanager')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'7bdb8e11-d368-40cf-b9c6-5df85e327de5', N'sclerk')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'8018856c-3326-4ad0-b87a-1353375559ae', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'86f9961c-1be5-4b1d-b65e-46d11c37804e', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9e17f6bb-41c9-4403-8951-b9df0936830a', N'head')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a41dc4fa-8b67-4662-8a48-cf247e8c36a7', N'sclerk')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a5340589-b39b-494b-a896-ed194c2bb23a', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'aa4a3c01-ff5f-4eea-88ee-2400ed6b7ea3', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'b9228728-7a6f-443c-8592-6d9223c03248', N'head')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'bbd7995c-8934-4d03-b42c-87524250476e', N'sclerk')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c5e5267c-3ae0-4843-9ffc-769cf17f0fc3', N'sclerk')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd3873b6b-61b9-4254-8620-cc7b29d1852b', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd41bd730-ed22-430c-8b54-9e5a9dba754b', N'head')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd4af1d90-1fc3-4640-a93b-0cf38725590a', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'dfaf7594-a820-4ec4-aa0f-4f3181d62896', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f654461a-2690-4682-8663-529c1dcc46f8', N'empl')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fbe23c8b-cc9c-4b53-9b94-03dde17e3aca', N'head')
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fe4b781f-f241-450b-8acf-a02862ccaeae', N'head')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 2/5/2018 9:21:57 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Users_UserName]    Script Date: 2/5/2018 9:21:57 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_Users_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 2/5/2018 9:21:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[UserClaim]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/5/2018 9:21:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserLogin]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adjustment] ADD  CONSTRAINT [DF_Adjustment_Status]  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Adjustment]  WITH CHECK ADD  CONSTRAINT [FK_Adjustment_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[Adjustment] CHECK CONSTRAINT [FK_Adjustment_StationeryCatalogue]
GO
ALTER TABLE [dbo].[Adjustment]  WITH CHECK ADD  CONSTRAINT [FK_Adjustment_User2] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Adjustment] CHECK CONSTRAINT [FK_Adjustment_User2]
GO
ALTER TABLE [dbo].[Adjustment]  WITH CHECK ADD  CONSTRAINT [FK_Adjustment_User3] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Adjustment] CHECK CONSTRAINT [FK_Adjustment_User3]
GO
ALTER TABLE [dbo].[AssignRole]  WITH CHECK ADD  CONSTRAINT [FK_AssignRole_Employee] FOREIGN KEY([EmployeeCode])
REFERENCES [dbo].[Employee] ([EmployeeCode])
GO
ALTER TABLE [dbo].[AssignRole] CHECK CONSTRAINT [FK_AssignRole_Employee]
GO
ALTER TABLE [dbo].[AssignRole]  WITH CHECK ADD  CONSTRAINT [FK_AssignRole_Role] FOREIGN KEY([TemporaryRoleCode])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[AssignRole] CHECK CONSTRAINT [FK_AssignRole_Role]
GO
ALTER TABLE [dbo].[AssignRole]  WITH CHECK ADD  CONSTRAINT [FK_AssignRole_User1] FOREIGN KEY([AssignedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[AssignRole] CHECK CONSTRAINT [FK_AssignRole_User1]
GO
ALTER TABLE [dbo].[CollectionPoint]  WITH CHECK ADD  CONSTRAINT [FK_CollectionPoint_Employee] FOREIGN KEY([SClerkInCharge])
REFERENCES [dbo].[Employee] ([EmployeeCode])
GO
ALTER TABLE [dbo].[CollectionPoint] CHECK CONSTRAINT [FK_CollectionPoint_Employee]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_CollectionPoint] FOREIGN KEY([CollectionPointCode])
REFERENCES [dbo].[CollectionPoint] ([CollectionPointCode])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_CollectionPoint]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([HeadCode])
REFERENCES [dbo].[Employee] ([EmployeeCode])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employee]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee1] FOREIGN KEY([RepresentativeCode])
REFERENCES [dbo].[Employee] ([EmployeeCode])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employee1]
GO
ALTER TABLE [dbo].[Disbursement]  WITH CHECK ADD  CONSTRAINT [FK_Disbursement_CollectionPoint] FOREIGN KEY([CollectionPointCode])
REFERENCES [dbo].[CollectionPoint] ([CollectionPointCode])
GO
ALTER TABLE [dbo].[Disbursement] CHECK CONSTRAINT [FK_Disbursement_CollectionPoint]
GO
ALTER TABLE [dbo].[Disbursement]  WITH CHECK ADD  CONSTRAINT [FK_Disbursement_Department1] FOREIGN KEY([DepartmentCode])
REFERENCES [dbo].[Department] ([DepartmentCode])
GO
ALTER TABLE [dbo].[Disbursement] CHECK CONSTRAINT [FK_Disbursement_Department1]
GO
ALTER TABLE [dbo].[Disbursement]  WITH CHECK ADD  CONSTRAINT [FK_Disbursement_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Disbursement] CHECK CONSTRAINT [FK_Disbursement_User]
GO
ALTER TABLE [dbo].[Disbursement]  WITH CHECK ADD  CONSTRAINT [FK_Disbursement_User1] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Disbursement] CHECK CONSTRAINT [FK_Disbursement_User1]
GO
ALTER TABLE [dbo].[DisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementDetail_Disbursement] FOREIGN KEY([DisbursementCode])
REFERENCES [dbo].[Disbursement] ([DisbursementCode])
GO
ALTER TABLE [dbo].[DisbursementDetail] CHECK CONSTRAINT [FK_DisbursementDetail_Disbursement]
GO
ALTER TABLE [dbo].[DisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementDetail_Request] FOREIGN KEY([RequestCode])
REFERENCES [dbo].[Request] ([RequestCode])
GO
ALTER TABLE [dbo].[DisbursementDetail] CHECK CONSTRAINT [FK_DisbursementDetail_Request]
GO
ALTER TABLE [dbo].[DisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementReqDetail_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[DisbursementDetail] CHECK CONSTRAINT [FK_DisbursementReqDetail_StationeryCatalogue]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentCode])
REFERENCES [dbo].[Department] ([DepartmentCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee2] FOREIGN KEY([ReportTo])
REFERENCES [dbo].[Employee] ([EmployeeCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee2]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role1] FOREIGN KEY([CurrentRoleCode])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[PODetail]  WITH CHECK ADD  CONSTRAINT [FK_PODetail_PurchaseOrder] FOREIGN KEY([PurchaseOrderCode])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderCode])
GO
ALTER TABLE [dbo].[PODetail] CHECK CONSTRAINT [FK_PODetail_PurchaseOrder]
GO
ALTER TABLE [dbo].[PODetail]  WITH CHECK ADD  CONSTRAINT [FK_PODetail_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[PODetail] CHECK CONSTRAINT [FK_PODetail_StationeryCatalogue]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupplierCode])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_User] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_User]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_User1] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_User1]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_User2] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_User2]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_User3] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_User3]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Department] FOREIGN KEY([DepartmentCode])
REFERENCES [dbo].[Department] ([DepartmentCode])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Department]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User2] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User2]
GO
ALTER TABLE [dbo].[RequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetail_Request] FOREIGN KEY([RequestCode])
REFERENCES [dbo].[Request] ([RequestCode])
GO
ALTER TABLE [dbo].[RequestDetail] CHECK CONSTRAINT [FK_RequestDetail_Request]
GO
ALTER TABLE [dbo].[RequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetail_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[RequestDetail] CHECK CONSTRAINT [FK_RequestDetail_StationeryCatalogue]
GO
ALTER TABLE [dbo].[Retrieval]  WITH CHECK ADD  CONSTRAINT [FK_Retrieval_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Retrieval] CHECK CONSTRAINT [FK_Retrieval_User]
GO
ALTER TABLE [dbo].[RetrievalDetails]  WITH CHECK ADD  CONSTRAINT [FK_RetrievalDetails_Retrieval] FOREIGN KEY([RetrievalCode])
REFERENCES [dbo].[Retrieval] ([RetrievalCode])
GO
ALTER TABLE [dbo].[RetrievalDetails] CHECK CONSTRAINT [FK_RetrievalDetails_Retrieval]
GO
ALTER TABLE [dbo].[RetrievalDetails]  WITH CHECK ADD  CONSTRAINT [FK_RetrievalDetails_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[RetrievalDetails] CHECK CONSTRAINT [FK_RetrievalDetails_StationeryCatalogue]
GO
ALTER TABLE [dbo].[StationeryCatalogue]  WITH CHECK ADD  CONSTRAINT [FK_StationeryCatalogue_Category] FOREIGN KEY([CategoryCode])
REFERENCES [dbo].[Category] ([CategoryCode])
GO
ALTER TABLE [dbo].[StationeryCatalogue] CHECK CONSTRAINT [FK_StationeryCatalogue_Category]
GO
ALTER TABLE [dbo].[StationeryCatalogue]  WITH CHECK ADD  CONSTRAINT [FK_StationeryCatalogue_Supplier] FOREIGN KEY([Supplier1])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[StationeryCatalogue] CHECK CONSTRAINT [FK_StationeryCatalogue_Supplier]
GO
ALTER TABLE [dbo].[StationeryCatalogue]  WITH CHECK ADD  CONSTRAINT [FK_StationeryCatalogue_Supplier1] FOREIGN KEY([Supplier2])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[StationeryCatalogue] CHECK CONSTRAINT [FK_StationeryCatalogue_Supplier1]
GO
ALTER TABLE [dbo].[StationeryCatalogue]  WITH CHECK ADD  CONSTRAINT [FK_StationeryCatalogue_Supplier2] FOREIGN KEY([Supplier3])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[StationeryCatalogue] CHECK CONSTRAINT [FK_StationeryCatalogue_Supplier2]
GO
ALTER TABLE [dbo].[SupplierDetail]  WITH CHECK ADD  CONSTRAINT [FK_SupplierDetail_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[SupplierDetail] CHECK CONSTRAINT [FK_SupplierDetail_StationeryCatalogue]
GO
ALTER TABLE [dbo].[SupplierDetail]  WITH CHECK ADD  CONSTRAINT [FK_SupplierDetails_Supplier] FOREIGN KEY([SupplierCode])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[SupplierDetail] CHECK CONSTRAINT [FK_SupplierDetails_Supplier]
GO
ALTER TABLE [dbo].[Tender]  WITH CHECK ADD  CONSTRAINT [FK_Tender_Supplier] FOREIGN KEY([SupplierCode])
REFERENCES [dbo].[Supplier] ([SupplierCode])
GO
ALTER TABLE [dbo].[Tender] CHECK CONSTRAINT [FK_Tender_Supplier]
GO
ALTER TABLE [dbo].[Tender]  WITH CHECK ADD  CONSTRAINT [FK_Tender_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Tender] CHECK CONSTRAINT [FK_Tender_User]
GO
ALTER TABLE [dbo].[TenderDetails]  WITH CHECK ADD  CONSTRAINT [FK_TenderDetails_StationeryCatalogue] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[StationeryCatalogue] ([ItemCode])
GO
ALTER TABLE [dbo].[TenderDetails] CHECK CONSTRAINT [FK_TenderDetails_StationeryCatalogue]
GO
ALTER TABLE [dbo].[TenderDetails]  WITH CHECK ADD  CONSTRAINT [FK_TenderDetails_Tender] FOREIGN KEY([TenderCode])
REFERENCES [dbo].[Tender] ([TenderCode])
GO
ALTER TABLE [dbo].[TenderDetails] CHECK CONSTRAINT [FK_TenderDetails_Tender]
GO
ALTER TABLE [dbo].[UserClaim]  WITH CHECK ADD  CONSTRAINT [FK_UserClaim_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaim] CHECK CONSTRAINT [FK_UserClaim_User]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole2_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole2_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole2_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole2_User]
GO
USE [master]
GO
ALTER DATABASE [Team8_SSIS] SET  READ_WRITE 
GO
