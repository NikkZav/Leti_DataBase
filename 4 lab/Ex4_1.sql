SELECT	isbn,
		title_no,
		translation,
		cover,
		loanable
FROM library.dbo.item
WHERE	isbn = 10101 AND
		title_no = 8 AND
		cover = 'SOFTBACK'