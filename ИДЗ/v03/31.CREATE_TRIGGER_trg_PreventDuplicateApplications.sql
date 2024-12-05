USE UniversityAdmission;
GO
CREATE TRIGGER MySchema.trg_PreventDuplicateApplications
ON MySchema.Application
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM MySchema.Application a
        JOIN inserted i ON a.EntrantID = i.EntrantID AND a.EducationProgramID = i.EducationProgramID
    )
    BEGIN
        RAISERROR ('Duplicate application detected', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
