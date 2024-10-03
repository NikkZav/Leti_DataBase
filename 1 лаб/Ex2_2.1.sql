SELECT	member_no, 
		isbn, 
		fine_assessed
FROM library.dbo.loanhist
WHERE fine_assessed IS NOT NULL