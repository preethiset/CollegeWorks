/* source_db */
DROP TABLE IF EXISTS source_db.product_raw;
CREATE TABLE source_db.product_raw (
  product_id INT(11) NOT NULL DEFAULT '0' COMMENT 'Primary key for Product records.',
  product_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'Name of the product.',
  make_flag TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is purchased, 1 = Product is manufactured in-house.',
  finished_goods_flag TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is not a salable item. 1 = Product is salable.',
  color VARCHAR(15) DEFAULT NULL COMMENT 'Product color.',
  product_subcategory VARCHAR(100) COMMENT 'Subcategory description.',
  product_category VARCHAR(100) COMMENT 'Category description.',
  model_name VARCHAR(100) COMMENT 'Product model description.',
  size_unit_measure VARCHAR(100) COMMENT 'Unit of measure description.',
  weight_unit_measure VARCHAR(100) COMMENT 'Unit of measure description.',
  list_price DECIMAL(19,4) COMMENT 'Product list price.',
  modified_date DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT 'List price start date.',
  PRIMARY KEY (product_id,modified_date)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS source_db.customer_raw;
CREATE TABLE source_db.customer_raw (
  customer_id INT(11) NOT NULL COMMENT 'Primary key for Person records.',
  title VARCHAR(8) DEFAULT NULL COMMENT 'A courtesy title. For example, Mr. or Ms.',
  first_name VARCHAR(100) NOT NULL COMMENT 'First name of the person.',
  middle_name VARCHAR(100) DEFAULT NULL COMMENT 'Middle name or middle initial of the person.',
  last_name VARCHAR(100) NOT NULL COMMENT 'Last name of the person.',
  email_address VARCHAR(50) DEFAULT NULL,
  address_line1 VARCHAR(120) DEFAULT NULL,
  address_line2 VARCHAR(120) DEFAULT NULL,
  home_address_city VARCHAR(30) NOT NULL COMMENT 'Name of the city.',
  home_address_state VARCHAR(100) NOT NULL COMMENT 'State or province description.',
  home_address_country VARCHAR(100) NOT NULL COMMENT 'Country or region name.',
  regional_group VARCHAR(50) NOT NULL COMMENT 'Geographic area to which the sales territory belong.',
  cell_phone_number VARCHAR(50) COMMENT 'Telephone number identification number.',
  contact_phone_number VARCHAR(20) DEFAULT NULL,
  marital_status CHAR(1) DEFAULT NULL,
  suffix VARCHAR(10) DEFAULT NULL,
  gender VARCHAR(1) DEFAULT NULL,
  yearly_income DECIMAL(19,4) DEFAULT NULL,
  total_children TINYINT(3) UNSIGNED DEFAULT NULL,
  number_children_athome TINYINT(3) UNSIGNED DEFAULT NULL,
  houseowner_flag CHAR(1) DEFAULT NULL,
  number_cars_owned TINYINT(3) UNSIGNED DEFAULT NULL,
  commute_distance VARCHAR(15) DEFAULT NULL,
  modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (customer_id)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS source_db.sales_raw;
CREATE TABLE source_db.sales_raw (
  customer_id INT(11) NOT NULL COMMENT 'Primary key for Person records.',
  product_id INT(11) NOT NULL COMMENT 'Product sold to customer. Foreign key to Product.ProductID.',
  order_qty SMALLINT(6) NOT NULL COMMENT 'Quantity ordered per product.',
  unit_price DECIMAL(19,4) NOT NULL COMMENT 'Selling price of a single product.',
  unit_price_discount DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount amount.',
  order_date DATE NOT NULL COMMENT 'Dates the sales order was created.',
  sales_order_number VARCHAR(50) DEFAULT NULL COMMENT 'Customer sales order number reference. '
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/* datamart_db */
DROP TABLE IF EXISTS datamart_db.dim_product;
CREATE TABLE datamart_db.dim_product (
  product_skey INT(20) NOT NULL DEFAULT '0' COMMENT 'Surrogate Key',
  product_id INT(11) NOT NULL DEFAULT '0' COMMENT 'Primary key for Product records.',
  product_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'Name of the product.',
  make_flag TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is purchased, 1 = Product is manufactured in-house.',
  finished_goods_flag TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is not a salable item. 1 = Product is salable.',
  color VARCHAR(15) DEFAULT '-' COMMENT 'Product color.',
  product_subcategory VARCHAR(100) DEFAULT '-' COMMENT 'Subcategory description.',
  product_category VARCHAR(100) DEFAULT '-' COMMENT 'Category description.',
  model_name VARCHAR(100) DEFAULT '-' COMMENT 'Product model description.',
  size_unit_measure VARCHAR(100) DEFAULT '-' COMMENT 'Unit of measure description.',
  weight_unit_measure VARCHAR(100) DEFAULT '-' COMMENT 'Unit of measure description.',
  list_price DECIMAL(19,4) DEFAULT '0.0000' COMMENT 'Product list price.',
  VERSION BIGINT(20) DEFAULT NULL,
  date_from DATETIME DEFAULT NULL,
  date_to DATETIME DEFAULT NULL,
  PRIMARY KEY (product_skey),
  UNIQUE KEY product_id (product_id,date_from)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS datamart_db.dim_customer;
CREATE TABLE datamart_db.dim_customer (
  customer_skey INT(20) NOT NULL DEFAULT '0' COMMENT 'Surrogate Key',
  customer_id INT(11) NOT NULL DEFAULT '0' COMMENT 'Primary key for Person records.',
  title VARCHAR(8) DEFAULT NULL DEFAULT '-' COMMENT 'A courtesy title. For example, Mr. or Ms.',
  first_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'First name of the person.',
  middle_name VARCHAR(100) DEFAULT '-' COMMENT 'Middle name or middle initial of the person.',
  last_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'Last name of the person.',
  email_address VARCHAR(50) DEFAULT '-',
  address_line1 VARCHAR(120) DEFAULT '-',
  address_line2 VARCHAR(120) DEFAULT '-',
  home_address_city VARCHAR(30) NOT NULL DEFAULT '-' COMMENT 'Name of the city.',
  home_address_state VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'State or province description.',
  home_address_country VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'Country or region name.',
  regional_group VARCHAR(50) NOT NULL DEFAULT '-' COMMENT 'Geographic area to which the sales territory belong.',
  cell_phone_number VARCHAR(50) DEFAULT '-' COMMENT 'Telephone number identification number.',
  contact_phone_number VARCHAR(20) DEFAULT '-',
  marital_status CHAR(1) DEFAULT '-',
  suffix VARCHAR(10) DEFAULT '-',
  gender VARCHAR(1) DEFAULT '-',
  yearly_income DECIMAL(19,4) DEFAULT -1,
  total_children INT(3) DEFAULT -1,
  number_children_athome INT(3) DEFAULT -1,
  houseowner_flag CHAR(1) DEFAULT '-',
  number_cars_owned TINYINT(3) DEFAULT -1,
  commute_distance VARCHAR(15) DEFAULT '-',
  modified_date DATETIME DEFAULT NULL COMMENT 'Date and time the record was last updated.',
  VERSION BIGINT(20) DEFAULT NULL,
  date_from DATETIME DEFAULT NULL,
  date_to DATETIME DEFAULT NULL,
  PRIMARY KEY (customer_skey),
  UNIQUE KEY product_id (customer_id,date_from)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS datamart_db.dim_date;
CREATE TABLE datamart_db.dim_date (
  date_skey INT(11) NOT NULL DEFAULT '0',
  the_date DATE DEFAULT NULL,
  the_year SMALLINT(6) DEFAULT NULL,
  the_quarter TINYINT(4) DEFAULT NULL,
  the_month TINYINT(4) DEFAULT NULL,
  the_week TINYINT(4) DEFAULT NULL,
  day_of_year SMALLINT(6) DEFAULT NULL,
  day_of_month TINYINT(4) DEFAULT NULL,
  day_of_week TINYINT(4) DEFAULT NULL,
  PRIMARY KEY (date_skey)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS datamart_db.fact_sales;
CREATE TABLE datamart_db.fact_sales (
  date_skey INT(11) NOT NULL DEFAULT '0',
  product_skey INT(11) NOT NULL,
  customer_skey INT(11) NOT NULL,
  order_qty SMALLINT(6) NOT NULL COMMENT 'Quantity ordered per product.',
  unit_price DECIMAL(19,4) NOT NULL COMMENT 'Selling price of a single product.',
  unit_price_discount DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount amount.',
  extended_amount DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Extended amount.',
  sales_order_number VARCHAR(25) NOT NULL COMMENT 'Unique sales order identification number.'
) ENGINE=MYISAM DEFAULT CHARSET=utf8;


