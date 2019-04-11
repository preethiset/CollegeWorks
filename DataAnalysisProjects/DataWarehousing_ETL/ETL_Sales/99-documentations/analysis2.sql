
SELECT c.home_address_country AS Country, p.product_category AS Category ,p.product_name,c.regional_group AS region,
	d.the_year,
	SUM(f.order_qty) AS TotalQtyOrdered, 
	SUM(unit_price) AS TotalAmtPurchased, 
	AVG(f.unit_price) AS AvgUnitsPurchased
FROM 	fact_sales f,
	dim_customer c,
	dim_product p,
	dim_date d
WHERE 	f.customer_skey= c.customer_skey
AND   	f.product_skey= p.product_skey
AND 	f.date_skey=d.date_skey
AND 	product_category='Bikes'
GROUP BY c.home_address_country, p.product_category,c.regional_group
