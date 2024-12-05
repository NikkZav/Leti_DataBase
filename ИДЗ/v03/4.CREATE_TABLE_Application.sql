USE UniversityAdmission;
GO
CREATE TABLE MySchema.Application (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    EntrantID INT NOT NULL,
    EducationProgramID INT NOT NULL,
    ApplicationDate DATE NOT NULL,
    Status NVARCHAR(50) NULL,
	UNIQUE (EntrantID, EducationProgramID),
    FOREIGN KEY (EntrantID) REFERENCES MySchema.Entrant(EntrantID),
    FOREIGN KEY (EducationProgramID) REFERENCES MySchema.EducationProgram(EducationProgramID)
);
