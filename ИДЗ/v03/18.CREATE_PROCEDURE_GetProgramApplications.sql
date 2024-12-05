USE UniversityAdmission;
GO
CREATE PROCEDURE MySchema.GetProgramApplications
    @EducationProgramID INT
AS
BEGIN
    SELECT
        e.LastName,
        e.FirstName,
        e.MiddleName,
        p.ProgramName,
        ISNULL(SUM(ex.ExamScore), 0) AS TotalScore
    FROM
        MySchema.Application a
    JOIN
        MySchema.Entrant e ON a.EntrantID = e.EntrantID
    JOIN
        MySchema.EducationProgram p ON a.EducationProgramID = p.EducationProgramID
    LEFT JOIN
        MySchema.RequiredExams req ON req.ProgramID = p.EducationProgramID
    LEFT JOIN
        MySchema.Exam ex ON ex.EntrantID = e.EntrantID AND ex.Subject = req.Subject
    WHERE
        p.EducationProgramID = @EducationProgramID
    GROUP BY
        a.ApplicationID, e.EntrantID, e.LastName, e.FirstName, e.MiddleName, p.ProgramName
    ORDER BY
        TotalScore DESC;
END;
