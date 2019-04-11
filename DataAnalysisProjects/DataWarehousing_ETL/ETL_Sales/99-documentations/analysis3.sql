SELECT p.product_name AS Top5Products, SUM(f.order_qty) AS TotalProductsSold,c.home_address_state AS State,
	c.home_address_city AS City,d.the_year AS In_Year
 FROM 	fact_sales f, dim_product p, dim_customer c, dim_date d
 WHERE f.product_skey = p.product_skey
 AND f.customer_skey = c.customer_skey
 AND f.date_skey = d.date_skey
 AND c.home_address_country='Australia'
GROUP BY p.product_name, p.product_id , d.the_year
ORDER BY SUM(f.order_qty) DESC
LIMIT 5