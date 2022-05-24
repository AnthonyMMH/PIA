USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 23/05/2022 07:27:26 p. m. ******/
CREATE DATABASE [Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proyecto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proyecto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyecto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE = OFF
GO
USE [Proyecto]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [nchar](20) NOT NULL,
	[Descripcion] [nchar](200) NOT NULL,
	[Imagenes] [nvarchar](max) NOT NULL,
	[Reseñas] [int] NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseñas]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseñas](
	[IdReseña] [int] NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Reseñas_1] PRIMARY KEY CLUSTERED 
(
	[IdReseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VCurso-Reseña]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VCurso-Reseña]
AS
SELECT        dbo.Cursos.IdCurso, dbo.Cursos.Nombre, dbo.Cursos.Precio, dbo.Cursos.Descripcion, dbo.Cursos.Imagenes, dbo.Cursos.Reseñas, dbo.Reseñas.IdReseña, dbo.Reseñas.Descripcion AS Expr1
FROM            dbo.Cursos INNER JOIN
                         dbo.Reseñas ON dbo.Cursos.Reseñas = dbo.Reseñas.IdReseña
GO
/****** Object:  Table [dbo].[NivelAcademico]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelAcademico](
	[IdNivelAcademico] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NivelAcademico] PRIMARY KEY CLUSTERED 
(
	[IdNivelAcademico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestros]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestros](
	[IdMaestro] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Género] [bit] NULL,
	[NivelAcademico] [int] NOT NULL,
	[Imagen] [nvarchar](max) NULL,
	[Curriculum] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Maestros] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VMaestro-NivelAcademico]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VMaestro-NivelAcademico]
AS
SELECT        dbo.Maestros.IdMaestro, dbo.Maestros.Nombre, dbo.Maestros.Género, dbo.Maestros.NivelAcademico, dbo.NivelAcademico.Descripcion, dbo.Maestros.Imagen, dbo.Maestros.Curriculum
FROM            dbo.Maestros INNER JOIN
                         dbo.NivelAcademico ON dbo.Maestros.NivelAcademico = dbo.NivelAcademico.IdNivelAcademico
GO
/****** Object:  Table [dbo].[CursoMaestro]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoMaestro](
	[IdCurso] [int] NOT NULL,
	[IdMaestro] [int] NOT NULL,
 CONSTRAINT [PK_CursoMaestro] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC,
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VCurso-CursoMaestro-Maestro]    Script Date: 23/05/2022 07:27:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VCurso-CursoMaestro-Maestro]
AS
SELECT        dbo.Cursos.IdCurso, dbo.Cursos.Nombre, dbo.Cursos.Precio, dbo.Cursos.Descripcion, dbo.Cursos.Imagenes, dbo.CursoMaestro.IdMaestro, dbo.Maestros.Nombre AS Expr1, dbo.Maestros.Género, 
                         dbo.Maestros.NivelAcademico, dbo.Maestros.Imagen, dbo.Maestros.Curriculum
FROM            dbo.Cursos INNER JOIN
                         dbo.CursoMaestro ON dbo.Cursos.IdCurso = dbo.CursoMaestro.IdCurso INNER JOIN
                         dbo.Maestros ON dbo.CursoMaestro.IdMaestro = dbo.Maestros.IdMaestro
GO
INSERT [dbo].[CursoMaestro] ([IdCurso], [IdMaestro]) VALUES (1, 1)
GO
INSERT [dbo].[CursoMaestro] ([IdCurso], [IdMaestro]) VALUES (1, 2)
GO
INSERT [dbo].[CursoMaestro] ([IdCurso], [IdMaestro]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (1, N'Algebra', N'200                 ', N'Descripcion1                                                                                                                                                                                            ', N'Imagenes1', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (2, N'Geometria', N'200                 ', N'Descripcion2                                                                                                                                                                                            ', N'Imagenes2', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (3, N'Trigonometria', N'200                 ', N'Descripcion3                                                                                                                                                                                            ', N'Imagenes3', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (4, N'CalculoIntegral', N'200                 ', N'Descripcion4                                                                                                                                                                                            ', N'Imagenes4', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (5, N'CalculoDiferencial', N'200                 ', N'Descripcion5                                                                                                                                                                                            ', N'Imagenes5', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (6, N'Mecanica', N'200                 ', N'Descripcion6                                                                                                                                                                                            ', N'Imagenes6', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (7, N'MecanicaDeFluidos', N'200                 ', N'Descripcion7                                                                                                                                                                                            ', N'Imagenes7', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (8, N'Ondas', N'200                 ', N'Descripcion8                                                                                                                                                                                            ', N'Imagenes8', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (9, N'Termodinamica', N'200                 ', N'Descripcion9                                                                                                                                                                                            ', N'Imagenes9', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (10, N'Electromagnetismo', N'200                 ', N'Descripcion10                                                                                                                                                                                           ', N'Imagenes10', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (11, N'Estequiometria', N'200                 ', N'Descripcion11                                                                                                                                                                                           ', N'Imagenes11', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (12, N'Soluciones', N'200                 ', N'Descripcion12                                                                                                                                                                                           ', N'Imagenes12', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (13, N'Electroquimica', N'200                 ', N'Descripcion13                                                                                                                                                                                           ', N'Imagenes13', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (14, N'Termoquimica', N'200                 ', N'Descripcion14                                                                                                                                                                                           ', N'Imagenes14', NULL)
GO
INSERT [dbo].[Cursos] ([IdCurso], [Nombre], [Precio], [Descripcion], [Imagenes], [Reseñas]) VALUES (15, N'Gases', N'200                 ', N'Descripcion15                                                                                                                                                                                           ', N'Imagenes15', NULL)
GO
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Maestros] ON 
GO
INSERT [dbo].[Maestros] ([IdMaestro], [Nombre], [Género], [NivelAcademico], [Imagen], [Curriculum]) VALUES (1, N'Ricardo Sanchez                                   ', 1, 7, N'', N'Curriculum1                                                                                                                                                                                             ')
GO
INSERT [dbo].[Maestros] ([IdMaestro], [Nombre], [Género], [NivelAcademico], [Imagen], [Curriculum]) VALUES (2, N'Marta Cordoba                                     ', 0, 8, N'', N'curriculum2                                                                                                                                                                                             ')
GO
INSERT [dbo].[Maestros] ([IdMaestro], [Nombre], [Género], [NivelAcademico], [Imagen], [Curriculum]) VALUES (3, N'Mario Peña                                        ', 1, 6, N'', N'curriculum3                                                                                                                                                                                             ')
GO
INSERT [dbo].[Maestros] ([IdMaestro], [Nombre], [Género], [NivelAcademico], [Imagen], [Curriculum]) VALUES (4, N'Ximena Vazquez                                    ', 0, 7, N'', N'curriculum4                                                                                                                                                                                             ')
GO
SET IDENTITY_INSERT [dbo].[Maestros] OFF
GO
SET IDENTITY_INSERT [dbo].[NivelAcademico] ON 
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (3, N'Escuela')
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (4, N'Secundaria')
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (5, N'Preparatoria')
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (6, N'Licenciatura')
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (7, N'Ingenieria')
GO
INSERT [dbo].[NivelAcademico] ([IdNivelAcademico], [Descripcion]) VALUES (8, N'Doctorado')
GO
SET IDENTITY_INSERT [dbo].[NivelAcademico] OFF
GO
ALTER TABLE [dbo].[CursoMaestro]  WITH CHECK ADD  CONSTRAINT [FK_CursoMaestro_Cursos] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Cursos] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoMaestro] CHECK CONSTRAINT [FK_CursoMaestro_Cursos]
GO
ALTER TABLE [dbo].[CursoMaestro]  WITH CHECK ADD  CONSTRAINT [FK_CursoMaestro_Maestros] FOREIGN KEY([IdMaestro])
REFERENCES [dbo].[Maestros] ([IdMaestro])
GO
ALTER TABLE [dbo].[CursoMaestro] CHECK CONSTRAINT [FK_CursoMaestro_Maestros]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Reseñas] FOREIGN KEY([Reseñas])
REFERENCES [dbo].[Reseñas] ([IdReseña])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Reseñas]
GO
ALTER TABLE [dbo].[Maestros]  WITH CHECK ADD  CONSTRAINT [FK_Maestros_NivelAcademico] FOREIGN KEY([NivelAcademico])
REFERENCES [dbo].[NivelAcademico] ([IdNivelAcademico])
GO
ALTER TABLE [dbo].[Maestros] CHECK CONSTRAINT [FK_Maestros_NivelAcademico]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cursos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CursoMaestro"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maestros"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCurso-CursoMaestro-Maestro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCurso-CursoMaestro-Maestro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cursos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Reseñas"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCurso-Reseña'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCurso-Reseña'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Maestros"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "NivelAcademico"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 102
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VMaestro-NivelAcademico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VMaestro-NivelAcademico'
GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
