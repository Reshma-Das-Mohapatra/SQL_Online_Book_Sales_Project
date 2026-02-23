CREATE DATABASE IF NOT EXISTS Online_Book_Sales_Project;
USE Online_Book_Sales_Project;
SHOW TABLES;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;
-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books WHERE Genre='Fiction';
-- 2) Find books published after the year 1950:
SELECT * FROM Books WHERE Published_Year>1950;
-- 3) List all customers from the Canada:
SELECT * FROM Customers WHERE Country="Canada";
-- 4) Show orders placed in November 2023:
SELECT * FROM Orders WHERE MONTH(Order_Date)=11 AND YEAR(Order_Date)=2023;
-- 5) Retrieve the total stock of books available:
SELECT SUM(STOCK) AS Total_Stock FROM Books ;
-- 6) Find the details of the most expensive book:
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;
-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT C.*,O.Quantity FROM Orders AS O
INNER JOIN Customers AS C
ON O.Customer_ID=C.Customer_ID
WHERE O.Quantity >1
ORDER BY O.Quantity;
-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders WHERE Total_Amount >20;
-- 9) List all genres available in the Books table:
SELECT DISTINCT Genre FROM Books;
-- 10) Find the book with the lowest stock:
SELECT * FROM Books 
WHERE Stock= (SELECT MIN(Stock) from Books);
-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Total_Revenue from Orders ;
-- 12) Retrieve the total number of books sold for each genre:
select B.Genre,COUNT(O.Quantity) from Books As B
RIGHT JOIN Orders AS O
ON B.Book_ID=O.Book_ID
GROUP BY B.Genre;
-- 13) Find the average price of books in the "Fantasy" genre:
SELECT AVG(Price) FROM Books WHERE Genre= "Fantasy";
-- 14) List customers who have placed at least 2 orders:
SELECT C.Customer_ID,C.Name,COUNT(O.Order_ID) FROM Orders AS O
JOIN Customers AS C
ON O.Customer_ID=C.Customer_ID
GROUP BY C.Customer_ID
HAVING COUNT(O.Order_ID)>=2;
-- 15) Find the most frequently ordered book:
SELECT  B.Book_ID,B.Title,COUNT(O.Order_ID) FROM ORDERS AS O
JOIN Books AS B
ON O.Book_ID=B.Book_ID
GROUP BY B.Book_ID
ORDER BY COUNT(O.Order_ID) DESC LIMIT 1;
-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM Books WHERE Genre= "Fantasy"
ORDER BY Price DESC LIMIT 3;
-- 17) Retrieve the total quantity of books sold by each author:
SELECT B.Author,SUM(O.Quantity) FROM Orders As O
JOIN Books AS B
ON O.Book_ID =B.Book_ID
GROUP BY B.Author
ORDER BY SUM(O.Quantity) DESC;
-- 18) List the cities where customers who spent over $30 are located:
SELECT DISTINCT C.City
FROM Customers AS C
JOIN Orders AS O
ON C.Customer_ID=O.Customer_ID
WHERE O.Total_Amount > 30;
-- 19) Find the customer who spent the most on orders:
SELECT C.Customer_ID,C.Name,SUM(O.Total_Amount) FROM Orders AS O
JOIN Customers AS C
ON O.Customer_ID=C.Customer_ID
GROUP BY C.Customer_ID
order by SUM(O.Total_Amount) DESC LIMIT 1;
-- 20) Calculate the stock remaining after fulfilling all orders:
SELECT B.Book_ID,B.Title,B.Stock,R.Total_Quantity_Sold, (B.Stock-COALESCE(R.Total_Quantity_Sold,0)) AS Remainning_Stock 
FROM (SELECT Book_ID,SUM(Quantity) AS Total_Quantity_Sold FROM Orders GROUP BY Book_ID) AS R
RIGHT JOIN Books AS B
ON R.Book_ID = B.Book_ID
ORDER BY Remainning_Stock DESC ;