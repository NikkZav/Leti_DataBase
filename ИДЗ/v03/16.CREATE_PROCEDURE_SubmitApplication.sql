USE UniversityAdmission;
GO
CREATE PROCEDURE MySchema.SubmitApplication
    @EntrantID INT,
    @EducationProgramID INT,
    @ApplicationDate DATE
AS
BEGIN
    -- Проверяем, есть ли уже поданная заявка
    IF EXISTS (
        SELECT 1 FROM MySchema.Application
        WHERE EntrantID = @EntrantID AND EducationProgramID = @EducationProgramID
    )
    BEGIN
        PRINT 'Заявка уже подана ранее.';
        RETURN;
    END

    -- Проверяем соответствие экзаменационным требованиям
    IF MySchema.CheckExamRequirements(@EntrantID, @EducationProgramID) = 1
    BEGIN
        INSERT INTO MySchema.Application (EntrantID, EducationProgramID, ApplicationDate, Status)
        VALUES (@EntrantID, @EducationProgramID, @ApplicationDate, 'Подана');
        PRINT 'Заявка успешно подана.';
    END
    ELSE
    BEGIN
        PRINT 'Заявка отклонена: не все требования по предметам выполнены.';
    END
END;
