DECLARE @i INT = 9;

WHILE @i <= 108
BEGIN
    INSERT INTO MySchema.Entrant (LastName, FirstName, MiddleName, DateOfBirth, Gender, SNILS, PassportNumber)
    VALUES (
        CONCAT('Фамилия', @i),
        CONCAT('Имя', @i),
        CONCAT('Отчество', @i),
        DATEADD(YEAR, -18, GETDATE()), -- Условно всем по 18 лет
        CASE WHEN @i % 2 = 0 THEN 'M' ELSE 'F' END,
        RIGHT(CONCAT('00000000000', @i), 11), -- Уникальный СНИЛС
        RIGHT(CONCAT('000000000', @i), 9) -- Уникальный номер паспорта
    );

    SET @i = @i + 1;
END