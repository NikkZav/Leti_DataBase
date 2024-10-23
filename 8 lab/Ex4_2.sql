DECLARE @StartDate datetime, @EndDate datetime
SET @StartDate = GETDATE()
SET @EndDate = DATEADD(MONTH, 1, @StartDate)
DECLARE @NewID int
EXEC Sales.AddDiscount 'Half price off everything', 0.5, 'Seasonal Discount', 'Customer', @StartDate, @EndDate, 0, 20, @NewID OUTPUT
SELECT @NewID;