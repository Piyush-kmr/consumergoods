with cte1 as
(SELECT 
customer_code,
avg(pre_invoice_discount_pct) as average_discount_percentage
 FROM fact_pre_invoice_deductions
 where fiscal_year=2021
 group by customer_code
)
SELECT 
ct.customer_code,
c.customer,
ct.average_discount_percentage
FROM cte1 ct
join dim_customer c 
on ct.customer_code=c.customer_code
where market = "india"
order by average_discount_percentage desc 
limit 5