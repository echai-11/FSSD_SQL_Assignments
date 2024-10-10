/* use food_order_app database */
use food_order_app;

/* 1. Retrieve number of fooditems for each cuisine */
SELECT cuisineId, COUNT(id) AS number_of_fooditems
FROM fooditem
GROUP BY cuisineId
ORDER BY cuisineId ASC;

SELECT fooditem.cuisineId, 
	   cuisine.name AS cuisine_name, 
       COUNT(fooditem.id) AS number_of_fooditems
FROM fooditem
LEFT JOIN cuisine
ON fooditem.cuisineId = cuisine.id
GROUP BY cuisineId
ORDER BY cuisineId ASC;

/* 2. Retrieve category names in the order of highest to lowest no. of fooditems */
SELECT fooditem.categoryId, 
	   category.name AS category_name,
       COUNT(fooditem.id) AS number_of_fooditems
FROM fooditem 
LEFT JOIN category
ON fooditem.categoryId = category.id
GROUP BY fooditem.categoryId
ORDER BY number_of_fooditems DESC, categoryId ASC; 

/* 3. Retrieve cuisine name as CuisineName, fooditem name as name FoodItemName 
and description as Description of all the fooditems belonging to 'Italian' cuisine */
SELECT c.name AS CuisineName, fi.name AS FoodItemName, fi.description AS `Description`
FROM fooditem fi
LEFT JOIN cuisine c
ON fi.cuisineID = c.ID
WHERE c.name = 'Italian';

/* 4. Retrieve details of food items, including their name, vegetarian status,
 and cuisine name, for only those food items that are vegetarian. */
SELECT fi.id AS FoodItemId, 
       fi.name AS FoodItemName, 
       fi.description AS `Description`, 
       c.name AS CuisineName, 
       fi.isVeg AS isVegetarian
FROM fooditem fi
LEFT JOIN cuisine c
ON fi.cuisineID = c.ID
WHERE fi.isVeg = 1;

/* 5. Retrieve the details of users who have items in their cart 
along with the total order amount */
SELECT u.id AS UserId, 
	   u.userName AS Username,
       u.fullName AS FullName,
       u.emailId AS Email,
       u.phoneNo AS PhoneNumber,
       c.id AS CartId,
       c.orderTotalprice AS OrderTotal
FROM user u
LEFT JOIN cart c
ON u.id = c.userId;