--Q1) Using a subquery, find the names of all the tracks for the
-- album "Californication".

SELECT TrackId, Name
FROM Tracks
WHERE AlbumId IN
    (SELECT AlbumId FROM Albums WHERE Title = "Californication")

------------------------------------------------------------------------------------
-- Q2) Find the total number of invoices for each customer along
-- with the customer's full name, city and email.

SELECT I.CustomerId, FirstName, LastName, City, Email, COUNT(InvoiceId) AS Invoices
FROM Invoices I INNER JOIN Customers C ON I.CustomerId = C.CustomerId
GROUP BY I.CustomerId

------------------------------------------------------------------------------------
-- Q3) Retrieve the track name, album, artist, and trackID for
-- all the albums.

Select Name, TrackId, Title, Artistid
FROM Tracks INNER JOIN Albums ON Tracks.AlbumId = Albums.AlbumId

------------------------------------------------------------------------------------
-- Q4) Retrieve a list with the managers last name, and the last
-- name of the employees who report to him or her.

SELECT E.LastName AS Employee, M.LastName as Manager
FROM Employees E INNER JOIN Employees M ON E.ReportsTo = M.EmployeeId

------------------------------------------------------------------------------------
-- Q5) Find the name and ID of the artists who do not have albums.

SELECT Name AS Artist, Ar.ArtistId
FROM Artists Ar LEFT JOIN Albums Al ON Ar.ArtistId = Al.ArtistId
WHERE AlbumId ISNULL

------------------------------------------------------------------------------------
-- Q6) Use a UNION to create a list of all the employee's &
-- customer's first names and last names ordered by the last
-- name in descending order.

SELECT FirstName, LastName FROM Employees
UNION
SELECT FirstName, LastName FROM Customers
ORDER BY LastName DESC

------------------------------------------------------------------------------------
-- Q7) See if there are any customers who have a different city
-- listed in their billing city versus their customer city.

SELECT C.CustomerId
FROM Customers C INNER JOIN Invoices I ON C.CustomerId = I.CustomerId
WHERE C.City != I.BillingCity
