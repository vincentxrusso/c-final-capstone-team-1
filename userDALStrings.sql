use MealPlanner


declare  @username varchar(50);
set @username= 'Vinnie';
declare  @password varchar(50);
set @password = 'Vinnie'
declare  @salt varchar(50);
set @salt = 'Vinnie';
declare  @role varchar(50);
set @role = 'User';



INSERT INTO users (username, password, salt, role)VALUES (@username, @password, @salt, @role);