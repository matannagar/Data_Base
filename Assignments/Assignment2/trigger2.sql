DELIMITER $$
CREATE TRIGGER remove_order
BEFORE DELETE on orders
FOR EACH ROW
BEGIN

DROP TEMPORARY TABLE IF EXISTS units;
CREATE TEMPORARY TABLE units as
SELECT t.productId as pid, SUM(t.unitsinstock + t.quantity) as sum
FROM (
select O.orderID,O.ProductID, P.unitsinstock, Quantity
from `order details` as O join Products as P on O.ProductID=P.ProductID) as t
where t.orderID = old.orderID
GROUP BY t.orderID,t.ProductID;

UPDATE products JOIN units on units.pid=products.productID 
SET products.unitsInStock = units.sum;

DELETE FROM `order details` WHERE old.orderID= `order details`.orderID;
END $$
DELIMITER ;