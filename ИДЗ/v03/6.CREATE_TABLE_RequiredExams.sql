CREATE TABLE RequiredExams (
    RequiredExamID INT IDENTITY(1,1) PRIMARY KEY,
    ProgramID INT NOT NULL,
    Subject NVARCHAR(50) NOT NULL,
    MinScore INT CHECK (MinScore BETWEEN 0 AND 100),
    UNIQUE (ProgramID, Subject),
    FOREIGN KEY (ProgramID) REFERENCES EducationProgram(EducationProgramID)
);
