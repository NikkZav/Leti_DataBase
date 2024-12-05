USE UniversityAdmission;
GO
CREATE TABLE MySchema.Exam (
    ExamID INT IDENTITY(1,1) PRIMARY KEY,
    EntrantID INT NOT NULL,
    Subject NVARCHAR(50) NOT NULL,
    ExamScore INT CHECK (ExamScore BETWEEN 0 AND 100),
    ExamDate DATE NOT NULL,
    FOREIGN KEY (EntrantID) REFERENCES MySchema.Entrant(EntrantID)
);
