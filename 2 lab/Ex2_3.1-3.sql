SELECT	ProductID, 
		SpecialOfferID,
		SUM(UnitPrice)/COUNT(UnitPrice) AS AvrgUnitPrice,
		SUM(LineTotal) AS SumLineTotal
FROM AdventureWorks.Sales.SalesOrderDetail
GROUP BY ProductID, SpecialOfferID
ORDER BY ProductID