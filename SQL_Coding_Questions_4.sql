-- Q1) Pull a list of customer ids with the customer’s full name, and address,
-- along with combining their city and country together. Be sure to make a
-- space in between these two and make it UPPER CASE.

SELECT CustomerId, FirstName, LastName, Address,
UPPER(City || ' ' || Country)
FROM Customers

------------------------------------------------------------------------------------
-- Q2) Create a new employee user id by combining the first 4 letter of the
-- employee’s first name with the first 2 letters of the employee’s last name.
-- Make the new field lower case and pull each individual step to show your work.

SELECT EmployeeId, LOWER(SUBSTR(FirstName,1,4)||SUBSTR(LastName,1,2))
FROM Employees

------------------------------------------------------------------------------------
-- Q3) Show a list of employees who have worked for the company for 15 or more
-- years using the current date function. Sort by lastname ascending.

SELECT EmployeeId, FirstName, LastName,
DATE('now') - DATE(HireDate) AS 'Years Worked'
FROM Employees
WHERE (DATE('now') - DATE(HireDate)) >= 15
ORDER BY LastName ASC

------------------------------------------------------------------------------------
-- Q4) Profiling the Customers table, answer the following question.

SELECT * FROM Customers
WHERE  FirstName ISNULL
-- PostalCode ISNULL
-- Address ISNULL
-- Phone ISNULL
-- Fax ISNULL
-- Company ISNULL

-- try each of the WHERE lines one at a time

------------------------------------------------------------------------------------
-- Q5) Find the cities with the most customers and rank in descending order.

SELECT City, COUNT(CustomerId)
FROM Customers
GROUP BY City
ORDER BY COUNT(CustomerId) DESC

------------------------------------------------------------------------------------
-- Q6) Create a new customer invoice id by combining a customer’s invoice id with
-- their first and last name while ordering your query in the following order:
-- firstname, lastname, and invoiceID.

SELECT InvoiceId, FirstName, LastName,
FirstName||LastName||InvoiceId AS CustomerInvoiceId
FROM Invoices I INNER JOIN Customers C ON I.CustomerId = C.CustomerId
ORDER BY FirstName, LastName, InvoiceId
