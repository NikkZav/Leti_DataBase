CREATE VIEW MySchema.View_EntrantApplications AS
SELECT
    s.EntrantID,
    s.ApplicationID,
    s.ProgramName,
    s.Status,
    s.TotalScore,
    s.BudgetPlaces,
    DENSE_RANK() OVER (
        PARTITION BY s.EducationProgramID 
        ORDER BY s.TotalScore DESC
    ) AS Ranking
FROM (
    SELECT
        e.EntrantID,
        a.ApplicationID,
        p.EducationProgramID,
        p.ProgramName,
        a.Status,
        p.BudgetPlaces,
        ISNULL(SUM(ex.ExamScore), 0) AS TotalScore
    FROM
        MySchema.Application a
    JOIN
        MySchema.Entrant e ON a.EntrantID = e.EntrantID
    JOIN
        EducationProgram p ON a.EducationProgramID = p.EducationProgramID
    LEFT JOIN
        MySchema.RequiredExams req ON req.ProgramID = p.EducationProgramID
    LEFT JOIN
        MySchema.Exam ex ON ex.EntrantID = e.EntrantID AND ex.Subject = req.Subject
    GROUP BY
        e.EntrantID, a.ApplicationID, p.EducationProgramID, p.ProgramName, a.Status, p.BudgetPlaces
) s;
