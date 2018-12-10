USE [MealPlanner]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 12/10/2018 5:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[recipeId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
	[name] [varchar](50) NULL,
	[instructions] [varchar](max) NULL,
	[cookTime] [int] NULL,
	[prepTime] [int] NULL,
	[recipeType] [varchar](50) NULL,
	[gluten] [bit] NULL,
	[vegetarian] [bit] NULL,
	[dairy] [bit] NULL,
	[nuts] [bit] NULL,
	[vegan] [bit] NULL,
	[servings] [int] NULL,
	[caloriesPerServing] [int] NULL,
	[fat] [float] NULL,
	[carbohydrates] [float] NULL,
	[protein] [float] NULL,
	[fiber] [float] NULL,
	[cholesterol] [float] NULL,
	[sodium] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
