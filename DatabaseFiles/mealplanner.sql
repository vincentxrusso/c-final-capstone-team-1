USE MealPlanner;

BEGIN TRANSACTION;

CREATE TABLE ingredients
(
	ingredientId int IDENTITY(1,1) NOT NULL,
	ingredientName varchar(max) NOT NULL,
	ingredientImage varchar(max) NULL,

	constraint pk_ingredientId primary key (ingredientId)
);

CREATE TABLE groceryLists
(
	groceryListId int IDENTITY(1,1) NOT NULL,
	ingredientId int NULL,
	item varchar(50) NULL,
	groceryListImage varchar(50) NULL,
	quantity int NULL,

	constraint pk_groceryListId primary key(groceryListId),
	constraint fk_ingredientId2 foreign key(ingredientId) references ingredients (ingredientId)
);

CREATE TABLE recipes
(
	recipeId int IDENTITY(1,1) NOT NULL,
	recipeDescription varchar(max) NULL,
	recipeName varchar(50) NULL,
	instructions varchar(max) NULL,
	cookTime int NULL,
	prepTime int NULL,
	recipeType varchar(50) NULL,
	glutenFree bit NULL,
	vegetarianFriendly bit NULL,
	dairyFree bit NULL,
	nutFree bit NULL,
	veganFriendly bit NULL,
	servings int NULL,
	caloriesPerServing int NULL,
	fat float NULL,
	carbohydrates float NULL,
	protein float NULL,
	fiber float NULL,
	cholesterol float NULL,
	sodium float NULL,
	recipeImage varchar(max) NULL,

	constraint pk_recipeId primary key(recipeId)
);

CREATE TABLE mealPlans
(
	mealPlanId int IDENTITY(1,1) NOT NULL,
	recipeId int NULL,
	mealPlanName varchar(max) NOT NULL,
	mealPlanImage varchar(max) NULL,
	recipeCount int NULL,

	constraint pk_mealPlanId primary key(mealPlanId), 
	constraint fk_recipeId1 foreign key(recipeId) references recipes (recipeId)
);

CREATE TABLE users
(
	userId int IDENTITY(1,1) NOT NULL,
	recipeId int NULL,
	mealPlanId int NULL,
	groceryListId int NULL,
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	salt varchar(50) NOT NULL,
	role varchar(50) default('user'),

	constraint pk_userId primary key (userId),
	constraint fk_recipeId2 foreign key (recipeId) references recipes (recipeId),
	constraint fk_mealPlanId foreign key (mealPlanId) references mealPlans (mealPlanId),
	constraint fk_groceryListId foreign key (groceryListId) references groceryLists (groceryListId)
);

CREATE TABLE recipes_ingredients
(
	recipeId int NOT NULL,
	ingredientId int NOT NULL,

	constraint fk_recipeId3 foreign key (recipeId) references recipes (recipeId),
	constraint fk_ingredientId3 foreign key (ingredientId) references ingredients (ingredientId)
);

COMMIT TRANSACTION;