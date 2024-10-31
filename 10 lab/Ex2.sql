USE AdventureWorks
BEGIN TRANSACTION
  SELECT @@trancount AS 'Transaction Count'
  SELECT FirstName, MiddleName, LastName 
FROM Person.Contact WHERE ContactID = 7454
  UPDATE Person.Contact SET FirstName = 'Dom'
 WHERE ContactID = 7454
  SELECT FirstName, MiddleName, LastName 
FROM Person.Contact WHERE ContactID = 7454
  SELECT @@trancount AS 'Transaction Count'
-- END TRANSACTION HERE
ROLLBACK TRANSACTION
  SELECT FirstName, MiddleName, LastName 
FROM Person.Contact WHERE ContactID = 7454
  SELECT @@trancount AS 'Transaction Count';
