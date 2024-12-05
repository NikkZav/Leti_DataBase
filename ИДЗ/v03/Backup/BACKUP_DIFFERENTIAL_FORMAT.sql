BACKUP DATABASE UniversityAdmission
TO DISK = 'C:\Backup\UniversityAdmission_Diff.bak'
WITH DIFFERENTIAL,
     NAME = 'Differential Backup of UniversityAdmission',
     STATS = 10;
