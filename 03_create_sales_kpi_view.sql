USE RetailPortfolio;
GO

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

SELECT *
FROM vw_monthly_sales;