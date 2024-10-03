DELETE juv
FROM library.dbo.juvenile juv
JOIN library.dbo.adult adu
ON juv.member_no = adu.member_no;
