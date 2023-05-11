SELECT 
sum(sold_quantity) as total_sold_quantity,
fiscal_year,
case
when month(date) in (9,10,11) then "Q1"
when month(date) in (12,1,2) then "Q2"
when month(date) in (3,4,5) then "Q3"
else "Q4"
end as quator
FROM gdb023.fact_sales_monthly
where fiscal_year=2020
group by quator
order by quator desc