SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM products;

INSERT INTO products
VALUES(1,'Cookies',10.00),
      (2,'Candy',5.20) ;

INSERT INTO customer
VALUES(1,'Ahmed','Tunisia'),
      (2,'Coulibaly','Senegal'),
	  (3,'Hassan','Egypt') ;

INSERT INTO orders
VALUES(1,1,2,3,'2023-01-22'),
      (2,2,1,10,'2023-04-14') ;

--Update the quantity of the second order
UPDATE orders
SET quantity=6
WHERE order_id=2;

--Delete the third customer from the customers table

DELETE FROM Customer
WHERE customer_id=3;

--Delete the orders table content then drop the table
DELETE FROM orders;

DROP TABLE orders;



CREATE TABLE orders(
order_id INT NOT NULL,
PRIMARY KEY(Order_id),
Customer_id INT,
product_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
quantity INT NOT NULL,
order_date DATE NOT NULL);


INSERT INTO orders
VALUES(1,1,2,3,'2023-01-22'),
      (2,2,1,10,'2023-04-14') ;
UPDATE orders
SET quantity=6
WHERE order_id=2;
SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM products;

