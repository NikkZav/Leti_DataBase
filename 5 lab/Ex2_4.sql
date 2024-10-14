SELECT DISTINCT t.title_no,
                t.title,
                c.isbn,
                reserved.total_reserved
FROM COPY c
INNER JOIN title t ON c.title_no = t.title_no
INNER JOIN
  (SELECT isbn,
          COUNT(*) AS total_reserved
   FROM reservation
   GROUP BY isbn
   HAVING COUNT(*) > 50
   OR COUNT(*) < 5) AS reserved ON reserved.isbn = c.isbn
WHERE c.isbn IN
    (SELECT isbn
     FROM reservation
     GROUP BY isbn
     HAVING COUNT(*) > 50
     OR COUNT(*) < 5)