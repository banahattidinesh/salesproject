DROP TABLE IF EXISTS print_orders;

CREATE TABLE print_orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    location VARCHAR(50),
    product_category VARCHAR(50),
    order_amount DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO print_orders (customer_name, location, product_category, order_amount, order_date) VALUES
('Chris', 'Pune', 'T-Shirts', 250.00, '2026-06-01'),
('Aisha', 'Mumbai', 'Mugs', 45.50, '2026-06-02'),
('Raj', 'Solapur', 'T-Shirts', 125.00, '2026-06-02'),
('Chris', 'Pune', 'Hoodies', 450.00, '2026-06-03'),
('Priya', 'Bengaluru', 'Mugs', 90.00, '2026-06-03'),
('Amit', 'Pune', 'T-Shirts', 300.00, '2026-06-04'),
('Sarah', 'New York', 'Hoodies', 500.00, '2026-06-04');


select product_category, SUM(order_amount) as total_revenue
from print_orders
group by product_category;  

select product_category, SUM(order_amount) as total_revenue
from print_orders
group by product_category
having SUM(order_amount) > 500
order by total_revenue desc;  


DROP TABLE IF EXISTS registered_users;

CREATE TABLE registered_users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    signup_city VARCHAR(50)
);

INSERT INTO registered_users (username, email, signup_city) VALUES
('Chris', 'chris@multiverse.com', 'Pune'),
('Aisha', 'aisha@tech.in', 'Mumbai'),
('Raj', 'raj.b@data.com', 'Solapur'),
('Priya', 'priya@design.in', 'Bengaluru'),
('Amit', 'amit.ops@logistics.com', 'Pune'),
('Nina', 'nina@undiscovered.com', 'Delhi');


select a.order_id, a.customer_name as username, a.product_category, b.email
from print_orders a
INNER JOIN registered_users b ON a.customer_name = b.username;


select a.username, a.email
from registered_users a
LEFT JOIN print_orders b ON a.username = b.customer_name
where b.order_id is NULL;

