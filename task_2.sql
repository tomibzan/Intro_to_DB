-- Use the alx_book_store database
USE alx_book_store;
-- Drop tables if they exist (in reverse order due to foreign key dependencies)
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;
-- Create AUTHORS table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100),
    birth_date DATE
);
-- Create CUSTOMERS table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address TEXT
);
-- Create BOOKS table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    price DECIMAL(10, 2),
    publication_date DATE,
    author_id INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE
    SET NULL
);
-- Create ORDERS table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    customer_id INT,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);
-- Create ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2),
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE
    SET NULL
);