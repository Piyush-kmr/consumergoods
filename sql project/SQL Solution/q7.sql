SELECT
 CONCAT(MONTHNAME(s.date), ' (', YEAR(s.date), ')') AS 'month',
 s.fiscal_year,
 round(sum(s.sold_quantity*g.gross_price),2) as gross_sales_amount
 FROM fact_sales_monthly s
 join fact_gross_price g on s.product_code=g.product_code 
 join dim_customer c on s.customer_code=c.customer_code
 where customer ='Atliq Exclusive'
 GROUP BY  Month, s.fiscal_year 
 order by s.fiscal_year
 