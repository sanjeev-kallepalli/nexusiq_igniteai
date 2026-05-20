
/* $$$$$$$$$$$$$$$$$$$$$$$ DML $$$$$$$$$$$$$$$$$$$$$$$ */

-- customers

INSERT INTO customers (full_name, email, phone, city) VALUES
('Aarav Sharma', 'aarav@example.com', '9876543210', 'Hyderabad'),
('Meera Reddy', 'meera@example.com', '9876501234', 'Bangalore'),
('John Mathew', 'john@example.com', '9876512345', 'Chennai'),
('Priya Nair', 'priya@example.com', '9876523456', 'Hyderabad');

-- validate customers
select * from customers;


-- categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Groceries'),
('Clothing'),
('Home Appliances');

-- suppliers
INSERT INTO suppliers (supplier_name, contact_email) VALUES
('TechSource Pvt Ltd', 'contact@techsource.com'),
('FreshFarm Foods', 'sales@freshfarm.com'),
('UrbanWear Co', 'support@urbanwear.com'),
('HomePro Distributors', 'info@homepro.com');

-- products
INSERT INTO products (product_name, category_id, supplier_id, price, stock) VALUES
('Smartphone A1', 1, 1, 15000, 50),
('LED TV 42"', 1, 4, 32000, 20),
('Rice 10kg', 2, 2, 550, 200),
('T-Shirt Classic', 3, 3, 499, 120),
('Microwave Oven', 4, 4, 8500, 15);

-- orders
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-05-01', 'Completed'),
(2, '2026-05-02', 'Completed'),
(1, '2026-05-03', 'Pending'),
(3, '2026-05-04', 'Completed');

--order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 15000),
(1, 3, 2, 550),
(2, 4, 3, 499),
(3, 2, 1, 32000),
(4, 5, 1, 8500);

/* $$$$$$$$$$$$$$$$$$$$$$$ DQL $$$$$$$$$$$$$$$$$$$$$$$ */

-- where condition ( used when you want to apply a condition while fetching records)

select * from customers where city = 'Hyderabad';

-- handling strings in where
select * from customers where city like 'Hyd%';

-- or 
select * from customers where lower(city) = 'hyderabad';

-- fetch using a customer_id
select * from customers where customer_id = 1;

-- fetch stock of each category.
-- link category and products
-- group by on category and sum the products stock.

SELECT c.category_name, SUM(p.stock) AS total_stock
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- fetch only category where the stock is less than 20
SELECT c.category_name, SUM(p.stock) AS total_stock
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
having sum(p.stock)<20;

--Find total revenue per customer, but only show customers who spent more than ₹7,000.
SELECT c.full_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.full_name
HAVING SUM(oi.quantity * oi.unit_price) > 7000
ORDER BY total_spent DESC;

