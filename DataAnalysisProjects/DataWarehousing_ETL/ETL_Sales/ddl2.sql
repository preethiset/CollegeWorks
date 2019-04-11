DROP TABLE IF EXISTS  source_db.customersurvey; 
CREATE TABLE `customersurvey` (
  `customerid` INT(11) NOT NULL DEFAULT '0' COMMENT 'Primary key.',
  `Phone` VARCHAR(20) CHARACTER SET latin1 DEFAULT NULL,
  `MaritalStatus` CHAR(1) CHARACTER SET latin1 DEFAULT NULL,
  `Suffix` VARCHAR(10) CHARACTER SET latin1 DEFAULT NULL,
  `Gender` VARCHAR(1) CHARACTER SET latin1 DEFAULT NULL,
  `YearlyIncome` DECIMAL(19,4) DEFAULT NULL,
  `TotalChildren` TINYINT(3) UNSIGNED DEFAULT NULL,
  `NumberChildrenAtHome` TINYINT(3) UNSIGNED DEFAULT NULL,
  `EnglishEducation` VARCHAR(40) CHARACTER SET latin1 DEFAULT NULL,
  `SpanishEducation` VARCHAR(40) CHARACTER SET latin1 DEFAULT NULL,
  `FrenchEducation` VARCHAR(40) CHARACTER SET latin1 DEFAULT NULL,
  `EnglishOccupation` VARCHAR(100) CHARACTER SET latin1 DEFAULT NULL,
  `SpanishOccupation` VARCHAR(100) CHARACTER SET latin1 DEFAULT NULL,
  `FrenchOccupation` VARCHAR(100) CHARACTER SET latin1 DEFAULT NULL,
  `DateFirstPurchase` DATE DEFAULT NULL,
  `HouseOwnerFlag` CHAR(1) CHARACTER SET latin1 DEFAULT NULL,
  `NumberCarsOwned` TINYINT(3) UNSIGNED DEFAULT NULL,
  `CommuteDistance` VARCHAR(15) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`customerid`)
  );
  
  
DROP TABLE  IF EXISTS source_db.person;

CREATE TABLE `person` (
  `BusinessEntityID` INT(11) NOT NULL COMMENT 'Primary key for Person records.',
  `PersonType` CHAR(2) NOT NULL COMMENT 'Primary type of person: SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact',
  `NameStyle` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.',
  `Title` VARCHAR(8) DEFAULT NULL COMMENT 'A courtesy title. For example, Mr. or Ms.',
  `FirstName` VARCHAR(100) NOT NULL COMMENT 'First name of the person.',
  `MiddleName` VARCHAR(100) DEFAULT NULL COMMENT 'Middle name or middle initial of the person.',
  `LastName` VARCHAR(100) NOT NULL COMMENT 'Last name of the person.',
  `Suffix` VARCHAR(10) DEFAULT NULL COMMENT 'Surname suffix. For example, Sr. or Jr.',
  `EmailPromotion` INT(11) NOT NULL DEFAULT '0' COMMENT '0 = Contact does not wish to receive e-mail promotions, 1 = Contact does wish to receive e-mail promotions from AdventureWorks, 2 = Contact does wish to receive e-mail promotions from AdventureWorks and selected partners. ',
  `AdditionalContactInfo` TEXT COMMENT 'Additional contact information about the person stored in xml format. ',
  `Demographics` TEXT COMMENT 'Personal information such as hobbies, and income collected from online shoppers. Used for sales analysis.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Person_rowguid` (`rowguid`),
  KEY `IX_Person_LastName_FirstName_MiddleName` (`LastName`,`FirstName`,`MiddleName`),
  KEY `PXML_Person_AddContact` (`AdditionalContactInfo`(255)),
  KEY `PXML_Person_Demographics` (`Demographics`(255)),
  KEY `XMLPATH_Person_Demographics` (`Demographics`(255)),
  KEY `XMLPROPERTY_Person_Demographics` (`Demographics`(255)),
  KEY `XMLVALUE_Person_Demographics` (`Demographics`(255))
  );



DROP TABLE IF EXISTS source_db.salesterritory;

