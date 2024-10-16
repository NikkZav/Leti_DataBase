USE AdventureWorks
CREATE TABLE
  HumanResources.JobCandidateHistory (
    JobCandidateID INT NOT NULL PRIMARY KEY,
    Resume XML,
    Rating INT NOT NULL CHECK(
      Rating >= 1
      and Rating <= 10
    ) DEFAULT 5,
    RejectedDate DATETIME NOT NULL,
    ContactID INT REFERENCES Person.Contact(ContactID)
  );