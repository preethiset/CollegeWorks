/*Analysis of a particular product_id's selling range by its Quarter results in the year 2007 in the city British Columbia, Canada.*/

SELECT p.product_name, p.product_category AS Category, c.home_address_state AS State , c.home_address_country AS Country, 
	d.the_year AS In_Year,d.the_quarter AS In_Quarter, SUM(f.order_qty) AS Total_Order, SUM(f.unit_price) AS Total_price
    FROM fact_sales f, dim_product p, dim_customer c, dim_date d
    WHERE f.product_skey = p.product_skey
    AND f.customer_skey = c.customer_skey
    AND f.date_skey = d.date_skey
    AND p.product_id = 859
    AND c.home_address_country= 'Canada'
    GROUP BY p.product_name,p.product_category, c.home_address_state, d.the_year, d.the_quarter, f.unit_price
    LIMIT 5