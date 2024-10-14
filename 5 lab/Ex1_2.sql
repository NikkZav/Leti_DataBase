WITH test AS
  (SELECT juvenile.adult_member_no,
          COUNT(juvenile.member_no) AS No_Of_Children,
          adult.expr_date
   FROM juvenile
   JOIN adult ON adult.member_no = juvenile.adult_member_no
   GROUP BY juvenile.adult_member_no,
            adult.expr_date
   HAVING COUNT(juvenile.member_no) > 3)
SELECT *
FROM test;
