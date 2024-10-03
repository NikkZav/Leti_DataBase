SELECT	'The title is: ' + 
		title +
		', title number ' + 
		CONVERT(varchar(10), title_no)
FROM library.dbo.title