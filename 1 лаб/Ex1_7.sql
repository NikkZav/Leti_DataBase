SELECT DISTINCT member_no, fine_paid, fine_waived
FROM library.dbo.loanhist
WHERE fine_paid IS NULL