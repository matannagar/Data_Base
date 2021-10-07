SELECT t.ProductName, t.CompanyName, t.OrderYear, sum(t.Qtr1) as Qtr1,sum(t.Qtr2) as Qtr2,sum(t.Qtr3) as Qtr3, sum(t.Qtr4) as Qtr4
FROM(
SELECT products.ProductName, customers.CompanyName, year(orders.OrderDate) as OrderYear,
CASE
    WHEN quarter(orders.OrderDate)=1 THEN ROUND(sum(`order details`.Unitprice * `order details`.Quantity),0)
    ELSE 0
END as Qtr1,
CASE
    WHEN quarter(orders.OrderDate)=2 THEN ROUND(sum(`order details`.Unitprice * `order details`.Quantity),0)
    ELSE 0
END as Qtr2,
CASE
    WHEN quarter(orders.OrderDate)=3 THEN ROUND(sum(`order details`.Unitprice * `order details`.Quantity),0)
    ELSE 0
END as Qtr3,
CASE
    WHEN quarter(orders.OrderDate)=4 THEN ROUND(sum(`order details`.Unitprice * `order details`.Quantity),0)
    ELSE 0
END as Qtr4
FROM customers JOIN orders on customers.CustomerID=orders.CustomerID
JOIN `order details` on orders.orderId=`order details`.orderId
JOIN products on `order details`.ProductID=products.ProductID
GROUP BY customers.CompanyName, products.ProductName,year(orders.OrderDate), quarter(orders.OrderDate)
) as t

GROUP BY t.CompanyName, t.ProductName,t.OrderYear
ORDER BY t.ProductName, t.CompanyName
