SELECT	title_no,
		title,
		author,
		synopsis
FROM library.dbo.title
WHERE	title = 'Riders of the Purple Sage' AND
		author = 'Zane Grey'
