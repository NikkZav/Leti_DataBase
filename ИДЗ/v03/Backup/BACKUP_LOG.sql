BACKUP LOG UniversityAdmission
TO DISK = 'C:\Backup\UniversityAdmission_Log.bak'
WITH INIT,
     NAME = 'Transaction Log Backup of UniversityAdmission',
     STATS = 10;
