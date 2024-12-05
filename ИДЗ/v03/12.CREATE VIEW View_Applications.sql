CREATE VIEW MySchema.View_Applications AS
SELECT 
    a.ApplicationID,
    e.LastName,
    e.FirstName,
    e.MiddleName,
    p.ProgramName,
    a.ApplicationDate,
    a.Status
FROM 
    MySchema.Application a
JOIN 
    MySchema.Entrant e ON a.EntrantID = e.EntrantID
JOIN 
    MySchema.EducationProgram p ON a.EducationProgramID = p.EducationProgramID;
