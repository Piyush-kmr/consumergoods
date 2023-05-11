WITH cte1 AS 
(
SELECT P.division, FS.product_code, P.product, SUM(FS.sold_quantity) AS Total_sold_quantity
FROM dim_product P JOIN fact_sales_monthly FS
ON P.product_code = FS.product_code
WHERE FS.fiscal_year = 2021 
GROUP BY  FS.product_code, division, P.product
),
cte2 AS 
(
SELECT division, product_code, product, Total_sold_quantity,
        RANK() OVER(PARTITION BY division ORDER BY Total_sold_quantity DESC) AS 'Rank_Order' 
FROM cte1
)
 SELECT cte1.division, cte1.product_code, cte1.product, cte2.Total_sold_quantity, cte2.Rank_Order
 FROM cte1 JOIN cte2
 ON cte1.product_code = cte2.product_code
WHERE cte2.Rank_Order IN (1,2,3)