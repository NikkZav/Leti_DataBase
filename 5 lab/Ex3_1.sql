SELECT m.member_no,
       m.lastname,
       f.fine
FROM member AS m
JOIN
  (SELECT member_no,
          SUM(fine_assessed) AS fine
   FROM loanhist
   GROUP BY member_no) AS f ON f.member_no = m.member_no
WHERE f.fine > 5;