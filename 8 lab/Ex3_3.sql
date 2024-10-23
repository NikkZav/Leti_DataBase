DECLARE @DateToCheck datetime 
SET 
  @DateToCheck = DATEADD(
    YEAR, 
    -21, 
    GETDATE()
  ) EXEC Sales.GetDiscountsForCategoryAndDate 'Reseller', 
  @DateToCheck;
