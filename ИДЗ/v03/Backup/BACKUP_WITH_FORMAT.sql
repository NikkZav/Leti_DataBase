BACKUP DATABASE UniversityAdmission
TO DISK = 'C:\Backup\UniversityAdmission_Full.bak'
WITH FORMAT,
     INIT,
     NAME = 'Full Backup of UniversityAdmission',
     STATS = 10;
