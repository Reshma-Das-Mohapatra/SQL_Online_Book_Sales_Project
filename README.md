# SQL_Online_Book_Sales_Project
 -----------------------------------
* Project Overview
  -----------------
This project is an end-to-end SQL data analysis project based on an Online Book Sales database.
The goal of this project is to analyze customer behavior, book sales performance, revenue generation, stock management, and business insights using SQL queries.
The project demonstrates strong understanding of database design, joins, aggregations, subqueries, filtering, and business-driven analysis.

* Database Structure
  --------------------
The database consists of three main tables:

1️. Books
( Book_ID (Primary Key),Title,Author,Genre,Published_Year,Price,Stock )

2️. Customers
( Customer_ID (Primary Key),Name,Email,Phone,City,Country)

3️. Orders 
(Order_ID (Primary Key),Customer_ID (Foreign Key),Book_ID (Foreign Key),Order_Date,Quantity,Total_Amount)

 * Tools & Technologies Used
   ----------------------------
MySQL - SQL (Structured Query Language)

Relational Database Concepts

* Business Problems Solved
  --------------------------

This project answers real-world business questions such as:

### Basic Data Retrieval:- 
----------------------------
Retrieve all books in a specific genre.

Find books published after a certain year.

Identify customers from a specific country.

Get orders placed in a particular month.

### Sales & Revenue Analysis :-
 ----------------------------

Calculate total revenue generated.

Find customers who spent the most.

Identify most frequently ordered book.

Retrieve total quantity sold by each author.

Analyze revenue-generating orders above a threshold.

### Inventory & Stock Management:-
-------------------------------

Calculate total stock available.

Find book with lowest stock.

Compute remaining stock after fulfilling orders.

### Customer Behavior Analysis :-
------------------------------

Customers who placed multiple orders.

Customers ordering more than one quantity.

Cities where high-spending customers are located.

### Advanced SQL Concepts Used
  -----------------------------
    INNER JOIN
    RIGHT JOIN
    GROUP BY
    HAVING
    ORDER BY
    Aggregate Functions (SUM, AVG, COUNT, MIN)
    Subqueries
    DISTINCT
    COALESCE
    Filtering using WHERE clause

* Key Insights Generated
  -----------------------
  
Identified top revenue-generating customers.

Found most frequently ordered book.

Analyzed genre-wise sales performance.

Determined stock availability after fulfilling orders.

Identified high-value customers and locations.

* Skills Demonstrated
  -------------------
  
Database creation and table design.

Writing optimized SQL queries.

Data aggregation and summarization.

Business insight extraction from raw data.

Handling real-world sales scenarios.

Analytical thinking and problem solving.

* How to Run This Project ?
  --------------------------
Create the database:

CREATE DATABASE Online_Book_Sales_Project;

Use the database:

USE Online_Book_Sales_Project;

Create the tables (Books, Customers, Orders).

Run the analytical queries to generate insights.

* Project Objective
  ----------------------
The objective of this project is to simulate real-world e-commerce data analysis using SQL and demonstrate data analyst skills required in business environments.

