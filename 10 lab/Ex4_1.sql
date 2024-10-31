USE AdventureWorks
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET lock_timeout 5000
BEGIN TRANSACTION
  SELECT * FROM Person.Contact WHERE ContactID = 10
  UPDATE Person.Contact SET FirstName = 'Frances' WHERE ContactID = 6
SELECT @@spid AS 'SPID';
