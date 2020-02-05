-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select ProductName, CategoryName 
from Product
join Category
on CategoryId = Category.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select [order].iD, CompanyName
from [Order]
join Shipper
on [Order].ShipVia = [Shipper].id
where [order].orderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName, OD.Quantity
FROM OrderDetail as OD
join Product as P
on OD.ProductId = P.id
where OD.OrderId = 10251
order by ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT OD.OrderId, C.CompanyName, E.LastName
FROM [Order] as O
JOIN Customer as C
on O.CustomerId = C.Id
JOIN Employee as E
on E.id = O.EmployeeId
where CompanyName is NOT NULL
