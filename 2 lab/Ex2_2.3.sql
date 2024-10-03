SELECT	ProductID, 
		SUM(OrderQty) AS '��������� ���-��'
FROM AdventureWorks.Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) >= 2000
ORDER BY '��������� ���-��'