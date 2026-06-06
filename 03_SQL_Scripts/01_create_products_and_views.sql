USE RetailPortfolio;
GO

/* 
Step 1: Create clean Products table from raw staging table.
This removes blank product rows and keeps useful reporting columns.
*/

DROP TABLE IF EXISTS Products;
GO

SELECT
    Clover_ID,
    [Name] AS ProductName,
    Price,
    Price_Type,
    Cost,
    Quantity,
    Categories AS Category,
    Tax_Rates AS TaxRates,
    Hidden
INTO Products
FROM stg_products
WHERE NULLIF(LTRIM(RTRIM([Name])), '') IS NOT NULL;
GO


/*
Step 2: Create product catalog reporting view.
This view adds data-quality labels for Power BI reporting.
*/

CREATE OR ALTER VIEW vw_product_catalog AS
SELECT
    Clover_ID,
    ProductName,
    Price,
    Category,
    TaxRates,
    Hidden,

    CASE
        WHEN Price IS NULL THEN 'Missing Price'
        WHEN Price = 0 THEN 'Zero Price'
        WHEN Price > 0 THEN 'Has Price'
        ELSE 'Check Price'
    END AS PriceStatus,

    CASE
        WHEN Category IS NULL OR LTRIM(RTRIM(Category)) = '' THEN 'Missing Category'
        ELSE 'Has Category'
    END AS CategoryStatus,

    CASE
        WHEN Quantity IS NULL THEN 'Missing Quantity'
        WHEN Quantity < 0 THEN 'Negative Quantity - Needs Review'
        WHEN Quantity = 0 THEN 'Zero Quantity'
        WHEN Quantity > 0 THEN 'Positive Quantity'
        ELSE 'Check Quantity'
    END AS QuantityStatus
FROM Products;
GO


/*
Step 3: Preview the reporting view.
*/

SELECT TOP 20 *
FROM vw_product_catalog
ORDER BY ProductName;
