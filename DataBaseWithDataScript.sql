USE [master]
GO
/****** Object:  Database [MealPlanner]    Script Date: 12/12/2018 2:06:11 PM ******/
CREATE DATABASE [MealPlanner]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MealPlanner', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MealPlanner.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MealPlanner_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MealPlanner_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MealPlanner] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MealPlanner].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MealPlanner] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MealPlanner] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MealPlanner] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MealPlanner] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MealPlanner] SET ARITHABORT OFF 
GO
ALTER DATABASE [MealPlanner] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MealPlanner] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MealPlanner] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MealPlanner] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MealPlanner] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MealPlanner] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MealPlanner] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MealPlanner] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MealPlanner] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MealPlanner] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MealPlanner] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MealPlanner] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MealPlanner] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MealPlanner] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MealPlanner] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MealPlanner] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MealPlanner] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MealPlanner] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MealPlanner] SET  MULTI_USER 
GO
ALTER DATABASE [MealPlanner] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MealPlanner] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MealPlanner] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MealPlanner] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MealPlanner] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MealPlanner] SET QUERY_STORE = OFF
GO
USE [MealPlanner]
GO
/****** Object:  Table [dbo].[groceryLists]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groceryLists](
	[groceryListId] [int] IDENTITY(1,1) NOT NULL,
	[ingredientId] [int] NOT NULL,
	[item] [varchar](50) NOT NULL,
	[groceryListImage] [varchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [pk_groceryListId] PRIMARY KEY CLUSTERED 
(
	[groceryListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[ingredientId] [int] IDENTITY(1,1) NOT NULL,
	[ingredientName] [varchar](max) NOT NULL,
	[ingredientImage] [varchar](max) NULL,
 CONSTRAINT [pk_ingredientId] PRIMARY KEY CLUSTERED 
(
	[ingredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mealPlans]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mealPlans](
	[mealPlanId] [int] IDENTITY(1,1) NOT NULL,
	[recipeId] [int] NOT NULL,
	[mealPlanName] [varchar](50) NOT NULL,
	[mealPlanImage] [varchar](50) NULL,
	[recipeCount] [int] NOT NULL,
 CONSTRAINT [pk_mealPlanId] PRIMARY KEY CLUSTERED 
(
	[mealPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[recipeId] [int] IDENTITY(1,1) NOT NULL,
	[recipeDescription] [varchar](max) NULL,
	[recipeName] [varchar](50) NULL,
	[instructions] [varchar](max) NULL,
	[cookTime] [int] NULL,
	[prepTime] [int] NULL,
	[recipeType] [varchar](50) NULL,
	[glutenFree] [bit] NULL,
	[vegetarianFriendly] [bit] NULL,
	[dairyFree] [bit] NULL,
	[nutFree] [bit] NULL,
	[veganFriendly] [bit] NULL,
	[servings] [int] NULL,
	[caloriesPerServing] [int] NULL,
	[fat] [float] NULL,
	[carbohydrates] [float] NULL,
	[protein] [float] NULL,
	[fiber] [float] NULL,
	[cholesterol] [float] NULL,
	[sodium] [float] NULL,
	[recipeImage] [varchar](max) NULL,
 CONSTRAINT [pk_recipeId] PRIMARY KEY CLUSTERED 
(
	[recipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes_ingredients]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes_ingredients](
	[recipeId] [int] NOT NULL,
	[ingredientId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/12/2018 2:06:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[recipeId] [int] NULL,
	[mealPlanId] [int] NULL,
	[groceryListId] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[salt] [varchar](50) NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [pk_userId] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__role__412EB0B6]  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[groceryLists]  WITH CHECK ADD  CONSTRAINT [fk_ingredientId2] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[ingredients] ([ingredientId])
GO
ALTER TABLE [dbo].[groceryLists] CHECK CONSTRAINT [fk_ingredientId2]
GO
ALTER TABLE [dbo].[mealPlans]  WITH CHECK ADD  CONSTRAINT [fk_recipeId1] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[mealPlans] CHECK CONSTRAINT [fk_recipeId1]
GO
ALTER TABLE [dbo].[recipes_ingredients]  WITH CHECK ADD  CONSTRAINT [fk_ingredientId3] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[ingredients] ([ingredientId])
GO
ALTER TABLE [dbo].[recipes_ingredients] CHECK CONSTRAINT [fk_ingredientId3]
GO
ALTER TABLE [dbo].[recipes_ingredients]  WITH CHECK ADD  CONSTRAINT [fk_recipeId3] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[recipes_ingredients] CHECK CONSTRAINT [fk_recipeId3]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_groceryListId] FOREIGN KEY([groceryListId])
REFERENCES [dbo].[groceryLists] ([groceryListId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_groceryListId]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_mealPlanId] FOREIGN KEY([mealPlanId])
REFERENCES [dbo].[mealPlans] ([mealPlanId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_mealPlanId]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_recipeId2] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_recipeId2]
GO
USE [master]
GO
ALTER DATABASE [MealPlanner] SET  READ_WRITE 
GO
