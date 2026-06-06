USE RetailPortfolio;
GO

/*
Step 1: Fix imported column name if needed.
The CSV column was accidentally imported as matric_name instead of metric_name.
*/

IF COL_LENGTH('stg_daily_sales_summary', 'matric_name') IS NOT NULL
BEGIN
    EXEC sp_rename 
        'stg_daily_sales_summary.matric_name',
        'metric_name',
        'COLUMN';
END;
GO


/*
Step 2: Create clean DailySalesSummary table from staging table.
*/

DROP TABLE IF EXISTS DailySalesSummary;
GO

SELECT
    sales_date AS SalesDate,
    metric_name AS MetricName,
    CAST(amount AS DECIMAL(12, 2)) AS Amount
INTO DailySalesSummary
FROM stg_daily_sales_summary;
GO


/*
Step 3: Create daily sales reporting view.
This turns sales metrics into report-friendly columns.
*/

CREATE OR ALTER VIEW vw_daily_sales_summary AS
SELECT
    SalesDate,

    SUM(CASE WHEN MetricName = 'Gross sales' THEN Amount ELSE 0 END) AS GrossSales,
    SUM(CASE WHEN MetricName = 'Net sales' THEN Amount ELSE 0 END) AS NetSales,
    SUM(CASE WHEN MetricName = 'Refunds' THEN Amount ELSE 0 END) AS Refunds,
    SUM(CASE WHEN MetricName = 'Taxes expected' THEN Amount ELSE 0 END) AS TaxesExpected,
    SUM(CASE WHEN MetricName = 'Taxes collected' THEN Amount ELSE 0 END) AS TaxesCollected,
    SUM(CASE WHEN MetricName = 'Tips' THEN Amount ELSE 0 END) AS Tips,
    SUM(CASE WHEN MetricName = 'Amount collected' THEN Amount ELSE 0 END) AS AmountCollected,
    SUM(CASE WHEN MetricName = 'Overpayments' THEN Amount ELSE 0 END) AS Overpayments,
    SUM(CASE WHEN MetricName = 'Unpaid balance' THEN Amount ELSE 0 END) AS UnpaidBalance
FROM DailySalesSummary
GROUP BY SalesDate;
GO


/*
Step 4: Create monthly sales reporting view.
*/

CREATE OR ALTER VIEW vw_monthly_sales AS
SELECT
    YEAR(SalesDate) AS SalesYear,
    MONTH(SalesDate) AS SalesMonth,
    DATENAME(MONTH, SalesDate) AS SalesMonthName,

    SUM(GrossSales) AS TotalGrossSales,
    SUM(NetSales) AS TotalNetSales,
    SUM(Refunds) AS TotalRefunds,
    SUM(TaxesCollected) AS TotalTaxesCollected,
    SUM(Tips) AS TotalTips,
    SUM(AmountCollected) AS TotalAmountCollected,
    SUM(UnpaidBalance) AS TotalUnpaidBalance,

    COUNT(*) AS NumberOfSalesDays
FROM vw_daily_sales_summary
GROUP BY
    YEAR(SalesDate),
    MONTH(SalesDate),
    DATENAME(MONTH, SalesDate);
GO


/*
Step 5: Preview results.
*/

SELECT *
FROM vw_monthly_sales;
