CREATE PROCEDURE MySchema.EnrollStudents
    @EducationProgramID INT
AS
BEGIN 
    DECLARE @BudgetPlaces INT;

    -- Получаем количество бюджетных мест
    SELECT @BudgetPlaces = BudgetPlaces
    FROM MySchema.EducationProgram
    WHERE EducationProgramID = @EducationProgramID;

    -- Обновляем статусы заявок
    WITH RankedApplicants AS (
        SELECT
            a.ApplicationID,
            e.EntrantID,
            ISNULL(SUM(ex.ExamScore), 0) AS TotalScore,
            ROW_NUMBER() OVER (ORDER BY ISNULL(SUM(ex.ExamScore), 0) DESC) AS Ranking
        FROM
            MySchema.Application a
        JOIN
            MySchema.Entrant e ON a.EntrantID = e.EntrantID
        LEFT JOIN
            MySchema.RequiredExams req ON req.ProgramID = a.EducationProgramID
        LEFT JOIN
            MySchema.Exam ex ON ex.EntrantID = e.EntrantID AND ex.Subject = req.Subject
        WHERE
            a.EducationProgramID = @EducationProgramID
        GROUP BY
            a.ApplicationID, e.EntrantID
    )
    UPDATE a
    SET Status = CASE
        WHEN r.Ranking <= @BudgetPlaces THEN 'Зачислен'
        ELSE 'Отказано'
    END
    FROM MySchema.Application a
    JOIN RankedApplicants r ON a.ApplicationID = r.ApplicationID
    WHERE a.EducationProgramID = @EducationProgramID;
END;
