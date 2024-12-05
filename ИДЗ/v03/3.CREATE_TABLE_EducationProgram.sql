USE UniversityAdmission;
GO
CREATE TABLE MySchema.EducationProgram (
    EducationProgramID INT IDENTITY(1,1) PRIMARY KEY,
    ProgramName NVARCHAR(100) NOT NULL,
    Faculty NVARCHAR(100) NOT NULL,
    EducationLevel NVARCHAR(50) NULL,
    BudgetPlaces INT NOT NULL DEFAULT 0
);