CREATE TABLE `salesterritory` (
  `TerritoryID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for SalesTerritory records.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Sales territory description',
  `CountryRegionCode` VARCHAR(3) NOT NULL COMMENT 'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ',
  `Group` VARCHAR(50) NOT NULL COMMENT 'Geographic area to which the sales territory belong.',
  `SalesYTD` DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales in the territory year to date.',
  `SalesLastYear` DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales in the territory the previous year.',
  `CostYTD` DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Business costs in the territory year to date.',
  `CostLastYear` DECIMAL(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Business costs in the territory the previous year.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`TerritoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesTerritory_Name` (`Name`),
  UNIQUE KEY `AK_SalesTerritory_rowguid` (`rowguid`)
  );
  
  
DROP TABLE IF EXISTS  source_db.stateprovince;

CREATE TABLE `stateprovince` (
  `StateProvinceID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for StateProvince records.',
  `StateProvinceCode` CHAR(3) NOT NULL COMMENT 'ISO standard state or province code.',
  `CountryRegionCode` VARCHAR(3) NOT NULL COMMENT 'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ',
  `IsOnlyStateProvinceFlag` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'State or province description.',
  `TerritoryID` INT(11) NOT NULL COMMENT 'ID of the territory in which the state or province is located. Foreign key to SalesTerritory.SalesTerritoryID.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`StateProvinceID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_StateProvince_Name` (`Name`),
  UNIQUE KEY `AK_StateProvince_StateProvinceCode_CountryRegionCode` (`StateProvinceCode`,`CountryRegionCode`),
  UNIQUE KEY `AK_StateProvince_rowguid` (`rowguid`)
  );
  
  
DROP TABLE IF EXISTS source_db.address;

CREATE TABLE `address` (
  `AddressID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for Address records.',
  `AddressLine1` VARCHAR(60) NOT NULL COMMENT 'First street address line.',
  `AddressLine2` VARCHAR(60) DEFAULT NULL COMMENT 'Second street address line.',
  `City` VARCHAR(30) NOT NULL COMMENT 'Name of the city.',
  `StateProvinceID` INT(11) NOT NULL COMMENT 'Unique identification number for the state or province. Foreign key to StateProvince table.',
  `PostalCode` VARCHAR(15) NOT NULL COMMENT 'Postal code for the street address.',
  `SpatialLocation` GEOMETRY DEFAULT NULL COMMENT 'Latitude and longitude of this address.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Address_rowguid` (`rowguid`),
  UNIQUE KEY `IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_Post1` (`AddressLine1`,`AddressLine2`,`City`,`StateProvinceID`,`PostalCode`),
  KEY `IX_Address_StateProvinceID` (`StateProvinceID`)
  );
  
  DROP TABLE IF EXISTS  source_db.countryregion;
  
  CREATE TABLE `countryregion` (
  `CountryRegionCode` VARCHAR(3) NOT NULL COMMENT 'ISO standard code for countries and regions.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Country or region name.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CountryRegionCode`),
  UNIQUE KEY `AK_CountryRegion_Name` (`Name`)
  );
  
 DROP TABLE IF EXISTS  source_db.customer;
CREATE TABLE `customer` (
  `CustomerID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `PersonID` INT(11) DEFAULT NULL COMMENT 'Foreign key to Person.BusinessEntityID',
  `StoreID` INT(11) DEFAULT NULL COMMENT 'Foreign key to Store.BusinessEntityID',
  `TerritoryID` INT(11) DEFAULT NULL COMMENT 'ID of the territory in which the customer is located. Foreign key to SalesTerritory.SalesTerritoryID.',
  `AccountNumber` VARCHAR(10) NOT NULL COMMENT 'Unique number identifying the customer assigned by the accounting system.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Customer_rowguid` (`rowguid`),
  UNIQUE KEY `AK_Customer_AccountNumber` (`AccountNumber`),
  KEY `IX_Customer_TerritoryID` (`TerritoryID`)
  );
  
  
DROP TABLE IF EXISTS  source_db.businessentityaddress;

CREATE TABLE `businessentityaddress` (
  `BusinessEntityID` INT(11) NOT NULL COMMENT 'Primary key. Foreign key to BusinessEntity.BusinessEntityID.',
  `AddressID` INT(11) NOT NULL COMMENT 'Primary key. Foreign key to Address.AddressID.',
  `AddressTypeID` INT(11) NOT NULL COMMENT 'Primary key. Foreign key to AddressType.AddressTypeID.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`AddressID`,`AddressTypeID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_BusinessEntityAddress_rowguid` (`rowguid`),
  KEY `IX_BusinessEntityAddress_AddressID` (`AddressID`),
  KEY `IX_BusinessEntityAddress_AddressTypeID` (`AddressTypeID`)
  );
  
  
  
DROP TABLE IF EXISTS  source_db.personphone;

