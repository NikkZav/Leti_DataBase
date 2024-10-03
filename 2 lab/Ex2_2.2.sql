SELECT	ProductID, 
		SUM(OrderQty) AS 'Суммарное кол-во'
FROM AdventureWorks.Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY 'Суммарное кол-во'