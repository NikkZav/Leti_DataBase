CREATE PROCEDURE SubmitApplication
    @EntrantID INT,
    @EducationProgramID INT,
    @ApplicationDate DATE
AS
BEGIN
    DECLARE @RequiredSubjects TABLE (Subject NVARCHAR(50), MinScore INT);
    DECLARE @FailedSubjects INT;

    -- Извлекаем требования по программе
    INSERT INTO @RequiredSubjects (Subject, MinScore)
    SELECT Subject, MinScore
    FROM RequiredExams
    WHERE ProgramID = @EducationProgramID;

    -- Проверяем, есть ли у абитуриента все необходимые экзамены с достаточными баллами
    SET @FailedSubjects = (
        SELECT COUNT(*)
        FROM @RequiredSubjects r
        LEFT JOIN Exam e ON e.EntrantID = @EntrantID AND e.Subject = r.Subject
        WHERE e.ExamScore IS NULL OR e.ExamScore < r.MinScore
    );

    -- Если все экзамены сданы и баллы достаточные, подаём заявку
    IF @FailedSubjects = 0
    BEGIN
        INSERT INTO Application (EntrantID, EducationProgramID, ApplicationDate, Status)
        VALUES (@EntrantID, @EducationProgramID, @ApplicationDate, 'Подана');
        PRINT 'Заявка успешно подана.';
    END
    ELSE
    BEGIN
        PRINT 'Заявка отклонена: не все требования по предметам выполнены.';
    END
END;