CREATE TABLE `personphone` (
  `BusinessEntityID` INT(11) NOT NULL COMMENT 'Business entity identification number. Foreign key to Person.BusinessEntityID.',
  `PhoneNumber` VARCHAR(50) NOT NULL COMMENT 'Telephone number identification number.',
  `PhoneNumberTypeID` INT(11) NOT NULL COMMENT 'Kind of phone number. Foreign key to PhoneNumberType.PhoneNumberTypeID.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`PhoneNumber`,`PhoneNumberTypeID`),
  KEY `IX_PersonPhone_PhoneNumber` (`PhoneNumber`)
  );
  
  
DROP TABLE IF EXISTS  source_db.emailaddress;

CREATE TABLE `emailaddress` (
  `BusinessEntityID` INT(11) NOT NULL COMMENT 'Primary key. Person associated with this email address.  Foreign key to Person.BusinessEntityID',
  `EmailAddressID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key. ID of this email address.',
  `EmailAddress` VARCHAR(50) DEFAULT NULL COMMENT 'E-mail address for the person.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`EmailAddressID`,`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `IX_EmailAddress_EmailAddress` (`EmailAddress`)
  );
  
  'OLTP PRODUCT QUERIES'
  DROP TABLE IF EXISTS  source_db.product;
  CREATE TABLE `product` (
  `ProductID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for Product records.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Name of the product.',
  `ProductNumber` VARCHAR(25) NOT NULL COMMENT 'Unique product identification number.',
  `MakeFlag` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is purchased, 1 = Product is manufactured in-house.',
  `FinishedGoodsFlag` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is not a salable item. 1 = Product is salable.',
  `Color` VARCHAR(15) DEFAULT NULL COMMENT 'Product color.',
  `SafetyStockLevel` SMALLINT(6) NOT NULL COMMENT 'Minimum inventory quantity. ',
  `ReorderPoint` SMALLINT(6) NOT NULL COMMENT 'Inventory level that triggers a purchase order or work order. ',
  `StandardCost` DECIMAL(19,4) NOT NULL COMMENT 'Standard cost of the product.',
  `ListPrice` DECIMAL(19,4) NOT NULL COMMENT 'Selling price.',
  `Size` VARCHAR(5) DEFAULT NULL COMMENT 'Product size.',
  `SizeUnitMeasureCode` CHAR(3) DEFAULT NULL COMMENT 'Unit of measure for Size column.',
  `WeightUnitMeasureCode` CHAR(3) DEFAULT NULL COMMENT 'Unit of measure for Weight column.',
  `Weight` DECIMAL(8,2) DEFAULT NULL COMMENT 'Product weight.',
  `DaysToManufacture` INT(11) NOT NULL COMMENT 'Number of days required to manufacture the product.',
  `ProductLine` CHAR(2) DEFAULT NULL COMMENT 'R = Road, M = Mountain, T = Touring, S = Standard',
  `Class` CHAR(2) DEFAULT NULL COMMENT 'H = High, M = Medium, L = Low',
  `Style` CHAR(2) DEFAULT NULL COMMENT 'W = Womens, M = Mens, U = Universal',
  `ProductSubcategoryID` INT(11) DEFAULT NULL COMMENT 'Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. ',
  `ProductModelID` INT(11) DEFAULT NULL COMMENT 'Product is a member of this product model. Foreign key to ProductModel.ProductModelID.',
  `SellStartDate` DATETIME NOT NULL COMMENT 'Date the product was available for sale.',
  `SellEndDate` DATETIME DEFAULT NULL COMMENT 'Date the product was no longer available for sale.',
  `DiscontinuedDate` DATETIME DEFAULT NULL COMMENT 'Date the product was discontinued.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Product_ProductNumber` (`ProductNumber`),
  UNIQUE KEY `AK_Product_Name` (`Name`),
  UNIQUE KEY `AK_Product_rowguid` (`rowguid`)
  );


DROP TABLE IF EXISTS  source_db.productcategory;
CREATE TABLE `productcategory` (
  `ProductCategoryID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for ProductCategory records.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Category description.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductCategoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductCategory_Name` (`Name`),
  UNIQUE KEY `AK_ProductCategory_rowguid` (`rowguid`)
  );
  
  
