USE [master]
GO
/****** Object:  Database [MealPlanner]    Script Date: 12/19/2018 3:07:24 PM ******/
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
/****** Object:  Table [dbo].[groceryLists]    Script Date: 12/19/2018 3:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groceryLists](
	[groceryListId] [int] IDENTITY(1,1) NOT NULL,
	[ingredientId] [int] NULL,
	[item] [varchar](50) NULL,
	[groceryListImage] [varchar](max) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [pk_groceryListId1] PRIMARY KEY CLUSTERED 
(
	[groceryListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 12/19/2018 3:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[ingredientId] [int] IDENTITY(1,1) NOT NULL,
	[ingredientName] [varchar](max) NOT NULL,
	[ingredientImage] [varchar](max) NULL,
 CONSTRAINT [pk_ingredientId1] PRIMARY KEY CLUSTERED 
(
	[ingredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mealPlans]    Script Date: 12/19/2018 3:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mealPlans](
	[mealPlanId] [int] IDENTITY(1,1) NOT NULL,
	[mealPlanName] [varchar](max) NOT NULL,
	[mealPlanImage] [varchar](max) NULL,
	[recipeCount] [int] NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [pk_mealPlanId1] PRIMARY KEY CLUSTERED 
(
	[mealPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mealPlans_recipes]    Script Date: 12/19/2018 3:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mealPlans_recipes](
	[mealPlanId] [int] NOT NULL,
	[recipeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 12/19/2018 3:07:25 PM ******/
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
/****** Object:  Table [dbo].[recipes_ingredients]    Script Date: 12/19/2018 3:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes_ingredients](
	[recipeId] [int] NOT NULL,
	[ingredientId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/19/2018 3:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[recipeId] [int] NULL,
	[groceryListId] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[salt] [varchar](50) NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [pk_userId1] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[groceryLists] ON 

INSERT [dbo].[groceryLists] ([groceryListId], [ingredientId], [item], [groceryListImage], [quantity]) VALUES (1, NULL, N'Strawberry''s', N'https://cdn1.medicalnewstoday.com/content/images/articles/271/271285/three-strawberries.jpg', 1)
INSERT [dbo].[groceryLists] ([groceryListId], [ingredientId], [item], [groceryListImage], [quantity]) VALUES (2, 3, N'Potato Starch', N'https://www.bobsredmill.com/media/catalog/product/cache/1/thumbnail/670x630/9df78eab33525d08d6e5fb8d27136e95/1/4/1444s224_potatostarch_f_hr_1.jpg', 1)
INSERT [dbo].[groceryLists] ([groceryListId], [ingredientId], [item], [groceryListImage], [quantity]) VALUES (3, NULL, N'rice', N'yes', 2)
SET IDENTITY_INSERT [dbo].[groceryLists] OFF
SET IDENTITY_INSERT [dbo].[ingredients] ON 

INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (1, N'Rice Flour', N'https://www.bobsredmill.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/4/1460c244_brownriceflour_f_1800.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (2, N'Tapioca Flour', N'http://kdlfoods.com/image/cache/data/Bobs-Red-Mill-Tapioca-Flour-039978025357-500x500.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (3, N'Potato Starch', N'https://www.bobsredmill.com/media/catalog/product/cache/1/thumbnail/670x630/9df78eab33525d08d6e5fb8d27136e95/1/4/1444s224_potatostarch_f_hr_1.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (4, N'Sweet Cream Buttermilk Powder', N'https://www.bobsredmill.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/2/1290c244_sweetcreambuttermilkpowder_f_1800.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (5, N'Sugar', N'https://dcassetcdn.com/design_img/900074/153037/153037_5172790_900074_image.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (6, N'Sugar Substitute', N'https://livethelive.files.wordpress.com/2014/03/sweeteners.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (7, N'Baking Powder', N'https://target.scene7.com/is/image/Target/GUEST_e227abc0-03c6-45dd-a41d-bf47f4a9741d?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (8, N'Baking Soda', N'https://pics.drugstore.com/prodimg/195585/900.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (9, N'Salt', N'http://pauseforthought.com/wp-content/uploads/2015/04/PFT_MORTON_11.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (10, N'Xanthan Gum', N'https://www.bobsredmill.com/media/catalog/product/cache/1/thumbnail/670x630/9df78eab33525d08d6e5fb8d27136e95/1/5/1599s086_xanthangum_f_hr_1.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (11, N'Eggs', N'https://www.drweil.com/wp-content/uploads/2015/11/diet-nutrition_food-safety_are-pastured-eggs-better_88518085-1024x768.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (12, N'Canola Oil', N'https://www.londondrugs.com/on/demandware.static/-/Sites-londondrugs-master/default/dw7eb8df1b/products/L2263267/large/L2263267.JPG')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (13, N'Water', N'https://cdn.trendhunterstatic.com/thumbs/kitchen-water-faucets.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (14, N'Flaked Coconut', N'https://images-na.ssl-images-amazon.com/images/I/71a-Hbp21kL._SL1500_.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (15, N'Chopped Walnuts', N'https://i5.walmartimages.com/asr/eb02802f-d351-4112-a55d-7ce5aa3f9a9c_1.24a3228e6de090ce5f80c8d75d6cdeea.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (16, N'Coconut Milk', N'http://cdn.shopify.com/s/files/1/2603/1874/products/b4e2d537fdb4a65f1033ba7cd062f692_e7170239-804c-4460-917b-8089fed33119_1024x1024.jpg?v=1530121071')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (17, N'Olive Oil', N'https://images-na.ssl-images-amazon.com/images/I/71lrgj69NQL._SY679_.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (18, N'Vanilla Extract', N'https://images.samsclubresources.com/is/image/samsclub/0005210003021_A?$img_size_380x380$')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (19, N'Caraway Seeds', N'https://target.scene7.com/is/image/Target/GUEST_f3302b7e-57c4-4ecf-a95c-3fee66ee5205?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (20, N'Dried Oregano', N'https://www.indiameetsindia.org/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/0/5/053kidahe001.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (21, N'Garlic Salt', N'https://target.scene7.com/is/image/Target/GUEST_529a21c7-1777-4fa4-97d7-b8cf893ffbbd')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (22, N'Ground Black Pepper', N'https://target.scene7.com/is/image/Target/GUEST_8f56133a-a671-4150-962e-95dcc9f64c5c?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (23, N'Red Pepper Flakes', N'https://scontent.harristeeter.com/legacy/productimagesroot/DJ/8/481398.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (24, N'Ground Beef', N'https://i5.walmartimages.com/asr/571536d7-21f8-47ac-91ad-e3aece147fbe_3.2c17603139a9a6193a87c5ddae92f385.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (25, N'Parmesan Cheese', N'https://pics.drugstore.com/prodimg/413433/450.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (26, N'Shredded Mozzarella Cheese', N'https://d1bjorv296jxfn.cloudfront.net/s3fs-public/products/product-packaging/40055_SH_Mzzrll_8oz_Fn.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (27, N'Tomato Sauce', N'https://www.dollargeneral.com/media/catalog/product/cache/image/700x700/e9c3970ab036de70892d86c6d221abfe/0/0/00817301_1.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (28, N'Pepperoni Slices', N'https://d2lnr5mha7bycj.cloudfront.net/product-image/file/large_b032a98f-4824-4174-846a-70425de3ab20.JPG')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (29, N'Sweet Italian Sausage', N'https://www.premiofoods.com/content/uploads/2017/04/Sweet-Italian-Sausage-crop1.png')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (30, N'Onion', N'https://s3.amazonaws.com/cdn.dixondalefarms.com/images/popup/TWTexasEarlyWhite.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (31, N'Garlic Cloves', N'https://d2droglu4qf8st.cloudfront.net/2016/03/268082/recipe-16282_Category-CategoryPageDefault_ID-1515170.jpg?v=1515170')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (32, N'Crushed Tomatoes', N'https://target.scene7.com/is/image/Target/GUEST_377a75b1-4b74-410c-918b-28ad14ddbab7?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (33, N'Tomato Paste', N'https://www.dollargeneral.com/media/catalog/product/cache/image/700x700/e9c3970ab036de70892d86c6d221abfe/0/0/00817203.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (34, N'Dried Basil Leaves', N'https://target.scene7.com/is/image/Target/GUEST_66f65393-8b21-400f-84e8-a7b578ca0404?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (35, N'Fennel Seed', N'https://d2lnr5mha7bycj.cloudfront.net/product-image/file/large_e7e32003-5d1d-4d40-a515-8c1cc2369c73.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (36, N'Italian Seasoning', N'https://target.scene7.com/is/image/Target/GUEST_ac178f76-cf1d-400f-b4df-3ee041df0696?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (37, N'Fresh Parsley', N'https://media.glamour.com/photos/5696705ceaefd309768df4aa/master/w_1280,c_limit/home-2014-09-convert-fresh-herbs-to-dried-0910-main.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (38, N'Lasagna Noodles', N'https://img.aws.livestrongcdn.com/ls-article-image-673/ds-photo/getty/article/103/176/484082555.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (39, N'Ricotta Cheese', N'https://www.shopcaputos.com/store/Assets/ProductImages/00074030102850.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (40, N'Parmigiano-Reggiano', N'https://www.wegmans.com/content/dam/wegmans/products/614/332614.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (41, N'Spaghetti', N'https://www.cheatsheet.com/wp-content/uploads/2014/09/iStock_000005748326_Small.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (42, N'Apple', N'http://usapple.org/wp-content/uploads/2016/01/ThinkstockPhotos-177437649.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (43, N'Nectarine', N'https://images.samsclubresources.com/is/image/samsclub/0003338332316_A?$img_size_380x380$')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (44, N'Celery', N'http://www.gosocial.co/wp-content/uploads/2017/07/celery-1.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (45, N'Dried Cranberries', N'https://target.scene7.com/is/image/Target/GUEST_c5489773-70a4-43ca-a019-3f2581343acf?wid=488&hei=488&fmt=pjpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (46, N'Lemon Yogurt', N'https://pics.drugstore.com/prodimg/467965/900.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (47, N'Semi-Sweet Chocolate Chips', N'https://i5.walmartimages.com/asr/7986bcc9-955b-40c3-82f7-a2c5e0126b25_2.f48dc151ea3d906bf5d970b3f620da25.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (48, N'Cocoa Powder', N'https://www.nowfoods.com/sites/default/files/styles/product_page_image/public/sku-images/6672_v7.png?itok=V-XcN_xh')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (49, N'Sorghum Flour', N'https://www.bobsredmill.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/5/2530c224_sorghumflour_f_1800.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (50, N'Teff Flour', N'https://www.bobsredmill.com/media/catalog/product/cache/1/thumbnail/670x630/9df78eab33525d08d6e5fb8d27136e95/1/5/1534c244_teffflour_f_1800.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (51, N'Butter', N'https://d2lnr5mha7bycj.cloudfront.net/product-image/file/large_299063a1-8b32-4804-96da-ad8ef705ae92.JPG')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (52, N'Farfalle', N'https://cdn.pixabay.com/photo/2014/10/20/22/05/farfalle-495748_1280.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (53, N'Boneless Skinless Chicken Breasts', N'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/3/2/0/0/1330023-1-eng-GB/Poultry-producer-pecks-at-portion-packaging_wrbm_large.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (54, N'Sun Dried Tomatoes', N'https://i5.walmartimages.com/asr/d94677ef-13d5-4b16-a44a-3b8ba54dec36_1.c30f728e09399a83ae8c617c3051360d.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (55, N'Pesto Sauce', N'http://cdn.shopify.com/s/files/1/1957/4651/products/7079690020_600x.jpg?v=1494256156')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (56, N'Rice Vermicelli', N'https://images-na.ssl-images-amazon.com/images/I/81cAKNthDPL._SY550_.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (57, N'Rice Wrappers', N'https://2.bp.blogspot.com/-3FhaCCYkySU/UBVmmLxYq6I/AAAAAAAAHMQ/fDIyop9Kw2k/s1600/Vietnamese+Rolls+001.JPG')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (58, N'Shrimp', N'https://cdnimg.webstaurantstore.com/images/products/extra_large/427850/1598151.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (59, N'Fresh Basil', N'https://www.precisionnutrition.com/wp-content/uploads/2009/11/basil-bsp.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (60, N'Mint Leaves', N'https://d2lnr5mha7bycj.cloudfront.net/product-image/file/large_f5df8a22-650c-4428-a6db-46e6422acbbb.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (61, N'Fresh Cilantro', N'http://organicbiomama.com/wp-content/uploads/2017/05/Cilantro-1024x682.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (62, N'Lettuce', N'https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/2018/ecolitainted.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (63, N'Fish Sauce', N'https://chefshop.com/GetImage.ashx?Path=~%2FAssets%2FProductImages%2FRed-Boat-Fish-Sauce-40-degree-north.jpg&maintainAspectRatio=true&maxHeight=480&maxWidth=480')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (64, N'Lime Juice', N'https://images-na.ssl-images-amazon.com/images/I/81PqqS3VybL._SL1500_.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (65, N'Chili Garlic Sauce', N'https://i5.walmartimages.com/asr/ef7f8902-fa4e-467d-b5b5-c8c86005762f_1.490602a0264d8ad9bd0c04748dcbcdf0.jpeg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (66, N'Hoisin Sauce', N'https://az836796.vo.msecnd.net/media/image/product/en/large/0067277401152.jpg')
INSERT [dbo].[ingredients] ([ingredientId], [ingredientName], [ingredientImage]) VALUES (67, N'Peanuts', N'https://www.stockupexpress.com/media/catalog/product/cache/5/image/9df78eab33525d08d6e5fb8d27136e95/0/2/029000073241.png')
SET IDENTITY_INSERT [dbo].[ingredients] OFF
SET IDENTITY_INSERT [dbo].[mealPlans] ON 

INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (1, N'Meal Plan 1', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (2, N'Meal Plan 2', N'https://image.flaticon.com/icons/svg/18/18353.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (3, N'Meal Plan 3', N'https://image.flaticon.com/icons/svg/93/93109.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (4, N'Meal Plan 4', N'https://image.flaticon.com/icons/svg/70/70576.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (5, N'Meal Plan 5', N'https://image.flaticon.com/icons/svg/18/18515.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (6, N'Meal Plan 6', N'https://image.flaticon.com/icons/svg/18/18120.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (7, N'Meal Plan 7', N'https://image.flaticon.com/icons/svg/18/18536.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (8, N'Meal Plan 8', N'https://image.flaticon.com/icons/svg/93/93079.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (9, N'Meal Plan 9', N'https://image.flaticon.com/icons/svg/93/93085.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (10, N'Meal Plan 10', N'https://image.flaticon.com/icons/svg/93/93091.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (11, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (12, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (13, N'ye', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (14, N'r2d2 deep swag action', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (15, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (16, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 1)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (17, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 2)
INSERT [dbo].[mealPlans] ([mealPlanId], [mealPlanName], [mealPlanImage], [recipeCount], [userID]) VALUES (18, N'Jeffreh', N'https://image.flaticon.com/icons/svg/93/93104.svg', NULL, 2)
SET IDENTITY_INSERT [dbo].[mealPlans] OFF
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (11, 6)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (12, 1)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (13, 1)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (14, 1)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (15, 1)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (16, 1)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (17, 3)
INSERT [dbo].[mealPlans_recipes] ([mealPlanId], [recipeId]) VALUES (18, 3)
SET IDENTITY_INSERT [dbo].[recipes] ON 

INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (1, N'Makes fluffy pancakes with a consistency and taste comparable to those made with wheat flour. Serve with your choice of condiments.', N'Delicious Gluten-Free Pancakes', N'In a bowl, mix or sift together the rice flour, tapioca flour, potato starch, dry buttermilk powder, sugar substitute, baking powder, baking soda, salt, and xanthan gum. Stir in eggs, water, and oil until well blended and few lumps remain. | Heat a large, well-oiled skillet or griddle over medium high heat. Spoon batter onto skillet and cook until bubbles begin to form. Flip, and continue cooking until golden brown on bottom. Serve immediately with condiments of your choice.', 15, 20, N'Breakfast', 1, 1, 0, 1, 0, 10, 147, 5.8, 20.4, 3.1, 0.7, 29, 269, N'https://images.media-allrecipes.com/userphotos/720x405/385145.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (2, N'I made this for my mom''s 65th birthday and frosted it with a simple vanilla buttercream. No one can tell it''s gluten free!', N'Gluten-Free Coconut Cake', N'Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x13-inch baking dish. | Whisk flour, sugar, coconut, walnuts, baking powder, baking soda, xanthan gum, and salt together in a bowl. Add coconut milk, vegetable oil, eggs, and vanilla extract; mix until batter is smooth. Spread batter into the prepared baking dish. | Bake in the preheated oven until a toothpick inserted in the center comes out clean, about 45 minutes.', 45, 15, N'Dessert', 1, 1, 0, 0, 0, 16, 345, 22.3, 35.2, 4.3, 2.9, 46, 355, N'https://images.media-allrecipes.com/userphotos/720x405/2184389.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (3, N'For people that are gluten-intolerant, low-carb, paleo, or whatever, it can be hard to go without pizza. This dish makes it a lot easier. It is made pretty much exactly the same as pizza, but with ground beef as the crust. Sounds weird at first, but it is absolutely delicious and very filling. This is something great to make ahead of time and then eat as leftovers later on. It''s great hot or cold, just like pizza! I find that if you make 6 square slices, each slice is usually more than enough to fill you up. Feel free to add whatever toppings you normally eat on pizza. It will taste just as good!', N'Pepperoni Meatza', N'Preheat oven to 450 degrees F (230 degrees C). | Mix together salt, caraway seeds, oregano, garlic salt, ground black pepper, and crushed red pepper flakes in a small bowl. | Mix ground beef and eggs in a mixing bowl until thoroughly incorporated. Add Parmesan cheese and seasoning mixture to beef; combine. Press ground beef mixture into a 12x17-inch pan, spread out evenly. | Bake in the preheated oven until meat is no longer pink, about 10 minutes. Drain grease. | Set oven rack about 6 inches from the heat source and turn on the oven''s broiler. | Sprinkle 1/3 of the mozzarella cheese over baked meat, followed by tomato sauce in an even layer. Sprinkle another 1/3 of the mozzarella cheese over the sauce and top with slices of pepperoni. Sprinkle remaining mozzarella cheese over pizza. | Broil until cheese is melted, bubbling, and lightly browned, 3 to 5 minutes.', 15, 30, N'Lunch', 1, 0, 0, 1, 0, 6, 506, 27.8, 5.1, 56.5, 1, 220, 2521, N'https://images.media-allrecipes.com/userphotos/720x405/2083257.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (4, N'It takes a little work, but it is worth it.', N'World''s Best Lasagna', N'In a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 tablespoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally. | Bring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt. | Preheat oven to 375 degrees F (190 degrees C). | To assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13 inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese. | Bake in preheated oven for 25 minutes. Remove foil, and bake an additional 25 minutes. Cool for 15 minutes before serving.', 150, 30, N'Dinner', 0, 0, 0, 1, 0, 12, 448, 21.3, 36.5, 29.7, 4, 82, 1788, N'https://images.media-allrecipes.com/userphotos/720x405/3359675.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (5, N'No two spaghetti aglio e olio recipes are alike, but this one is pretty true to the classic method. The key is slowly toasting the garlic slices to a perfect golden-brown in the olive oil. If it''s too light, you don''t get the full flavor and if it''s too dark it gets bitter. My advice? Do it perfectly.', N'Spaghetti Aglio e Olio', N'Bring a large pot of lightly salted water to a boil. Cook spaghetti in the boiling water, stirring occasionally until cooked through but firm to the bite, about 12 minutes. Drain and transfer to a pasta bowl. | Combine garlic and olive oil in a cold skillet. Cook over medium heat to slowly toast garlic, about 10 minutes. Reduce heat to medium-low when olive oil begins to bubble. Cook and stir until garlic is golden brown, about another 5 minutes. Remove from heat. | Stir red pepper flakes, black pepper, and salt into the pasta. Pour in olive oil and garlic, and sprinkle on Italian parsley and half of the Parmigiano-Reggiano cheese; stir until combined. | Serve pasta topped with the remaining Parmigiano-Reggiano cheese.', 22, 10, N'Dinner', 0, 1, 1, 1, 1, 2, 1509, 69, 174.8, 45.8, 7.8, 35, 710, N'https://images.media-allrecipes.com/userphotos/720x405/3727226.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (6, N'I modified an old family favorite recipe upon going gluten-free. It is easy and super yummy and naughty. If you prefer to use a premade GF flour mix instead of the flours suggested, it will work just as well.', N'The Best Gluten Free Brownies Ever...Seriously', N'Preheat oven to 350 degrees F (175 degrees C). Grease a 9x9-inch baking pan. | Toss walnuts and chocolate chips with 1 teaspoon cocoa powder in a bowl until well coated; set aside. Mix tapioca flour, sorghum flour, teff flour, 1/3 cup cocoa powder, xanthan gum, and salt together in a separate bowl. | Beat butter and sugar together in a separate large bowl until creamy. Stir in eggs and vanilla extract. Gradually add flour mixture to butter mixture until fully incorporated. Fold in nuts and chocolate chips. Spread batter into the prepared baking pan. | Bake in the preheated oven until the top is dry and the edges have started to pull away from the sides of the pan, about 25 minutes.', 25, 20, N'Dessert', 1, 1, 0, 0, 0, 9, 375, 21.8, 45.9, 4.8, 4.1, 68, 105, N'https://images.media-allrecipes.com/userphotos/720x405/3564251.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (7, N'An easy, quick, and holiday-worthy fruit salad that is easily doubled.', N'Fabulous Fruit Salad', N'In a large bowl, combine red apple, Granny Smith apple, nectarine, celery, dried cranberries, and walnuts. Mix in yogurt. Chill until ready to serve.', 0, 20, N'Snack', 1, 1, 0, 1, 1, 4, 243, 9.8, 37.4, 5.8, 4.1, 1, 55, N'https://images.media-allrecipes.com/userphotos/720x405/614043.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (8, N'These spring rolls are a refreshing change from the usual fried variety, and have become a family favorite. They are great as a cool summertime appetizer, and are delicious dipped in one or both of the sauces.', N'Vietnamese Fresh Spring Rolls', N'Bring a medium saucepan of water to boil. Boil rice vermicelli 3 to 5 minutes, or until al dente, and drain. | Fill a large bowl with warm water. Dip one wrapper into the hot water for 1 second to soften. Lay wrapper flat. In a row across the center, place 2 shrimp halves, a handful of vermicelli, basil, mint, cilantro and lettuce, leaving about 2 inches uncovered on each side. Fold uncovered sides inward, then tightly roll the wrapper, beginning at the end with the lettuce. Repeat with remaining ingredients. | In a small bowl, mix the fish sauce, water, lime juice, garlic, sugar and chili sauce. | In another small bowl, mix the hoisin sauce and peanuts. | Serve rolled spring rolls with the fish sauce and hoisin sauce mixtures.', 5, 45, N'Lunch', 1, 0, 1, 0, 0, 8, 82, 0.7, 15.8, 3.3, 0.6, 11, 305, N'https://images.media-allrecipes.com/userphotos/720x405/5265636.jpg')
INSERT [dbo].[recipes] ([recipeId], [recipeDescription], [recipeName], [instructions], [cookTime], [prepTime], [recipeType], [glutenFree], [vegetarianFriendly], [dairyFree], [nutFree], [veganFriendly], [servings], [caloriesPerServing], [fat], [carbohydrates], [protein], [fiber], [cholesterol], [sodium], [recipeImage]) VALUES (9, N'Easy and delicious pasta with chicken. Serve with crusty bread and salad for a quick dinner. Use as much or as little pesto sauce as you like. Using homemade pesto will taste even better, but it adds to prep time. Enjoy!', N'Pesto Pasta with Chicken', N'Bring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain. | Heat oil in a large skillet over medium heat. Saute garlic until tender, then stir in chicken. Season with red pepper flakes. Cook until chicken is golden, and cooked through. | In a large bowl, combine pasta, chicken, sun-dried tomatoes and pesto. Toss to coat evenly.', 20, 10, N'Dinner', 0, 0, 0, 1, 0, 8, 328, 10.1, 43.3, 17.4, 2.7, 22, 154, N'https://images.media-allrecipes.com/userphotos/720x405/1316887.jpg')
SET IDENTITY_INSERT [dbo].[recipes] OFF
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 2)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 1)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 3)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 4)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 6)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 7)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 8)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 10)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 11)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 12)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (1, 13)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 1)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 2)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 5)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 14)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 15)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 7)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 8)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 10)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 16)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 17)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 11)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (2, 18)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 19)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 20)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 21)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 23)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 24)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 11)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 25)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 26)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 27)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (3, 28)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 29)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 24)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 30)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 31)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 32)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 33)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 27)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 13)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 5)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 34)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 35)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 36)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 22)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 37)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 38)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 39)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 11)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 26)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (4, 25)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 41)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 31)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 17)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 23)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 22)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 37)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (5, 40)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 15)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 47)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 48)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 2)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 49)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 50)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 10)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 9)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 51)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 5)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 11)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (6, 18)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 42)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 43)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 44)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 45)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 15)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (7, 46)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 52)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 17)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 31)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 53)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 23)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 24)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (8, 55)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 56)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 57)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 58)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 59)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 60)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 61)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 62)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 63)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 13)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 64)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 31)
GO
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 5)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 65)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 66)
INSERT [dbo].[recipes_ingredients] ([recipeId], [ingredientId]) VALUES (9, 67)
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [recipeId], [groceryListId], [username], [password], [salt], [role]) VALUES (1, NULL, NULL, N'r2d2@r2d2.com', N'8/124xNWfP/g9gMDS8CQBLGeVlc=', N'V6Rzkbf58pQ=', N'User')
INSERT [dbo].[users] ([userId], [recipeId], [groceryListId], [username], [password], [salt], [role]) VALUES (2, NULL, NULL, N'yolo@yolo', N'WfhQfLsS7HmLSSinHCSqHKQ6zuM=', N'dlF9xgOOypU=', N'User')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[mealPlans] ADD  CONSTRAINT [DF_mealPlans_userID]  DEFAULT ((1)) FOR [userID]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[groceryLists]  WITH CHECK ADD  CONSTRAINT [fk_ingredientId1] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[ingredients] ([ingredientId])
GO
ALTER TABLE [dbo].[groceryLists] CHECK CONSTRAINT [fk_ingredientId1]
GO
ALTER TABLE [dbo].[mealPlans]  WITH CHECK ADD  CONSTRAINT [FK_mealPlans_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[mealPlans] CHECK CONSTRAINT [FK_mealPlans_users]
GO
ALTER TABLE [dbo].[mealPlans_recipes]  WITH CHECK ADD  CONSTRAINT [fk_mealPlanId2] FOREIGN KEY([mealPlanId])
REFERENCES [dbo].[mealPlans] ([mealPlanId])
GO
ALTER TABLE [dbo].[mealPlans_recipes] CHECK CONSTRAINT [fk_mealPlanId2]
GO
ALTER TABLE [dbo].[mealPlans_recipes]  WITH CHECK ADD  CONSTRAINT [fk_recipeId3] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[mealPlans_recipes] CHECK CONSTRAINT [fk_recipeId3]
GO
ALTER TABLE [dbo].[recipes_ingredients]  WITH CHECK ADD  CONSTRAINT [fk_ingredientId2] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[ingredients] ([ingredientId])
GO
ALTER TABLE [dbo].[recipes_ingredients] CHECK CONSTRAINT [fk_ingredientId2]
GO
ALTER TABLE [dbo].[recipes_ingredients]  WITH CHECK ADD  CONSTRAINT [fk_recipeId2] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[recipes_ingredients] CHECK CONSTRAINT [fk_recipeId2]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_groceryListId1] FOREIGN KEY([groceryListId])
REFERENCES [dbo].[groceryLists] ([groceryListId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_groceryListId1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_recipeId1] FOREIGN KEY([recipeId])
REFERENCES [dbo].[recipes] ([recipeId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_recipeId1]
GO
USE [master]
GO
ALTER DATABASE [MealPlanner] SET  READ_WRITE 
GO
