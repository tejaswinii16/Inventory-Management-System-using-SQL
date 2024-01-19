-- Create tables

-- Product table to store information about stocked products
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity_in_stock INT NOT NULL,
    minimum_quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Supplier table to store information about product suppliers
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    contact_number VARCHAR(20)
);

-- Order table to store information about product orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    order_date DATE NOT NULL,
    order_quantity INT NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    supplier_id INT REFERENCES suppliers(supplier_id)
);

-- Customer table to store information about customers
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20)
);

-- Manager table to store information about managers
CREATE TABLE IF NOT EXISTS managers (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20)
);

-- Sales table to store information about sales transactions
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    sale_date DATE NOT NULL,
    sale_quantity INT NOT NULL,
    total_sale DECIMAL(10, 2) NOT NULL
);

-- Example: Inserting data

-- Inserting a product
INSERT INTO products (product_id, product_name, quantity_in_stock, minimum_quantity, unit_price)
VALUES (1, 'Product A', 100, 20, 10.99);

-- Inserting a supplier
INSERT INTO suppliers (supplier_id, supplier_name, contact_person, contact_number)
VALUES (1, 'Supplier X', 'John Doe', '123-456-7890');

-- Inserting an order
INSERT INTO orders (order_id, product_id, order_date, order_quantity, total_cost, supplier_id)
VALUES (1, 1, '2024-01-20', 50, 549.50, 1);

-- Inserting a customer
INSERT INTO customers (customer_id, customer_name, contact_number)
VALUES (1, 'Customer Y', '987-654-3210');

-- Inserting a manager
INSERT INTO managers (manager_id, manager_name, contact_number)
VALUES (1, 'Manager Z', '555-123-4567');

-- Inserting a sale
INSERT INTO sales (sale_id, product_id, customer_id, sale_date, sale_quantity, total_sale)
VALUES (1, 1, 1, '2024-01-21', 10, 109.90);

-- Example: Query to check products below minimum quantity
SELECT * FROM products WHERE quantity_in_stock < minimum_quantity;

-- Example: Query to get total sales for a specific customer
SELECT customer_name, SUM(total_sale) AS total_sales
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
GROUP BY customer_name;


