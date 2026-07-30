-- Marketing Campaign Performance Analytics
-- Database Setup Script
-- Author: Dorothy Korantema Adu

-- Create marketing_campaign table

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
    MntWines INTEGER,
    MntFruits INTEGER,
    MntMeatProducts INTEGER,
    MntFishProducts INTEGER,
    MntSweetProducts INTEGER,
    MntGoldProds INTEGER,
    NumDealsPurchases INTEGER,
    NumWebPurchases INTEGER,
    NumCatalogPurchases INTEGER,
    NumStorePurchases INTEGER,
    NumWebVisitsMonth INTEGER,
    AcceptedCmp1 INTEGER,
    AcceptedCmp2 INTEGER,
    AcceptedCmp3 INTEGER,
    AcceptedCmp4 INTEGER,
    AcceptedCmp5 INTEGER,
    Response INTEGER,
    Complain INTEGER
);
