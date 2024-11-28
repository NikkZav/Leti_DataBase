USE UniversityAdmission;
GO
CREATE PROCEDURE GetProgramApplications
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
        Application a
    JOIN
        Entrant e ON a.EntrantID = e.EntrantID
    JOIN
        EducationProgram p ON a.EducationProgramID = p.EducationProgramID
    LEFT JOIN
        RequiredExams req ON req.ProgramID = p.EducationProgramID
    LEFT JOIN
        Exam ex ON ex.EntrantID = e.EntrantID AND ex.Subject = req.Subject
    WHERE
        p.EducationProgramID = @EducationProgramID
    GROUP BY
        a.ApplicationID, e.EntrantID, e.LastName, e.FirstName, e.MiddleName, p.ProgramName
    ORDER BY
        TotalScore DESC;
END;
