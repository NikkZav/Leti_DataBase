SELECT copy.isbn, copy_no, on_loan, title, translation, cover
FROM library.dbo.title AS title
	JOIN library.dbo.copy AS copy
	ON title.title_no = copy.title_no
	JOIN library.dbo.item AS item
	ON item.isbn = copy.isbn
where copy.isbn = 1000 OR copy.isbn = 1500
ORDER BY copy.isbn