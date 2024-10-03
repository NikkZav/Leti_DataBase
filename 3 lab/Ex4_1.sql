SELECT	adu.member_no,
		COUNT(*) AS numkids
FROM library.dbo.adult AS adu
	JOIN library.dbo.juvenile AS juv
	ON adu.member_no = juv.adult_member_no
WHERE state = 'AZ'
GROUP BY adu.member_no
HAVING COUNT(*) > 2
