DELIMITER $$
CREATE procedure myPrecuder (IN CID varchar(5))
BEGIN 
select cus.orderID, 
CASE WHEN sum(ap.avargeProudct*od.Quantity)-sum(od.unitPrice*od.Quantity)<0 then 'Loss'
else 'Profit' end as 'Profit/Loss',
abs(sum(ap.avargeProudct*od.Quantity)-sum(od.unitPrice*od.Quantity)) Amount
FROM
(SELECT orderID 
FROM orders
WHERE customerID like CID) cus 
JOIN
`order details` od on cus.OrderID=od.OrderID
JOIN
-- avarge of product
(SELECT ProductID, orderID, Avg(unitprice) avargeProudct
FROM `order details`
GROUP BY ProductID) ap
on od.ProductID=ap.ProductID
GROUP BY cus.orderID
ORDER BY orderID desc;
END $$
DELIMITER ;
