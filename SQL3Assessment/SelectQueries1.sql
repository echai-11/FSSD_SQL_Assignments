/*use food_order_app database */
use food_order_app;

/* 1. Display all distinct cuisine names. */
SELECT DISTINCT name FROM cuisine;

/* 2. Display description of 'Cake' category. */
SELECT description FROM category 
WHERE name = 'Cake';

/* 3. Select all restaurants where restaurant names ends with 'Junction'. */
SELECT * FROM restaurant
WHERE name LIKE '% Junction';

/* 4. Display details of all vegeterian fooditems. */
SELECT * FROM fooditem
WHERE isVeg = 1;

/* 5. Retrieve all menu items with food items that have a price equal to or less than $10. */
SELECT * FROM menu_items
WHERE foodItemPrice <= 10.00;

/* 6.Retrieve cartId having the maximum number of food items. */
SELECT @maxunitsincart := MAX(unitsInCart) from cart_items;
SELECT cartId from cart_items
WHERE unitsInCart = @maxunitsincart; 

SELECT cartId FROM cart_items
WHERE unitsInCart = (
	SELECT MAX(unitsInCart) FROM cart_items
);


/* 7. Retrieve all the shipping details where emailId contains 'doe'. */
SELECT * FROM shippingDetails
WHERE emailId LIKE '%doe%';

/* 8. Retrieve the order with the highest price. */
SELECT * FROM `order`
WHERE orderTotalPrice = (
	SELECT MAX(orderTotalPrice) from `order`
);

 
/* 9. Retrieve the most recently updated order. */
SELECT * FROM `order`
WHERE updatedTs = (
	SELECT MAX(updatedTs) from `order`
);

/* 10. How many total units of food items were purchased in orderId 1? */
SELECT orderId, SUM(unitsPurchased)
FROM order_items 
WHERE orderId = 1;
