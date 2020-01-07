SELECT LastName, FirstName, HireDate 
FROM nwEmployees
 WHERE Country != 'USA' and HireDate > YEAR(CURRENT_TIMESTAMP) - 5;



SELECT ProductID, ProductName, UnitsInStock, UnitPrice, ReorderLevel 
FROM nwProducts 
WHERE UnitsInStock > 1 and UnitsInStock <= ReorderLevel;


SELECT ProductName, UnitPrice
From nwProducts 
WHERE UnitPrice = 
(select max(UnitPrice) from nwProducts);


SELECT ProductID, ProductName, (UnitPrice * UnitsInStock) as TotalInventoryValue
 FROM nwProducts 
WHERE (UnitPrice * UnitsInStock) > 2000;


SELECT ShipCountry, COUNT(OrderID) AS NumberOfOrders
 FROM nwOrders
 WHERE ShipCountry != 'USA' AND MONTH(OrderDate) = 9 AND YEAR(OrderDate) = 2013
 GROUP BY ShipCountry;


SELECT CustomerID, ShipCountry 
FROM nwOrders 
GROUP BY CustomerID, ShipCountry 
HAVING COUNT(CustomerID) > 20;


SELECT SupplierID, sum(unitsInStock*unitPrice) AS "inventory value" FROM nwproducts 
GROUP BY SupplierID HAVING COUNT(SupplierID) > 3;


SELECT nwSuppliers.CompanyName, nwProducts.ProductName, nwProducts.UnitPrice FROM nwSuppliers
INNER JOIN nwProducts on nwProducts.SupplierID = nwSuppliers.SupplierID 
WHERE nwSuppliers.Country = 'USA';


SELECT nwEmployees.FirstName, nwEmployees.LastName, nwEmployees.Title, COUNT(DISTINCT nwOrders.OrderID) AS OrderCount FROM nwEmployees
 INNER JOIN nwOrders on nwOrders.EmployeeID = nwEmployees.EmployeeID
GROUP BY nwEmployees.FirstName, nwEmployees.LastName, nwEmployees.Title
HAVING COUNT(nwOrders.OrderID) > 100
 ORDER BY nwEmployees.Firstname, nwEmployees.Lastname;

SELECT nwCustomers.CustomerID, nwCustomers.CompanyName FROM nwCustomers
 LEFT JOIN nwOrders on nwOrders.CustomerID = nwCustomers.CustomerID 
WHERE nwOrders.CustomerID IS NULL;


SELECT nwSuppliers.CompanyName, nwSuppliers.ContactName, nwCategories.CategoryName, nwCategories.Description, nwProducts.ProductName, nwProducts.UnitsOnOrder 
FROM nwProducts
	join nwSuppliers on nwSuppliers.SupplierID = nwProducts.SupplierID
 join nwCategories on nwCategories.CategoryID = nwProducts.CategoryID 
WHERE UnitsInStock = 0;


SELECT * FROM nwProducts
 join nwSuppliers on nwSuppliers.SupplierID = nwProducts.SupplierID
WHERE nwProducts.QuantityPerUnit LIKE '%bottle%' or nwProducts.QuantityPerUnit LIKE '%bottles%';


CREATE TABLE nwtopitems(
ItemID INTEGER PRIMARY KEY, ItemCode INTEGER, ItemName VARCHAR(40), InventoryDate DATE, SupplierID INTEGER, ItemQuantity INTEGER, ItemPrice DECIMAL(9,2));



INSERT INTO nwtopitems(ItemID, ItemName, InventoryDate, ItemQuantity, ItemPrice, SupplierID)
SELECT ProductID, ProductName, curdate(), UnitsInStock, UnitPrice, SupplierID 
FROM nwProducts
WHERE UnitPrice < 8;

SELECT * FROM nwtopitems;
 

DELETE FROM nwtopitems WHERE ItemID = 54 or ItemID = 75;

 
ALTER TABLE nwTopItems
 ADD InventoryValue decimal(9,2) AFTER InventoryDate; 

DESCRIBE nwTopItems; 


UPDATE nwTopItems 
SET InventoryValue = (ItemPrice*ItemQuantity); 

DESCRIBE nwTopItems; 


DROP TABLE IF EXISTS nwTopItems;