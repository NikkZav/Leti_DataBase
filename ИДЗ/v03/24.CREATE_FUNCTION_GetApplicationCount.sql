CREATE FUNCTION GetApplicationCount(@EntrantID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*)
    FROM Application
    WHERE EntrantID = @EntrantID;
    RETURN @Count;
END;
