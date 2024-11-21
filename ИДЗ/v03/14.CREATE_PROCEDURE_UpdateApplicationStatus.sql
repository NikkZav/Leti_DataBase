CREATE PROCEDURE UpdateApplicationStatus
    @ApplicationID INT,
    @NewStatus NVARCHAR(50)
AS
BEGIN
    UPDATE Application
    SET Status = @NewStatus
    WHERE ApplicationID = @ApplicationID;
END;
