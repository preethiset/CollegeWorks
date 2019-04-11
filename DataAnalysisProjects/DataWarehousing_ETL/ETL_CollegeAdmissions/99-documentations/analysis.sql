-- Analysis

1.
/*
List the top 10 customers in terms of purchases and group by year
 */
SELECT c.customer_skey, c.last_name,c.first_name, c.gender, sum(f.extended_amount) as total_amt,d.the_year
      FROM fact_sales F, dim_customer C, dim_date D
      WHERE F.customer_skey=C.customer_skey AND F.date_skey=D.date_skey
      GROUP BY D.the_year, d.the_month
      ORDER BY d.the_year desc, total_amt desc
      limit 10;

2. 
/*
which gender purchased the highest -group by year
 */
SELECT c.gender, sum(f.extended_amount) as total_amt,d.the_year
      FROM fact_sales F, dim_customer C, dim_date D
      WHERE F.customer_skey=C.customer_skey AND F.date_skey=D.date_skey
      GROUP BY c.gender, D.the_year
      ORDER BY d.the_year desc, total_amt desc ;

3.
/*
What is the sum of sales distribution in a month every year? ANy pattern ?
*/

SELECT d.the_month, d.the_year, sum(f.extended_amount) total_amt
    FROM fact_sales f, dim_customer c, dim_product p, dim_date d
    WHERE f.customer_skey=c.customer_skey AND f.product_skey=p.product_skey AND f.date_skey= d.date_skey
    GROUP BY  d.the_month, d.the_year
    ORDER BY d.the_year desc, total_amt desc;


4.
/*
Which color of the products is the most sought after and which gender seeks it - any yearly pattern
*/
SELECT distinct p.color, c.gender, d.the_year, sum(f.extended_amount) amt
    FROM fact_sales f, dim_customer c, dim_product p, dim_date d
    WHERE f.customer_skey=c.customer_skey AND f.product_skey=p.product_skey AND f.date_skey= d.date_skey
    GROUP BY  p.color, d.the_year
    ORDER BY d.the_year desc, c.gender, amt desc;

5.
/*
which state has the most ordering customers in terms of order value greater than a sum value of $1000 in the USA per each year
*/
select e.*
FROM
(
    SELECT c.home_address_state, c.home_address_country,  sum(f.extended_amount) as total_amt, d.the_year
    FROM fact_sales f, dim_customer c, dim_product p, dim_date d
    WHERE f.customer_skey=c.customer_skey AND f.product_skey=p.product_skey AND f.date_skey= d.date_skey
    AND c.home_address_country LIKE 'United States'
    GROUP BY c.home_address_state, d.the_year
    ORDER BY d.the_year DESC, total_amt DESC
) e
where e.total_amt > 1000.0000;


6.
/*
The Sub categories which are being sold every year
 */
SELECT  f.product_skey,  p.product_id, p.model_name, p.product_category, p.product_subcategory, sum(f.extended_amount) total_amt, d.the_year
    FROM fact_sales f, dim_customer c, dim_product p, dim_date d
    WHERE f.customer_skey=c.customer_skey AND f.product_skey=p.product_skey AND f.date_skey= d.date_skey
    GROUP BY  p.product_subcategory , d.the_year
    ORDER BY D.the_year;



