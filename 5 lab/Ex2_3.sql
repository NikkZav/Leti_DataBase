SELECT isbn,
       COUNT(*) AS total_reserved
FROM reservation
GROUP BY isbn
HAVING COUNT(*) > 50 OR COUNT(*) < 5;