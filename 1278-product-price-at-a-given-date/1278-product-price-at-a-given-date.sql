WITH latest_change AS (
  -- Get the last change date for each product on or before 2019-08-16
  SELECT 
      product_id, 
      MAX(change_date) AS last_change_date
  FROM 
      Products
  WHERE 
      change_date <= '2019-08-16'
  GROUP BY 
      product_id
),
price_on_date AS (
  -- Get the price corresponding to that last change date
  SELECT 
      p.product_id, 
      p.new_price
  FROM 
      Products p
  JOIN 
      latest_change lc
    ON p.product_id = lc.product_id
   AND p.change_date = lc.last_change_date
)
SELECT 
  p_all.product_id,
  COALESCE(p.new_price, 10) AS price
FROM 
  (SELECT DISTINCT product_id FROM Products) p_all
LEFT JOIN 
  price_on_date p
ON p_all.product_id = p.product_id;
