CREATE VIEW View_Applications AS
SELECT 
    a.ApplicationID,
    e.LastName,
    e.FirstName,
    e.MiddleName,
    p.ProgramName,
    a.ApplicationDate,
    a.Status
FROM 
    Application a
JOIN 
    Entrant e ON a.EntrantID = e.EntrantID
JOIN 
    EducationProgram p ON a.EducationProgramID = p.EducationProgramID;
