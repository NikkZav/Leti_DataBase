SELECT	juv.member_no,
		adu.street,
		adu.city,
		adu.state,
		adu.zip,
		adu.phone_no,
		DATEADD(YY, 1, GETDATE())
FROM library.dbo.juvenile AS juv
	JOIN library.dbo.adult AS adu
	ON juv.adult_member_no = adu.member_no
WHERE juv.birth_date < DATEADD(YY, -18, GETDATE()) 