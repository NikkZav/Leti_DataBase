-- Добавляем экзамены для новых абитуриентов
DECLARE @i INT = 9;

WHILE @i <= 108
BEGIN
    DECLARE @EntrantID INT = @i;
    DECLARE @MathScore INT = FLOOR(RAND() * 51) + 50; -- Баллы от 50 до 100
    DECLARE @RusScore INT = FLOOR(RAND() * 51) + 50;
    DECLARE @PhysScore INT = FLOOR(RAND() * 51) + 50;
    DECLARE @InfScore INT = FLOOR(RAND() * 51) + 50;

    INSERT INTO Exam (EntrantID, Subject, ExamScore, ExamDate)
    VALUES
    (@EntrantID, 'Математика', @MathScore, '2024-06-15'),
    (@EntrantID, 'Русский язык', @RusScore, '2024-06-16'),
    (@EntrantID, 'Физика', @PhysScore, '2024-06-17'),
    (@EntrantID, 'Информатика', @InfScore, '2024-06-18');

    SET @i = @i + 1;
END
