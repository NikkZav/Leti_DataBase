USE AdventureWorks;

GO
CREATE PROCEDURE Sales.GetDiscounts AS
SELECT
  Description,
  DiscountPct,
  Type,
  Category,
  StartDate,
  EndDate,
  MinQty,
  MaxQty
FROM
  Sales.SpecialOffer
ORDER BY
  StartDate,
  EndDate;

GO