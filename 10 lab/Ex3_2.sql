USE AdventureWorks
BEGIN TRANSACTION
UPDATE Person.Contact
SET FirstName = 'Fran'
WHERE ContactID = 6
SELECT @@spid AS 'spid'
