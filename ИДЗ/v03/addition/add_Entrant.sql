DECLARE @i INT = 9;

WHILE @i <= 108
BEGIN
    INSERT INTO MySchema.Entrant (LastName, FirstName, MiddleName, DateOfBirth, Gender, SNILS, PassportNumber)
    VALUES (
        CONCAT('�������', @i),
        CONCAT('���', @i),
        CONCAT('��������', @i),
        DATEADD(YEAR, -18, GETDATE()), -- ������� ���� �� 18 ���
        CASE WHEN @i % 2 = 0 THEN 'M' ELSE 'F' END,
        RIGHT(CONCAT('00000000000', @i), 11), -- ���������� �����
        RIGHT(CONCAT('000000000', @i), 9) -- ���������� ����� ��������
    );

    SET @i = @i + 1;
END