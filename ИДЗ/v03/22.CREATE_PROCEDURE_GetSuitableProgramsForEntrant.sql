USE UniversityAdmission;
GO

CREATE PROCEDURE MySchema.GetSuitableProgramsForEntrant
    @EntrantID INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH SuitablePrograms AS (
        SELECT
            p.EducationProgramID,
            p.ProgramName,
            p.BudgetPlaces,
            SUM(req.MinScore) AS TotalMinScore
        FROM
            MySchema.EducationProgram p
        JOIN
            MySchema.RequiredExams req ON req.ProgramID = p.EducationProgramID
        LEFT JOIN
            MySchema.Exam e ON e.EntrantID = @EntrantID AND e.Subject = req.Subject
        GROUP BY
            p.EducationProgramID, p.ProgramName, p.Faculty, p.EducationLevel, p.BudgetPlaces
        HAVING
            COUNT(CASE WHEN e.ExamScore >= req.MinScore THEN 1 END) = COUNT(req.Subject)
    )
    SELECT
        sp.EducationProgramID,
        sp.ProgramName,
        sp.BudgetPlaces,
        sp.TotalMinScore,
        DENSE_RANK() OVER (ORDER BY sp.TotalMinScore DESC) AS Ranking
    FROM
        SuitablePrograms sp
    ORDER BY
        sp.TotalMinScore DESC;
END;
GO
