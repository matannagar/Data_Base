SELECT EmployeeID  , MAX(ShippedDate) as 'max date'
FROM orders 
WHERE ShippedDate IN (SELECT ShippedDate FROM orders 
WHERE EmployeeID=8 AND ShippedDate BETWEEN '1998-04-24' AND '1998-05-08') 
AND EmployeeID<>8
GROUP BY EmployeeID
