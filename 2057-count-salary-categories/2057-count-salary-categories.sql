with cte as
(
    select
        case when income < 20000 then 1 else 0 end as "ls",
        case when income between 20000 and 50000 then 1 else 0 end as "avgs",
        case when income > 50000 then 1 else 0 end as "hs"
    from accounts
)

select "Low Salary" category, sum(ls) as accounts_count from cte
union
select "Average Salary" category, sum(avgs) as accounts_count from cte
union
select "High Salary" category, sum(hs) as accounts_count from cte