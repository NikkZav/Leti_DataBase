SELECT	firstname + ' ' + middleinitial + ' ' + lastname AS name,
		street,
		city,
		state,
		zip
FROM library.dbo.adult adu
	JOIN library.dbo.member mem
	ON adu.member_no = mem.member_no