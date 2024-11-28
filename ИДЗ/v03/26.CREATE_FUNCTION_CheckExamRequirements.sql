CREATE FUNCTION CheckExamRequirements(
    @EntrantID INT,
    @EducationProgramID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @FailedSubjects INT;
    DECLARE @Result BIT;

    SET @FailedSubjects = (
        SELECT COUNT(*)
        FROM RequiredExams req
        LEFT JOIN Exam ex ON ex.EntrantID = @EntrantID AND ex.Subject = req.Subject
        WHERE req.ProgramID = @EducationProgramID AND (ex.ExamScore IS NULL OR ex.ExamScore < req.MinScore)
    );

    IF @FailedSubjects = 0
        SET @Result = 1;
    ELSE
        SET @Result = 0;

    RETURN @Result;
END;
