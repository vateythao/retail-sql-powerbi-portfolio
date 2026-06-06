# Retail SQL Server and Power BI Portfolio Project

## Project Overview

This project demonstrates a local data analytics workflow using SQL Server Express, SQL Server Management Studio, Excel/CSV files, and Power BI Desktop. The goal of the project was to practice importing retail business data, cleaning and reshaping it, building SQL staging tables, creating clean reporting tables, writing SQL views, and designing a beginner Power BI dashboard.

This version does not include raw business data, cleaned data files, Power BI files, or screenshots because the original files may contain private business information.

## Tools Used

* SQL Server Express
* SQL Server Management Studio
* Excel / CSV
* Power Query
* Power BI Desktop
* Windows local development environment

## Database

Database name:

```sql
RetailPortfolio
```

Local SQL Server connection:

```text
localhost\SQLEXPRESS
```

## SQL Workflow

The project followed this workflow:

1. Created a local SQL Server database.
2. Imported raw CSV data into staging tables.
3. Cleaned product and sales data into reporting tables.
4. Checked data quality issues such as missing names, missing categories, zero prices, missing costs, and unusual inventory quantities.
5. Created SQL views for reporting and Power BI.
6. Connected Power BI Desktop to SQL Server.
7. Built dashboard visuals for sales and product data quality.

## Main SQL Objects

Staging tables:

```sql
stg_products
stg_daily_sales_summary
```

Clean tables:

```sql
Products
DailySalesSummary
```

Reporting views:

```sql
vw_product_catalog
vw_daily_sales_summary
vw_monthly_sales
vw_sales_kpi_daily
```

## Portfolio Skills Demonstrated

* SQL Server database setup
* CSV import into SQL Server
* Staging table workflow
* Data cleaning with SQL
* Data profiling and quality checks
* SQL views for reporting
* Power BI connection to SQL Server
* Dashboard design
* Project folder organization
* Data privacy awareness

## Privacy Note

The original dataset came from a private practice scenario. Raw data, cleaned data, Power BI files, and screenshots are excluded from this public version to protect sensitive business information.

A future version of this project can include anonymized or synthetic sample data for public demonstration.
