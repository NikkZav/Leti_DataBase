SELECT	ProductID, 
		SUM(LineTotal) AS Total
FROM AdventureWorks.Sales.SalesOrderDetail
WHERE UnitPrice < 5
GROUP BY CUBE(ProductID, OrderQty)
ORDER BY ProductID