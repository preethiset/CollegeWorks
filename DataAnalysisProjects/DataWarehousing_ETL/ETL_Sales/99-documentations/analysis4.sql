SELECT c.regional_group, c.home_address_city,p.product_category,
	SUM(f.unit_price) AS AmoutPurchased,
	MAX(d.the_year) AS Inyear,
	COUNT(CASE WHEN c.gender='M' THEN 1 END) AS NoOfMales,
	COUNT(CASE WHEN gender='F' THEN 1 END) AS NoOfFemales,
	COUNT(*) AS NumberOfCustomers
FROM 	fact_sales f,
	dim_customer c,
	dim_product p,
	dim_date d
WHERE 	f.customer_skey= c.customer_skey
AND	f.product_skey= p.product_skey
AND 	f.date_skey=d.date_skey
AND 	d.the_year= '2007' AND '2006'
GROUP BY 
	c.home_address_country, p.product_category,c.gender, d.the_year

