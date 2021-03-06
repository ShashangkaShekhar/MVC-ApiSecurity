USE [master]
GO
/****** Object:  Database [ApiSecurity]    Script Date: 7/3/2016 11:50:11 AM ******/
CREATE DATABASE [ApiSecurity] ON  PRIMARY 
( NAME = N'ApiSecurity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ApiSecurity.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ApiSecurity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ApiSecurity_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApiSecurity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApiSecurity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApiSecurity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApiSecurity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApiSecurity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApiSecurity] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApiSecurity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApiSecurity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApiSecurity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApiSecurity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApiSecurity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApiSecurity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApiSecurity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApiSecurity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApiSecurity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApiSecurity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ApiSecurity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApiSecurity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApiSecurity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApiSecurity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApiSecurity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApiSecurity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApiSecurity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApiSecurity] SET RECOVERY FULL 
GO
ALTER DATABASE [ApiSecurity] SET  MULTI_USER 
GO
ALTER DATABASE [ApiSecurity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApiSecurity] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApiSecurity', N'ON'
GO
USE [ApiSecurity]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/3/2016 11:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAuthentication]    Script Date: 7/3/2016 11:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuthentication](
	[AuthenticationID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NULL,
	[LoginID] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[LoginEmail] [nvarchar](50) NULL,
	[LoginPhone] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConfirmPassword] [nvarchar](50) NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED 
(
	[AuthenticationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/3/2016 11:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CanCreate] [bit] NULL,
	[CanUpdate] [bit] NULL,
	[CanDelete] [bit] NULL,
	[CanRead] [bit] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Tel]) VALUES (34, N'Shashangka Shekhar', N'01929515253')
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[UserAuthentication] ([AuthenticationID], [UserID], [RoleID], [LoginID], [UserName], [LoginEmail], [LoginPhone], [Password], [ConfirmPassword], [StatusID]) VALUES (1, 1, 1, N'shashangka', N'shashangka', N'shashangka@gmail.com', N'01929515253', N'12345', N'12345', 1)
INSERT [dbo].[UserAuthentication] ([AuthenticationID], [UserID], [RoleID], [LoginID], [UserName], [LoginEmail], [LoginPhone], [Password], [ConfirmPassword], [StatusID]) VALUES (2, 2, 2, N'arnab', N'arnab', N'arnab@gmail.com', N'01928616644', N'12345', N'12345', 1)
INSERT [dbo].[UserAuthentication] ([AuthenticationID], [UserID], [RoleID], [LoginID], [UserName], [LoginEmail], [LoginPhone], [Password], [ConfirmPassword], [StatusID]) VALUES (3, 3, 3, N'shekhar', N'shekhar', N'shekhar@yahoo.com', NULL, N'12345', N'12345', 1)
INSERT [dbo].[UserRole] ([RoleID], [RoleName], [CanCreate], [CanUpdate], [CanDelete], [CanRead]) VALUES (1, N'Administrator', 1, 1, 1, 1)
INSERT [dbo].[UserRole] ([RoleID], [RoleName], [CanCreate], [CanUpdate], [CanDelete], [CanRead]) VALUES (2, N'Editor', 0, 1, 0, 0)
INSERT [dbo].[UserRole] ([RoleID], [RoleName], [CanCreate], [CanUpdate], [CanDelete], [CanRead]) VALUES (3, N'Member', 0, 0, 0, 0)
ALTER TABLE [dbo].[UserAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthentication_UserRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[UserAuthentication] CHECK CONSTRAINT [FK_UserAuthentication_UserRole]
GO
USE [master]
GO
ALTER DATABASE [ApiSecurity] SET  READ_WRITE 
GO
