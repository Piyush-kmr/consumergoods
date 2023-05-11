with cte1 as 
(SELECT 
c.channel,
round(sum(g.gross_price*s.sold_quantity/1000000),2) as gross_sales_mln
FROM fact_sales_monthly s
join dim_customer c
              on s.customer_code=c.customer_code
join fact_gross_price g 
              on  
               s.product_code=g.product_code
                                where s.fiscal_year =2021
                                group by c.channel)
select 
*,
round(gross_sales_mln*100/(select round(sum(g.gross_price*s.sold_quantity/1000000),2) from fact_sales_monthly s
join fact_gross_price g 
              on  
               s.product_code=g.product_code
                                where s.fiscal_year =2021
),2) as percentage 
from cte1 
order by percentage desc

