SELECT *
FROM library.dbo.juvenile AS juv
	JOIN library.dbo.adult AS adu
	ON juv.member_no = adu.member_no