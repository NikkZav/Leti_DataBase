USE AdventureWorks;
GO
CREATE PROCEDURE Sales.AddDiscount @Description nvarchar(255), 
@DiscountPct smallmoney, 
@Type nvarchar(50), 
@Category nvarchar(50), 
@StartDate Datetime, 
@EndDate Datetime, 
@MinQty int, 
@MaxQty int, 
@NewProductID int OUTPUT AS BEGIN BEGIN TRY INSERT INTO Sales.SpecialOffer (
  Description, DiscountPct, Type, Category, 
  StartDate, EndDate, MinQty, MaxQty
) 
VALUES 
  (
    @Description, @DiscountPct, @Type, 
    @Category, @StartDate, @EndDate, 
    @MinQty, @MaxQty
  );
SET 
  @NewProductID = SCOPE_IDENTITY();
RETURN 0;
END TRY BEGIN CATCH INSERT INTO dbo.ErrorLog (
  ErrorTime, UserName, ErrorNumber, 
  ErrorSeverity, ErrorState, ErrorProcedure, 
  ErrorLine, ErrorMessage
) 
VALUES 
  (
    GETDATE(), 
    USER_NAME(), 
    ERROR_NUMBER(), 
    ERROR_SEVERITY(), 
    ERROR_STATE(), 
    ERROR_PROCEDURE(), 
    ERROR_LINE(), 
    ERROR_MESSAGE()
  );
RETURN -1;
END CATCH;
END;
GO
