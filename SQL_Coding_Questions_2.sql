--Q1) Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT COUNT(TrackId)
FROM Tracks
WHERE milliseconds >= 5000000

------------------------------------------------------------------------------------

--Q2) Find all the invoices whose total is between $5 and $15 dollars.

SELECT Count(InvoiceId)
FROM Invoices
WHERE Total BETWEEN 5 AND 15

------------------------------------------------------------------------------------

--Q3) Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT *
FROM Customers
WHERE state IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')

------------------------------------------------------------------------------------

--Q4) Find all the invoices for customer 56 and 58 where the total was between
-- $1.00 and $5.00.

SELECT *
FROM Invoices
WHERE CustomerId IN (56,58)
AND Total BETWEEN 1 AND 5

------------------------------------------------------------------------------------

--Q5) Find all the tracks whose name starts with 'All'.

SELECT *
FROM Tracks
WHERE Name LIKE 'All%'

------------------------------------------------------------------------------------

--Q6) Find all the customer emails that start with "J" and are from gmail.com.

SELECT *
FROM Customers
WHERE Email LIKE 'J%gmail.com'

------------------------------------------------------------------------------------

--Q7) Find all the invoices from Brasilia, Edmonton, and Vancouver and sort in
-- descending order by invoice ID.

SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC

------------------------------------------------------------------------------------

--Q8) Show the number of orders placed by each customer and sort the result by
-- the number of orders in descending order.

SELECT CustomerId, COUNT(DISTINCT InvoiceId) AS invoices
FROM Invoices
GROUP BY CustomerId
ORDER BY invoices DESC

------------------------------------------------------------------------------------

--Q9) Find the albums with 12 or more tracks.

SELECT AlbumId
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(TrackId) >= 12
