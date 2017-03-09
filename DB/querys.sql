-- Crear tabla categorias
USE [Neptuno]
GO

/****** Object:  Table [dbo].[Categorias2]    Script Date: 9/03/2017 9:17:47 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Categorias2](
	[Id] [int] NOT NULL,
	[NombreCategoria] [char](100) NULL,
 CONSTRAINT [PK_Categorias2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
-- Fin de crear tabla categorias

-- Crear tabla productos
USE [Neptuno]
GO

/****** Object:  Table [dbo].[Productos]    Script Date: 9/03/2017 9:16:45 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Productos](
	[id] [int] NOT NULL,
	[NombreProducto] [nchar](100) NULL,
	[PrecioUnitario] [real] NULL,
	[UnidadesEnExistencia] [numeric](18, 0) NULL,
	[IdCategoria] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias2] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias2] ([Id])
GO

ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias2]
GO
-- Fin de crear tabal productos

-- ********** Consultas para el reporte ************

-- Query para reporte estandar
Select pro.NombreProducto,cat.NombreCategoria,pro.PrecioUnitario,pro.UnidadesEnExistencia 
From Productos pro inner join Categorias2 cat
On pro.IdCategoria = cat.id;
-- Query para reporte parametrisado
Select pro.NombreProducto,cat.NombreCategoria,pro.PrecioUnitario,pro.UnidadesEnExistencia 
From Productos pro inner join Categorias2 cat
On pro.IdCategoria = cat.id
WHERE cat.NombreCategoria = 'Carnes';