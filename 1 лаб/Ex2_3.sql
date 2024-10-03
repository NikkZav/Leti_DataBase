SELECT	LOWER(
			firstname + ' ' + 
			middleinitial + ' ' + 
			SUBSTRING(lastname, 1, 2) 
		)
		AS email_name
FROM library.dbo.member
WHERE lastname = 'Anderson'