SELECT p.product_name, agg.total_unit AS unit
FROM Products p
JOIN (
    SELECT product_id, SUM(unit) AS total_unit
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
) AS agg ON p.product_id = agg.product_id
WHERE agg.total_unit >= 100;
