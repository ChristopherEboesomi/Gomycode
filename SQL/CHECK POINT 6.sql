
---Question 3
SELECT customer_name,
Count(product_name) AS count_of_product,
SUM(total_amount) AS sum_of_total_amount FROM
(SELECT c.customer_name,p.product_name,o.total_amount ,o.quantity
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE product_name IN ('Widget','Gadget')) AS M1
GROUP BY customer_name
HAVING count(product_name)>=2;


---Question 4

SELECT c.customer_name,p.product_name,o.total_amount ,o.quantity
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE product_name='Widget' AND quantity>=1;

---Question 5
SELECT c.customer_name,p.product_name,o.total_amount ,o.quantity
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE product_name='gadget'AND quantity>=1;


---QUESTION 6
SELECT c.customer_name,p.product_name,o.total_amount ,o.quantity
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE product_name='doohickey' AND quantity>=1;

---QUESTION 7
SELECT sum(quantity) AS Total_quantity,sum(total_amount) AS 
Total_cost_of_orders,product_name FROM
(SELECT c.customer_name,
p.product_name,o.quantity,p.product_price,o.total_amount
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE product_name IN ('Widget','gadget')) AS M2
GROUP BY product_name;

---QUESTION 8
SELECT product_name,sum(quantity) AS Total_quantity,
count(product_name) AS Count_Of_Product_name,
sum(total_amount) AS Total_cost_order FROM
(SELECT c.customer_name,
p.product_name,o.quantity,p.product_price,o.total_amount
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
WHERE quantity>=1) AS M3
GROUP BY product_name;
 

---QUESTION 9
SELECT customer_name,SUM(quantity) AS Total_quantity
FROM 
(SELECT c.customer_name,
p.product_name,o.quantity,p.product_price,o.total_amount
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id) AS M4
GROUP BY customer_name
ORDER BY SUM(quantity) DESC;

---QUESTION 10
SELECT product_name,sum(quantity) AS Total_quantity FROM
(SELECT c.customer_name,
p.product_name,o.quantity,p.product_price,o.total_amount
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id ) AS M5
GROUP BY product_name
ORDER BY Total_quantity DESC;

--QUESTION 11
SELECT * FROM ordersss_1



ALTER TABLE ordersss_1
ADD day_name VARCHAR(50);

UPDATE ordersss_1
SET day_name=DATENAME(DW,order_date);




SELECT c.customer_name,p.product_name,o.order_date,
o.quantity,p.product_price,o.total_amount,o.DAY_NAME
FROM customer_1 AS c
JOIN ordersss_1 AS o
ON c.customer_id=o.Customer_id
JOIN products AS p ON
p.product_id=o.product_id
ORDER BY customer_name,quantity DESC;


