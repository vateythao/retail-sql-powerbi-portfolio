# Retail SQL and Power BI Portfolio Project

This project demonstrates a beginner-to-intermediate data analytics workflow using SQL Server, SSMS, Excel/CSV files, and Power BI Desktop. The goal was to take raw retail store export files, clean and reshape the data, load it into a local SQL Server database, create reporting tables and SQL views, and build a Power BI dashboard for business insights.

The project database was created in SQL Server Express as `RetailPortfolio`. Raw product and sales files were imported into staging tables, then transformed into cleaner reporting tables and views. The product data was reviewed for missing names, missing categories, zero prices, missing costs, and unusual inventory quantity values. The sales report was reshaped from a wide Excel-style format into a SQL-friendly daily sales summary table.

Key outputs include SQL scripts, staging tables, cleaned tables, reporting views, data-quality checks, and a Power BI dashboard. The dashboard includes monthly sales KPI cards, a daily net sales trend chart, sales by day of week, product price status, and product category status.

Sensitive business information should be anonymized before publishing this project publicly.
