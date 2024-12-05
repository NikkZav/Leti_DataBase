CREATE PROCEDURE MySchema.UpdateApplicationStatus
    @ApplicationID INT,
    @NewStatus NVARCHAR(50)
AS
BEGIN
    UPDATE MySchema.Application
    SET Status = @NewStatus
    WHERE ApplicationID = @ApplicationID;
END;
