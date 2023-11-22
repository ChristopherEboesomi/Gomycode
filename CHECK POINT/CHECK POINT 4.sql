CREATE TABLE customer(
customer_id INT PRIMARY KEY ,
Customer_name VARCHAR(50) NOT NULL,
customer_address VARCHAR(50) NOT NULL
);


CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
product_price DECIMAL(10,2) NOT NULL,
CHECK (product_price>0)
);


CREATE TABLE orders(
order_id INT NOT NULL,
PRIMARY KEY(Order_id),
Customer_id INT,
product_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
quantity INT NOT NULL,
order_date DATE NOT NULL);
