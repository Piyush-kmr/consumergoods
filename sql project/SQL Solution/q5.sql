
SELECT 
m.product_code,
m.manufacturing_cost,
p.product
 FROM fact_manufacturing_cost m
 join dim_product p
 on m.product_code=p.product_code
 where manufacturing_cost=(select max(manufacturing_cost) from fact_manufacturing_cost)
 or manufacturing_cost=(select min(manufacturing_cost) from fact_manufacturing_cost)