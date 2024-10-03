SELECT	SubQuery.adult_member_no,
		SubQuery.No_Of_Children,
		adu.expr_date
FROM
	(SELECT juv.adult_member_no,
			COUNT(*) AS No_Of_Children
	FROM library.dbo.juvenile AS juv
	JOIN library.dbo.adult AS adu
		ON adu.member_no = juv.adult_member_no
	GROUP BY juv.adult_member_no
	HAVING COUNT(*) > 3) AS SubQuery
JOIN library.dbo.adult AS adu
	ON adu.member_no = SubQuery.adult_member_no;
