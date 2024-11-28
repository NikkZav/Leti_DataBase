ALTER TABLE Application
ADD CONSTRAINT UQ_Application_EntrantProgram UNIQUE (EntrantID, EducationProgramID);
