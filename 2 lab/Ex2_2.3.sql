SELECT	ProductID, 
		SUM(OrderQty) AS 'Суммарное кол-во'
FROM AdventureWorks.Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) >= 2000
ORDER BY 'Суммарное кол-во'