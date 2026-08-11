-- ============================================================
-- Marketing Campaign Performance Analytics
-- Database Setup Script
-- Author: Dorothy Korantema Adu
-- ============================================================

-- Purpose:
-- Create the marketing_campaign table used to analyse
-- customer demographics, purchasing behaviour and
-- marketing campaign performance.

CREATE TABLE marketing_campaign (
    ID INTEGER,
    Year_Birth INTEGER,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income INTEGER,
    Kidhome INTEGER,
    Teenhome INTEGER,
    Dt_Customer DATE,
    Recency INTEGER,

    -- Customer spending by product category
    MntWines INTEGER,
    MntFruits INTEGER,
    MntMeatProducts INTEGER,
    MntFishProducts INTEGER,
    MntSweetProducts INTEGER,
    MntGoldProds INTEGER,

    -- Purchase behaviour
    NumDealsPurchases INTEGER,
    NumWebPurchases INTEGER,
    NumCatalogPurchases INTEGER,
    NumStorePurchases INTEGER,
    NumWebVisitsMonth INTEGER,

    -- Previous campaign responses
    AcceptedCmp1 INTEGER,
    AcceptedCmp2 INTEGER,
    AcceptedCmp3 INTEGER,
    AcceptedCmp4 INTEGER,
    AcceptedCmp5 INTEGER,

    -- Current campaign response
    Response INTEGER,

    -- Customer complaint indicator
    Complain INTEGER
);
