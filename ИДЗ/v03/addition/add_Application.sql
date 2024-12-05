USE UniversityAdmission;
GO

DECLARE @i INT = 9;
DECLARE @EntrantID INT;
DECLARE @ProgramID INT;
DECLARE @ApplicationDate DATE;

-- ��������� ���������� ��� �������� ProgramID � �� ���������� �������
DECLARE @ProgramIDs TABLE (RowNum INT IDENTITY(0,1), ProgramID INT);
DECLARE @Index INT;
DECLARE @TotalPrograms INT;

-- ��������� ��������� ���������� ����� ProgramID �� MySchema.EducationProgram
INSERT INTO @ProgramIDs (ProgramID)
SELECT EducationProgramID FROM MySchema.EducationProgram ORDER BY EducationProgramID;

-- �������� ����� ���������� ��������
SELECT @TotalPrograms = COUNT(*) FROM @ProgramIDs;

WHILE @i <= 108
BEGIN
    SET @EntrantID = @i;
    SET @Index = (@i - 9) % @TotalPrograms; -- ������ ��� ������ ProgramID �� ��������� ����������
    SELECT @ProgramID = ProgramID FROM @ProgramIDs WHERE RowNum = @Index;
    SET @ApplicationDate = DATEADD(DAY, (@i - 9), '20240620'); -- ���������� ������ 'YYYYMMDD'

    -- ���������, ������������� �� ���������� ����������� ���������
    IF MySchema.CheckExamRequirements(@EntrantID, @ProgramID) = 1
    BEGIN
        -- ���������, �� ������ �� ��� ������ �� ��� ���������
        IF NOT EXISTS (
            SELECT 1 FROM MySchema.Application
            WHERE EntrantID = @EntrantID AND EducationProgramID = @ProgramID
        )
        BEGIN
            INSERT INTO MySchema.Application (EntrantID, EducationProgramID, ApplicationDate, Status)
            VALUES (@EntrantID, @ProgramID, @ApplicationDate, '������');
        END
    END

    SET @i = @i + 1;
END
