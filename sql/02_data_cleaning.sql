-- ============================================================
-- Marketing Campaign Performance Analytics
-- Data Cleaning & Quality Checks
-- Author: Dorothy Korantema Adu
-- ============================================================

-- 1. Check the total number of customer records
SELECT COUNT(*) AS TotalCustomers
FROM marketing_campaign;


-- 2. Check for missing values in the original dataset
SELECT
    COUNT(*) FILTER (WHERE ID IS NULL) AS MissingID,
    COUNT(*) FILTER (WHERE Year_Birth IS NULL) AS MissingYearBirth,
    COUNT(*) FILTER (WHERE Income IS NULL) AS MissingIncome,
    COUNT(*) FILTER (WHERE Education IS NULL) AS MissingEducation,
    COUNT(*) FILTER (WHERE Marital_Status IS NULL) AS MissingMaritalStatus,
    COUNT(*) FILTER (WHERE Recency IS NULL) AS MissingRecency
FROM marketing_campaign;


-- 3. Review customer spending data
-- Check the individual product spending fields
SELECT
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds
FROM marketing_campaign
LIMIT 10;


-- 4. Review campaign response values
-- Response should contain binary values:
-- 0 = Did not respond
-- 1 = Responded

SELECT
    Response,
    COUNT(*) AS Customers
FROM marketing_campaign
GROUP BY Response
ORDER BY Response;
