USE AdventureWorks
-- START TRANSACTION HERE
BEGIN TRANSACTION
SELECT @@trancount AS 'Transaction Count'
SELECT FirstName, MiddleName, LastName FROM Person.Contact WHERE ContactID = 342
UPDATE Person.Contact SET FirstName = 'Lin'
 WHERE ContactID = 342
-- END TRANSACTION HERE
COMMIT TRANSACTION
SELECT FirstName, MiddleName, LastName
 FROM Person.Contact WHERE ContactID = 342
SELECT @@trancount AS 'Transaction Count';
