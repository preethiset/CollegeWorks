/*Analysis of High Priced product that is ordered on the same day by customers in United States*/

SELECT c.customer_id,f.sales_order_number,c.home_address_state AS State,c.home_address_city AS City,
	p.product_category AS Category, p.product_name AS HighPricedProduct,	
	MAX(f.unit_price)AS UnitPrice, d.the_date AS DateOrdered, 
	SUM(f.unit_price*f.order_qty) AS AmtPurchased
FROM 	fact_sales f,
	dim_customer c,
	dim_product p,
	dim_date d
WHERE 	f.customer_skey= c.customer_skey
AND	f.product_skey= p.product_skey
AND	f.date_skey=d.date_skey
AND 	c.home_address_country ='United States'
AND  	c.customer_id  IN 
       (SELECT DISTINCT c.customer_id )
 AND 	f.sales_order_number IN
	(SELECT DISTINCT f.sales_order_number)
 AND 	d.the_date='2007-07-01'
GROUP BY c.home_address_state, c.home_address_country, p.product_category


