SELECT 
    distinct visited_on,
    sum(amount) over w as amount,
    round((sum(amount) over w)/7 , 2) as average_amount
FROM
    customer
WINDOW 
    w AS(
        order by visited_on
        range between interval 6 day PRECEDING and current row
    )
    LIMIT 6, 999;