DROP TABLE IF EXISTS  source_db.productsubcategory;
CREATE TABLE `productsubcategory` (
  `ProductSubcategoryID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for ProductSubcategory records.',
  `ProductCategoryID` INT(11) NOT NULL COMMENT 'Product category identification number. Foreign key to ProductCategory.ProductCategoryID.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Subcategory description.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductSubcategoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductSubcategory_Name` (`Name`),
  UNIQUE KEY `AK_ProductSubcategory_rowguid` (`rowguid`)
  );
  DROP TABLE IF EXISTS  source_db.unitmeasure;
CREATE TABLE `unitmeasure` (
  `UnitMeasureCode` CHAR(3) NOT NULL COMMENT 'Primary key.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Unit of measure description.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`UnitMeasureCode`),
  UNIQUE KEY `AK_UnitMeasure_Name` (`Name`)
  );
  
  
DROP TABLE IF EXISTS  source_db.productlistpricehistory;

CREATE TABLE `productlistpricehistory` (
  `ProductID` INT(11) NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID',
  `StartDate` DATETIME NOT NULL COMMENT 'List price start date.',
  `EndDate` DATETIME DEFAULT NULL COMMENT 'List price end date',
  `ListPrice` DECIMAL(19,4) NOT NULL COMMENT 'Product list price.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`StartDate`)
  );
  
  
  
DROP TABLE IF EXISTS  source_db.productmodel;
CREATE TABLE `productmodel` (
  `ProductModelID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for ProductModel records.',
  `Name` VARCHAR(100) NOT NULL COMMENT 'Product model description.',
  `CatalogDescription` TEXT COMMENT 'Detailed product catalog information in xml format.',
  `Instructions` TEXT COMMENT 'Manufacturing instructions in xml format.',
  `rowguid` VARCHAR(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductModelID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductModel_Name` (`Name`),
  UNIQUE KEY `AK_ProductModel_rowguid` (`rowguid`),
  KEY `PXML_ProductModel_CatalogDescription` (`CatalogDescription`(255)),
  KEY `PXML_ProductModel_Instructions` (`Instructions`(255))
);


DROP TABLE IF EXISTS stage_db.customer_stg;
CREATE TABLE stage_db.customer_stg (
  customer_id INT(11) NOT NULL COMMENT 'Primary key for Person records.',
  title VARCHAR(8) DEFAULT NULL COMMENT 'A courtesy title. For example, Mr. or Ms.',
  first_name VARCHAR(100) NOT NULL COMMENT 'First name of the person.',
  middle_name VARCHAR(100) DEFAULT NULL COMMENT 'Middle name or middle initial of the person.',
  last_name VARCHAR(100) NOT NULL COMMENT 'Last name of the person.',
  email_address VARCHAR(50) DEFAULT NULL,
  home_address_line1 VARCHAR(120) DEFAULT NULL,
  home_address_line2 VARCHAR(120) DEFAULT NULL,
  home_address_city VARCHAR(30) NOT NULL COMMENT 'Name of the city.',
  home_address_state VARCHAR(100) NOT NULL COMMENT 'State or province description.',
  home_address_country VARCHAR(100) NOT NULL COMMENT 'Country or region name.',
  regional_group VARCHAR(50) NOT NULL COMMENT 'Geographic area to which the sales territory belong.',
  cell_phone_number VARCHAR(50) DEFAULT NULL COMMENT 'Telephone number identification number.',
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

SELECT * FROM customer_stg


/*datamart load dim customer*/
DROP TABLE IF EXISTS datamart_db.dim_customer;
CREATE TABLE datamart_db.dim_customer (
  customer_skey INT(20) NOT NULL DEFAULT '0' COMMENT 'Surrogate Key',
  customer_id INT(11) NOT NULL DEFAULT '0' COMMENT 'Primary key for Person records.',
  title VARCHAR(8) DEFAULT NULL DEFAULT '-' COMMENT 'A courtesy title. For example, Mr. or Ms.',
  first_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'First name of the person.',
  middle_name VARCHAR(100) DEFAULT '-' COMMENT 'Middle name or middle initial of the person.',
  last_name VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'Last name of the person.',
  email_address VARCHAR(50) DEFAULT '-',
  home_address_line1 VARCHAR(120) DEFAULT '-', /* renamed from address_line1 */
  home_address_line2 VARCHAR(120) DEFAULT '-', /* renamed from address_line2 */
  home_address_city VARCHAR(30) NOT NULL DEFAULT '-' COMMENT 'Name of the city.',
  home_address_state VARCHAR(100) NOT NULL DEFAULT '-' COMMENT 'State or province description.',
  home_address_country VARCHAR(100) NOT NULL `sakila``sakila`DEFAULT '-' COMMENT 'Country or region name.',
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
