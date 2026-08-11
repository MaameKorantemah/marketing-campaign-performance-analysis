-- ============================================================
-- Marketing Campaign Performance Analytics
-- Feature Engineering
-- Author: Dorothy Korantema Adu
-- ============================================================

-- 1. Add Age column
ALTER TABLE marketing_campaign
ADD COLUMN Age INTEGER;


-- Calculate customer age using a fixed 2025 analysis year
-- to ensure reproducibility of the analysis
UPDATE marketing_campaign
SET Age = 2025 - Year_Birth;

-- 2. Add TotalChildren column
ALTER TABLE marketing_campaign
ADD COLUMN TotalChildren INTEGER;


-- Calculate total children in the household
UPDATE marketing_campaign
SET TotalChildren = Kidhome + Teenhome;


-- 3. Add TotalSpend column
ALTER TABLE marketing_campaign
ADD COLUMN TotalSpend INTEGER;


-- Calculate total customer spending across product categories
UPDATE marketing_campaign
SET TotalSpend =
    MntWines
    + MntFruits
    + MntMeatProducts
    + MntFishProducts
    + MntSweetProducts
    + MntGoldProds;


-- 4. Add CustomerSegment column
ALTER TABLE marketing_campaign
ADD COLUMN CustomerSegment VARCHAR(50);


-- Segment customers based on total spending
UPDATE marketing_campaign
SET CustomerSegment =
    CASE
        WHEN TotalSpend BETWEEN 5 AND 499 THEN 'Low Value'
        WHEN TotalSpend BETWEEN 500 AND 999 THEN 'Medium Value'
        WHEN TotalSpend >= 1000 THEN 'High Value'
        ELSE 'Unknown'
    END;


-- 5. Add CampaignOutcome column
ALTER TABLE marketing_campaign
ADD COLUMN CampaignOutcome VARCHAR(50);


-- Convert campaign response values into meaningful labels
UPDATE marketing_campaign
SET CampaignOutcome =
    CASE
        WHEN Response = 1 THEN 'Responded'
        WHEN Response = 0 THEN 'Did not respond'
        ELSE 'Unknown'
    END;


-- 6. Validate the engineered fields
SELECT
    COUNT(*) FILTER (WHERE Age IS NULL) AS MissingAge,
    COUNT(*) FILTER (WHERE TotalChildren IS NULL) AS MissingChildren,
    COUNT(*) FILTER (WHERE TotalSpend IS NULL) AS MissingSpend,
    COUNT(*) FILTER (WHERE CustomerSegment IS NULL) AS MissingSegment,
    COUNT(*) FILTER (WHERE CampaignOutcome IS NULL) AS MissingOutcome
FROM marketing_campaign;
