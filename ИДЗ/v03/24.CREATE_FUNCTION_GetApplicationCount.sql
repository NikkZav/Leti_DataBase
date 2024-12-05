CREATE FUNCTION MySchema.GetApplicationCount(@EntrantID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*)
    FROM MySchema.Application
    WHERE EntrantID = @EntrantID;
    RETURN @Count;
END;
