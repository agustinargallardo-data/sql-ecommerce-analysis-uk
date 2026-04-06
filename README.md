#  UK Ecommerce Data Analysis & ETL Pipeline

##  Project Overview
This project demonstrates a complete **End-to-End Data Engineering and Analytics** workflow. I transformed a raw dataset of over 500,000 retail transactions into a high-quality, structured database using **SQL** in **Google BigQuery**.

The goal was to clean the data and extract core business KPIs to understand the company's financial health and customer base.

## Tech Stack
* **Cloud Platform:** Google Cloud (BigQuery)
* **Language:** SQL (Standard SQL)
* **Skills:** ETL, Data Cleaning, Feature Engineering, Business Intelligence.

## The ETL Process (Data Cleaning)
Raw data is never perfect. I implemented the following rules to ensure 100% data integrity:
1.  **Identity Verification:** Removed all records with missing `CustomerID` to ensure accurate customer-centric analysis.
2.  **Transaction Sanitization:** Filtered out negative quantities and unit prices (errors) and excluded invoices starting with 'C' (cancellations).
3.  **Schema Standardization:** Converted string dates into proper `DATETIME` formats and casted IDs to `STRING` to optimize storage and querying.
4.  **Metric Creation:** Calculated `line_total` for every transaction to provide instant revenue insights.

## Key Business Performance Indicators (KPIs)
After running the cleaning pipeline, the final high-quality dataset yielded the following results:

| Metric | Result |
| :--- | :--- |
| **Processed Transactions** | 397,884 |
| **Gross Revenue** | $8,911,407.90 |
| **Unique Active Customers** | 4,338 |
| **Average Ticket (AOV)** | $22.40 |

## Conclusion
The cleaning process successfully reduced noise in the data, providing a solid foundation for further Machine Learning models (like Customer Segmentation or Churn Prediction). This project proves the ability to handle large cloud datasets and deliver clean, actionable business numbers.

### Live Dashboard
You can interact with the real-time dashboard created for this project here:
[https://lookerstudio.google.com/reporting/3c152152-1ff5-492e-b0d4-821b48adad5a]
