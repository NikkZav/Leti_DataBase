SELECT	SalesQuota,
		SUM(SalesYTD) AS TotalSalesYTD,
		GROUPING(SalesQuota) AS GROUPING_SalesQuota
FROM AdventureWorks.Sales.SalesPerson
GROUP BY ROLLUP(SalesQuota)