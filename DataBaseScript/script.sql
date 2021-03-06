USE [master]
GO
/****** Object:  Database [Ado_dot_net_curd]    Script Date: 23-04-2022 11.05.58 AM ******/
CREATE DATABASE [Ado_dot_net_curd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ado_dot_net_curd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ado_dot_net_curd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ado_dot_net_curd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ado_dot_net_curd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ado_dot_net_curd] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ado_dot_net_curd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ado_dot_net_curd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ado_dot_net_curd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ado_dot_net_curd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ado_dot_net_curd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ado_dot_net_curd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ado_dot_net_curd] SET  MULTI_USER 
GO
ALTER DATABASE [Ado_dot_net_curd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ado_dot_net_curd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ado_dot_net_curd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ado_dot_net_curd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ado_dot_net_curd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ado_dot_net_curd] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ado_dot_net_curd] SET QUERY_STORE = OFF
GO
USE [Ado_dot_net_curd]
GO
/****** Object:  Table [dbo].[Category_master]    Script Date: 23-04-2022 11.05.58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_master](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Category__19093A0B219F4E00] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_master]    Script Date: 23-04-2022 11.05.58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_master](
	[productId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category_master] ([CategoryId], [CategoryName]) VALUES (1, N'Car')
INSERT [dbo].[Category_master] ([CategoryId], [CategoryName]) VALUES (2, N'Bike')
GO
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (1, N'Demo_car_1', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (2, N'Demo_car2', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (3, N'Demo_car_3', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (4, N'Demo_car_4', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (5, N'Demo_car_5', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (6, N'Demo_car_6', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (7, N'Demo_car_7', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (8, N'Demo_car_8', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (9, N'Demo_car_9', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (10, N'Demo_car_10', 1)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (11, N'Demo_Bike_1', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (12, N'Demo_Bike_2', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (13, N'Demo_Bike_3', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (14, N'Demo_Bike_4', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (15, N'Demo_Bike_5', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (16, N'Demo_Bike_6', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (17, N'Demo_Bike_7', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (18, N'Demo_Bike_18', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (19, N'Demo_Bike_19', 2)
INSERT [dbo].[Product_master] ([productId], [ProductName], [CategoryId]) VALUES (20, N'Demo_Bike_10', 2)
GO
ALTER TABLE [dbo].[Product_master]  WITH CHECK ADD  CONSTRAINT [FK__Product_m__Categ__267ABA7A] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category_master] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_master] CHECK CONSTRAINT [FK__Product_m__Categ__267ABA7A]
GO
/****** Object:  StoredProcedure [dbo].[AddCat]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddCat]
@CategoryId int null,
@CategoryName varchar(30)
as
Begin

insert into Category_master values(@CategoryId,@CategoryName)
end
GO
/****** Object:  StoredProcedure [dbo].[AddProd]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[AddProd]
@productId int null,
@ProductName varchar(30),
@CategoryId varchar(30)
as
Begin

insert into Product_master values(@productId,@ProductName,@CategoryId)
end
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddProduct] 
   @productId int null,
   @ProductName varchar(30),
   @CategoryId varchar(30)
as
Begin

insert into Product_master values(@productId,@ProductName,@CategoryId)
end
GO
/****** Object:  StoredProcedure [dbo].[CatDelete]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CatDelete] 
@CategoryId int 
as
Begin

DELETE FROM Category_master WHERE CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[Category_curd]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_curd]
      @Action VARCHAR(10),
      @CategoryId INT null,
      @CategoryName varchar(50)  null
AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT *
            FROM Category_master
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Category_master(CategoryId,CategoryName)
            VALUES ( @CategoryId,@CategoryName)
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN
            UPDATE Category_master
            SET CategoryId = @CategoryId, CategoryName = @CategoryName
            WHERE CategoryId = CategoryId
      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Category_master
            WHERE CategoryId = @CategoryId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[EditCat]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditCat]
@CategoryId int,
@CategoryName varchar(20)
as
Begin

UPDATE Category_master
SET CategoryName=@CategoryName  WHERE  CategoryId=@CategoryId;
end
GO
/****** Object:  StoredProcedure [dbo].[EditProduct]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditProduct]
@productId int null,
@ProductName varchar(30),
@CategoryId int
as
Begin

UPDATE Product_master
SET ProductName =@ProductName , CategoryId=@CategoryId WHERE productId = @productId;
end
GO
/****** Object:  StoredProcedure [dbo].[Product_master_curd]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_master_curd]
      @Action VARCHAR(10) ,
      @productId INT null ,
      @ProductName varchar(50) NUll,
	  @CategoryId  INT null
AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT *
            FROM Product_master
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Product_master(productId,ProductName,CategoryId)
            VALUES ( @productId,@ProductName,@CategoryId)
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN
            UPDATE Product_master
            SET productId = @productId, ProductName = @ProductName,CategoryId=@CategoryId
            WHERE productId = @productId
      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Product_master
            WHERE productId = @productId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[ProductDelete]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductDelete] 
@productId int 
as
Begin
DELETE FROM Product_master WHERE productId=@productId
end
GO
/****** Object:  StoredProcedure [dbo].[selectcatogry]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectcatogry]

as
Begin

select * from Category_master
end
GO
/****** Object:  StoredProcedure [dbo].[selectCatWhere]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectCatWhere] 
@CategoryId int 
as
Begin

select * from Category_master where CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[selectProduct]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectProduct] 

as
Begin

select * from Product_master
end
GO
/****** Object:  StoredProcedure [dbo].[selectProductWhere]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectProductWhere] 
@ProductId int 
as
Begin

select * from Product_master where productId=@ProductId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetRowsPerPage]    Script Date: 23-04-2022 11.05.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[spGetRowsPerPage]
@PageNumber INT,
@PageSize INT 
AS
BEGIN
SELECT *
FROM Product_master
ORDER BY productId
OFFSET (@PageNumber -1)* @PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY
END
GO
USE [master]
GO
ALTER DATABASE [Ado_dot_net_curd] SET  READ_WRITE 
GO
