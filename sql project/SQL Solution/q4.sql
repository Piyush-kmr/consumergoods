
with temp_table as
(SELECT
p.segment, 
s.fiscal_year,
count(distinct(p.product_code)) as product_count
FROM dim_product p
JOin fact_sales_monthly s 
on p.product_code=s.product_code
group by p.segment , s.fiscal_year)
select
up_2020.segment,
up_2020.product_count as product_count_2020,
up_2021.product_count as product_count_2021,
up_2021.product_count-up_2020.product_count as differance
from
temp_table as up_2020
join 
temp_table as up_2021
on 
up_2020.segment=up_2021.segment 
and
up_2020.fiscal_year=2020
and
up_2021.fiscal_year=2021
order by differance desc