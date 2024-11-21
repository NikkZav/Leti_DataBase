CREATE TABLE Entrant (
    EntrantID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
    SNILS CHAR(11) UNIQUE NOT NULL,
    PassportNumber CHAR(9) UNIQUE NOT NULL
);
