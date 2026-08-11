-- ============================================================
-- Marketing Campaign Performance Analytics
-- Business Analysis Queries
-- Author: Dorothy Korantema Adu
-- ============================================================


-- ============================================================
-- 1. Overall Customer & Campaign Performance
-- ============================================================

-- Total customers, responders and campaign response rate

SELECT
    COUNT(*) AS Customers,
    COUNT(*) FILTER (WHERE Response = 1) AS Responders,
    ROUND(
        COUNT(*) FILTER (WHERE Response = 1) * 100.0 / COUNT(*),
        2
    ) AS ResponseRate
FROM marketing_campaign;


-- ============================================================
-- 2. Customer Segmentation
-- ============================================================

-- Number of customers and total spending by customer segment

SELECT
    CustomerSegment,
    COUNT(*) AS Customers,
    SUM(TotalSpend) AS TotalSpend,
    ROUND(AVG(TotalSpend), 2) AS AverageSpend
FROM marketing_campaign
GROUP BY CustomerSegment
ORDER BY TotalSpend DESC;


-- ============================================================
-- 3. Campaign Performance by Customer Segment
-- ============================================================

-- Compare campaign response across customer value segments

SELECT
    CustomerSegment,
    COUNT(*) AS Customers,
    COUNT(*) FILTER (WHERE Response = 1) AS Responders,
    ROUND(
        COUNT(*) FILTER (WHERE Response = 1) * 100.0 / COUNT(*),
        2
    ) AS ResponseRate
FROM marketing_campaign
GROUP BY CustomerSegment
ORDER BY ResponseRate DESC;


-- ============================================================
-- 4. Spending by Product Category
-- ============================================================

-- Identify the product categories generating the highest
-- customer spending

SELECT
    SUM(MntWines) AS WineSpend,
    SUM(MntFruits) AS FruitSpend,
    SUM(MntMeatProducts) AS MeatSpend,
    SUM(MntFishProducts) AS FishSpend,
    SUM(MntSweetProducts) AS SweetSpend,
    SUM(MntGoldProds) AS GoldSpend
FROM marketing_campaign;


-- ============================================================
-- 5. Purchase Channel Analysis
-- ============================================================

-- Compare customer purchasing behaviour across channels

SELECT
    SUM(NumWebPurchases) AS WebPurchases,
    SUM(NumCatalogPurchases) AS CatalogPurchases,
    SUM(NumStorePurchases) AS StorePurchases
FROM marketing_campaign;


-- ============================================================
-- 6. Customer Demographic Analysis
-- ============================================================

-- Analyse average spending by age group

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 44 THEN '30-44'
        WHEN Age BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60+'
    END AS AgeGroup,
    COUNT(*) AS Customers,
    ROUND(AVG(TotalSpend), 2) AS AverageSpend
FROM marketing_campaign
GROUP BY AgeGroup
ORDER BY AverageSpend DESC;


-- ============================================================
-- 7. Campaign Response & Customer Spending
-- ============================================================

-- Compare spending behaviour between campaign responders
-- and non-responders

SELECT
    CampaignOutcome,
    COUNT(*) AS Customers,
    ROUND(AVG(TotalSpend), 2) AS AverageSpend,
    SUM(TotalSpend) AS TotalSpend
FROM marketing_campaign
GROUP BY CampaignOutcome
ORDER BY AverageSpend DESC;


-- ============================================================
-- 8. Top 10 Highest-Spending Customers
-- ============================================================

SELECT
    ID,
    Age,
    Income,
    CustomerSegment,
    TotalSpend,
    CampaignOutcome
FROM marketing_campaign
ORDER BY TotalSpend DESC
LIMIT 10;


-- ============================================================
-- 9. Digital Engagement Analysis
-- ============================================================

-- Examine web visits and online purchases

SELECT
    ROUND(AVG(NumWebVisitsMonth), 2) AS AverageMonthlyWebVisits,
    ROUND(AVG(NumWebPurchases), 2) AS AverageWebPurchases
FROM marketing_campaign;


-- ============================================================
-- 10. Campaign Response by Purchase Channel
-- ============================================================

-- Compare purchasing behaviour between responders
-- and non-responders

SELECT
    CampaignOutcome,
    ROUND(AVG(NumWebPurchases), 2) AS AvgWebPurchases,
    ROUND(AVG(NumCatalogPurchases), 2) AS AvgCatalogPurchases,
    ROUND(AVG(NumStorePurchases), 2) AS AvgStorePurchases
FROM marketing_campaign
GROUP BY CampaignOutcome;
