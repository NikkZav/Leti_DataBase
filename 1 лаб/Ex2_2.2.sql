SELECT	member_no, 
		isbn, 
		fine_assessed,
		fine_assessed * 2 AS 'double fine'
FROM library.dbo.loanhist
WHERE fine_assessed IS NOT NULL