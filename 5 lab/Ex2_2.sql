SELECT DISTINCT member.firstname,
                member.lastname,
                loanhist.isbn,
                loanhist.fine_paid
FROM loanhist
JOIN member ON member.member_no = loanhist.member_no
WHERE fine_paid =
    (SELECT MAX(loanhist.fine_paid)
     FROM loanhist);