CREATE TEMPORARY TABLE units as
SELECT t.productId as pid, SUM(t.unitsinstock + t.quantity) as sum
FROM (
select O.orderID,O.ProductID, P.unitsinstock, Quantity
from `order details` as O join Products as P on O.ProductID=P.ProductID) as t
where t.orderID = 10248
GROUP BY t.orderID,t.ProductID;

DROP temporary table units

UPDATE products
Select UnitsInStock
From products join units on units.pid=products.productID ;
and units.pid=products.productID ;

update products
set products.unitsInStock = (select
units.pid
from  units)
where  unitsInStock = pid

UPDATE products JOIN units on units.pid=products.productID 
SET products.unitsInStock = units.sum

select * from products
 join 'order details' on products.productID = 'order details'.productID
where orderId=10248

select O.orderID,O.ProductID, P.unitsinstock, Quantity
from `order details` as O join Products as P on O.ProductID=P.ProductID 
where orderId=10248

update 


SELECT sum from units
