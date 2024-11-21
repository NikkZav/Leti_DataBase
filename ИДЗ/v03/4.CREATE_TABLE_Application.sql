CREATE TABLE Application (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    EntrantID INT NOT NULL,
    EducationProgramID INT NOT NULL,
    ApplicationDate DATE NOT NULL,
    Status NVARCHAR(50) NULL,
    FOREIGN KEY (EntrantID) REFERENCES Entrant(EntrantID),
    FOREIGN KEY (EducationProgramID) REFERENCES EducationProgram(EducationProgramID)
);
