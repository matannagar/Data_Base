SELECT OrderID, RequiredDate
FROM orders
WHERE ShippedDate is NULL and RequiredDate<NOW()
