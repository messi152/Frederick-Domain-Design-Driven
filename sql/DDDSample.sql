USE [DDDSample]
GO
ALTER TABLE [dbo].[PurchasedProduct] DROP CONSTRAINT [FK_PurchasedProduct_Purchase_PurchaseId]
GO
ALTER TABLE [dbo].[PurchasedProduct] DROP CONSTRAINT [FK_PurchasedProduct_Product_ProductId]
GO
ALTER TABLE [dbo].[Country] DROP CONSTRAINT [DF_Country_Id]
GO
/****** Object:  Table [dbo].[PurchasedProduct]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[PurchasedProduct]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[Purchase]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[DomainEventRecord]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[DomainEventRecord]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/23/2018 2:24:39 PM ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[SecurityStamp] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[Balance] [money] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DomainEventRecord]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomainEventRecord](
	[CorrelationId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DomainEvent] PRIMARY KEY CLUSTERED 
(
	[CorrelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[TotalPrice] [money] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasedProduct]    Script Date: 7/23/2018 2:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasedProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[PurchaseId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PurchasedProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PurchasedProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedProduct_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[PurchasedProduct] CHECK CONSTRAINT [FK_PurchasedProduct_Product_ProductId]
GO
ALTER TABLE [dbo].[PurchasedProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedProduct_Purchase_PurchaseId] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchase] ([Id])
GO
ALTER TABLE [dbo].[PurchasedProduct] CHECK CONSTRAINT [FK_PurchasedProduct_Purchase_PurchaseId]
GO
