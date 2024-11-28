USE UniversityAdmission;
GO

DECLARE @i INT = 9;
DECLARE @EntrantID INT;
DECLARE @ProgramID INT;
DECLARE @ApplicationDate DATE;

-- Табличная переменная для хранения ProgramID с их порядковым номером
DECLARE @ProgramIDs TABLE (RowNum INT IDENTITY(0,1), ProgramID INT);
DECLARE @Index INT;
DECLARE @TotalPrograms INT;

-- Заполняем табличную переменную всеми ProgramID из EducationProgram
INSERT INTO @ProgramIDs (ProgramID)
SELECT EducationProgramID FROM EducationProgram ORDER BY EducationProgramID;

-- Получаем общее количество программ
SELECT @TotalPrograms = COUNT(*) FROM @ProgramIDs;

WHILE @i <= 108
BEGIN
    SET @EntrantID = @i;
    SET @Index = (@i - 9) % @TotalPrograms; -- Индекс для выбора ProgramID из табличной переменной
    SELECT @ProgramID = ProgramID FROM @ProgramIDs WHERE RowNum = @Index;
    SET @ApplicationDate = DATEADD(DAY, (@i - 9), '20240620'); -- Используем формат 'YYYYMMDD'

    -- Проверяем, соответствует ли абитуриент требованиям программы
    IF dbo.CheckExamRequirements(@EntrantID, @ProgramID) = 1
    BEGIN
        -- Проверяем, не подана ли уже заявка на эту программу
        IF NOT EXISTS (
            SELECT 1 FROM Application
            WHERE EntrantID = @EntrantID AND EducationProgramID = @ProgramID
        )
        BEGIN
            INSERT INTO Application (EntrantID, EducationProgramID, ApplicationDate, Status)
            VALUES (@EntrantID, @ProgramID, @ApplicationDate, 'Подана');
        END
    END

    SET @i = @i + 1;
END
