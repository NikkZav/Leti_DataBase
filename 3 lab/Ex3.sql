SELECT	mem.firstname +' '+ mem.middleinitial +' '+ mem.lastname name,
		mem.member_no, 
		res.isbn, 
		CONVERT(char(8), res.log_date) AS date
FROM library.dbo.member AS mem
	LEFT JOIN library.dbo.reservation AS res
	ON mem.member_no = res.member_no
WHERE mem.member_no in (250, 341, 1675)
ORDER BY mem.member_no