CREATE DATABASE UniversityAdmission
ON PRIMARY (
    NAME = UniversityAdmission_Data,
    FILENAME = 'E:\SQLData\UniversityAdmission.mdf',
    SIZE = 100MB,
    MAXSIZE = 500MB,
    FILEGROWTH = 10%
)
LOG ON (
    NAME = UniversityAdmission_Log,
    FILENAME = 'D:\SQLData\UniversityAdmission.ldf',
    SIZE = 50MB,
    MAXSIZE = 250MB,
    FILEGROWTH = 5%
);
