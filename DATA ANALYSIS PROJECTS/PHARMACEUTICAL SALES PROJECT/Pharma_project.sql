-- Checking for data formats of columns
DESCRIBE pharma;

-- Adding row ids
ALTER TABLE pharma
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- Checking for and removing duplicates
SELECT *
FROM (
    SELECT
        p.*,
        ROW_NUMBER() OVER (
            PARTITION BY
                Distributor, `Customer Name`, City, Country,
                Latitude, Longitude, Channel, `Sub-channel`,
                `Product Name`, `Product Class`, Quantity, Price,
                Sales, Month, Year, `Name of Sales Rep`,
                Manager, `Sales Team`
        ) AS rn
    FROM pharma p
) x
WHERE rn > 1;

DELETE FROM pharma
WHERE id IN (
    SELECT id
    FROM (
        SELECT
            id,
            ROW_NUMBER() OVER (
                PARTITION BY
                    Distributor, `Customer Name`, City, Country,
                    Latitude, Longitude, Channel, `Sub-channel`,
                    `Product Name`, `Product Class`, Quantity, Price,
                    Sales, Month, Year, `Name of Sales Rep`,
                    Manager, `Sales Team`
            ) AS rn
        FROM pharma
    ) x
    WHERE rn > 1
);

-- Handling Null values

SELECT *
FROM pharma
WHERE
    Distributor IS NULL
    OR `Customer Name` IS NULL
    OR City IS NULL
    OR Country IS NULL
    OR Latitude IS NULL
    OR Longitude IS NULL
    OR Channel IS NULL
    OR `Sub-channel` IS NULL
    OR `Product Name` IS NULL
    OR `Product Class` IS NULL
    OR Quantity IS NULL
    OR Price IS NULL
    OR Sales IS NULL
    OR Month IS NULL
    OR Year IS NULL
    OR `Name of Sales Rep` IS NULL
    OR Manager IS NULL
    OR `Sales Team` IS NULL;

-- Checking for blank spaces

     SELECT *
FROM pharma
WHERE
    TRIM(Distributor) = ''
    OR TRIM(`Customer Name`) = ''
    OR TRIM(City) = ''
    OR TRIM(Country) = ''
    OR TRIM(Channel) = ''
    OR TRIM(`Sub-channel`) = ''
    OR TRIM(`Product Name`) = ''
    OR TRIM(`Product Class`) = ''
    OR TRIM(`Name of Sales Rep`) = ''
    OR TRIM(Manager) = ''
    OR TRIM(`Sales Team`) = '';

--
SET SQL_SAFE_UPDATES =0;
UPDATE pharma
SET
    Distributor = TRIM(Distributor),
    `Customer Name` = TRIM(`Customer Name`),
    City = TRIM(City),
    Country = TRIM(Country),
    Channel = TRIM(Channel),
    `Sub-channel` = TRIM(`Sub-channel`),
    `Product Name` = TRIM(`Product Name`),
    `Product Class` = TRIM(`Product Class`),
    `Name of Sales Rep` = TRIM(`Name of Sales Rep`),
    Manager = TRIM(Manager),
    `Sales Team` = TRIM(`Sales Team`); 
 
-- Dates
SELECT COUNT(DISTINCT Month)
FROM pharma;

-- Checking inappropriate values
SELECT *
FROM pharma
WHERE Quantity < 0
   OR Price < 0
   OR Sales < 0
   OR Latitude NOT BETWEEN -90 AND 90
   OR Longitude NOT BETWEEN -180 AND 180;

-- Checking for inconsistencies
SELECT DISTINCT Channel
FROM pharma;

SELECT DISTINCT `Sub-channel`
FROM pharma;

SELECT DISTINCT `Product Class`
FROM pharma;

SELECT DISTINCT `Product Name`
FROM pharma;

UPDATE pharma
SET `Product Class` = 'Antipyretics'
WHERE `Product Class` = 'Antipiretics';


-- Checking for inconsistencies in medication names
SELECT 
    SOUNDEX(`Product Name`) AS sound_group,
    GROUP_CONCAT(DISTINCT `Product Name` ORDER BY `Product Name` SEPARATOR ' | ') AS product_names,
    COUNT(DISTINCT `Product Name`) AS different_names
FROM pharma
GROUP BY SOUNDEX(`Product Name`)
HAVING COUNT(DISTINCT `Product Name`) > 1
ORDER BY different_names DESC;

UPDATE pharma
SET `Product Name` = 'Thalidomide'
WHERE `Product Name` IN ( 'Tetalamide', ' Thalilamide');

SELECT `Product Class`
FROM pharma
WHERE `Product Name` = 'Thalidomide';

UPDATE pharma
SET `Product Class` = 'Immunomodulatory'
WHERE `Product Name` = 'Thalidomide';

-- Checking for Outliers
SELECT MIN(Price), MIN(Quantity), 
		AVG(Price), AVG(Quantity), 
        MAX(Price), MAX(Quantity)
FROM pharma;

-- Ensuring each drug is consistently assigned to the appropriate class
SELECT
    `Product Name`,
    COUNT(DISTINCT `Product Class`) AS class_count,
    GROUP_CONCAT(DISTINCT `Product Class` SEPARATOR ' | ') AS classes
FROM pharma
GROUP BY `Product Name`
HAVING COUNT(DISTINCT `Product Class`) > 1;

-- Checking for zero values
SELECT *
FROM pharma
WHERE Quantity = 0
   OR Price = 0
   OR Sales = 0;
   
   -- Ensuring City is consistently assigned to same country
   SELECT
    City,
    COUNT(DISTINCT Country) AS country_count,
    GROUP_CONCAT(DISTINCT Country SEPARATOR ' | ') AS countries
FROM pharma
GROUP BY City
HAVING COUNT(DISTINCT Country) > 1;

-- Longitutde and Latitude consistency
SELECT
    COUNT(*) AS total_rows,
    SUM(Latitude IS NULL OR Longitude IS NULL) AS missing_coordinates,
    SUM(Latitude = 0 AND Longitude = 0) AS zero_coordinates
FROM pharma;

-- Finding our incorrect sales calcultions
SELECT *
FROM pharma
WHERE Sales <> (Quantity * Price);

-- Rectifying incorrect sales calcultions
UPDATE pharma
SET Sales = Quantity * Price
WHERE Sales <> (Quantity * Price);

-- Ensuring each customer is consistenc=tly asi=signed to their respective city&country
SELECT `Customer Name`,
			COUNT(DISTINCT Country) AS country_count,
            COUNT(DISTINCT City) AS city_count
FROM pharma
GROUP BY `Customer Name`
HAVING COUNT(DISTINCT Country)>1 OR
		COUNT(DISTINCT City) >1;

            
-- Ensuring each sales rep is consistently assigned the same team and manager
SELECT `Name of Sales Rep`,
	COUNT(DISTINCT `Sales Team`),
    COUNT(DISTINCT Manager)
FROM pharma
GROUP BY `Name of Sales Rep`
HAVING COUNT(DISTINCT `Sales Team`) >1 OR
    COUNT(DISTINCT Manager)>1;
    
    SELECT
    SUM(Sales) AS total_sales,
    AVG(Sales) AS average_sales,
    MIN(Sales) AS minimum_sales,
    MAX(Sales) AS maximum_sales,
    SUM(Quantity) AS total_quantity
FROM pharma;

UPDATE pharma
SET Latitude = ROUND(Latitude, 6),
    Longitude = ROUND(Longitude, 6)

