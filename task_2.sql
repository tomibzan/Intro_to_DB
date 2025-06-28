-- Use the alx_book_store database
USE alx_book_store;
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;
-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);
-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES Authors (author_id) ON DELETE CASCADE
);
-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) ON DELETE CASCADE
);
-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    CONSTRAINT fk_orderdetails_orders FOREIGN KEY (order_id) REFERENCES Orders (order_id) ON DELETE CASCADE,
    CONSTRAINT fk_orderdetails_books FOREIGN KEY (book_id) REFERENCES Books (book_id) ON DELETE CASCADE
);