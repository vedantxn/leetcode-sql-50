SELECT DISTINCT t1.num AS ConsecutiveNums
FROM Logs t1
JOIN Logs t2 ON t2.id = t1.id + 1
JOIN Logs t3 ON t3.id = t1.id + 2
WHERE t1.num = t2.num
  AND t2.num = t3.num;
