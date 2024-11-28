CREATE PROCEDURE GetStudentApplicationsDetails
    @EntrantID INT
AS
BEGIN
    SELECT
        p.ProgramName AS Программа,
        a.Status AS Статус,
        r.Ranking AS [Место в рейтинге],
        p.BudgetPlaces AS [Кол-во бюджетных мест]
    FROM
        Application a
    JOIN
        EducationProgram p ON a.EducationProgramID = p.EducationProgramID
    JOIN (
        SELECT
            a.ApplicationID,
            RANK() OVER (PARTITION BY a.EducationProgramID ORDER BY ISNULL(SUM(ex.ExamScore), 0) DESC) AS Ranking
        FROM
            Application a
        JOIN
            RequiredExams req ON req.ProgramID = a.EducationProgramID
        JOIN
            Exam ex ON ex.EntrantID = a.EntrantID AND ex.Subject = req.Subject
        WHERE
            a.EntrantID = @EntrantID
        GROUP BY
            a.ApplicationID
    ) r ON a.ApplicationID = r.ApplicationID
    WHERE
        a.EntrantID = @EntrantID
    ORDER BY
        p.ProgramName;
END;
