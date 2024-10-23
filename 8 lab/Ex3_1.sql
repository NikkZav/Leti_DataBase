USE AdventureWorks;
GO
CREATE PROCEDURE Sales.GetDiscountsForCategoryAndDate @Category nvarchar(50),
                                                                @DateToCheck datetime = NULL AS BEGIN IF @DateToCheck IS NULL
SET @DateToCheck = GETDATE();
SELECT Description,
       DiscountPct,
       TYPE,
       Category,
       StartDate,
       EndDate,
       MinQty,
       MaxQty
FROM Sales.SpecialOffer
WHERE Category = @Category
  AND @DateToCheck BETWEEN StartDate AND EndDate
ORDER BY StartDate,
         EndDate;
END;
GO