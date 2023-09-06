--1. Introduction to The World Bank's international debt dataset
--SELECT all of the columns from the international_debt table. 
--Also limit the output to the first ten rows to keep the output clean.
SELECT * FROM international_debt 
LIMIT 10;

--2. Determining the unique count of countries in the dataset
--Extract the number of unique countries present in the table.
SELECT 
    COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

--3. Identifying distinct debt indicators
-- Areas in which a country can possibly be indebted to
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators;

--4. Calculating the cumulative debt shouldered by the listed countries
-- Find out the total amount of debt (in USD) that is owed by the different countries
SELECT 
    ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM international_debt; 

--5. Pinpointing the country burdened with the most debt
-- Find out the country that owns the highest amount of debt along with the amount
SELECT 
    country_name, 
    SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC 
LIMIT 1;

--6. Computing the average debt, categorized by different indicators
-- Find out on an average how much debt a country owes
SELECT 
    indicator_code  AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

--7. Highlighting the pinnacle of principal repayments
-- Find out which country owes the highest amount of debt in the category of long term debts (DT.AMT.DLXF.CD)
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt
             WHERE indicator_code='DT.AMT.DLXF.CD');
			 
--8. Unearthing the most prevalent debt indicator
-- What is the most common indicator in which the countries owe their debt
SELECT 
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

--9. Delving into other pertinent debt issues and wrapping up with conclusions
-- take a look at debt owed by countries across the globe. 
-- Extract a few summary statistics from the data and unravel some interesting facts and figures
SELECT 
    country_name, 
    MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;