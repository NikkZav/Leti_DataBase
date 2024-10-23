DECLARE @StartDate datetime, @EndDate datetime
SET @StartDate = GETDATE()
SET @EndDate = DATEADD(MONTH, 1, @StartDate)
DECLARE @NewID int, @ReturnValue int
EXEC @ReturnValue = Sales.AddDiscount 'Half price off everything', -0.5, 'Seasonal Discount', 'Customer', @StartDate, @EndDate, 0, 20, @NewID OUTPUT
IF(@ReturnValue = 0) SELECT @NewID;
ELSE
SELECT TOP 1 * FROM dbo.ErrorLog ORDER BY ErrorTime DESC;