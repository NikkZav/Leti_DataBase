SELECT	ProductID, 
		SUM(OrderQty) AS '��������� ���-��'
FROM AdventureWorks.Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY '��������� ���-��'