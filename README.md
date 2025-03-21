# Data Warehouse & Analytics Framework

### 📝 Overview
This project implements a **Medallion Architecture** (Bronze, Silver, Gold layers) for a data warehouse designed to handle large-scale data ingestion, transformation, and reporting. The primary data sources are **CRM** and **ERP** systems, allowing for the seamless integration of customer and business operations data. This architecture enhances data quality, scalability, and efficiency in data analysis and reporting by organizing data into different layers.

The system leverages **SQL Server** as the core database technology and follows best practices in data warehousing and ETL (Extract, Transform, Load) processes. It allows users to transform raw data into enriched data that is ready for business intelligence (BI) reporting.

---

### 🏛️Medallion Architecture

1. **Bronze Layer**:
   - **Purpose**: Raw data storage.
   - **Data Source**: CRM and ERP systems.
   - **Data Transformation**: No transformation, data is ingested in its raw form.
   - **Objective**: To preserve raw data for auditing, lineage tracking, and troubleshooting.
   - **ETL Process**: Data is ingested directly using `BULK INSERT` with no processing. This layer serves as a foundation for further transformation.

2. **Silver Layer**:
   - **Purpose**: Clean and structured data for further processing.
   - **Data Source**: Processed data from the Bronze layer.
   - **Data Transformation**: Deduplication, data type conversions, and validation of business rules.
   - **Objective**: To provide cleansed and reliable data for business analysis. It handles data quality improvements.
   - **ETL Process**: The data is cleaned, transformed, and enriched using SQL stored procedures, with error handling mechanisms in place (`TRY...CATCH`).

3. **Gold Layer**:
   - **Purpose**: Aggregated and refined data for reporting and business intelligence.
   - **Data Source**: Transformed data from the Silver layer.
   - **Data Transformation**: Aggregation, calculations (such as totals, averages), and any additional transformations needed for reporting.
   - **Objective**: To deliver business-ready data used in dashboards, reports, and analytics.
   - **ETL Process**: Business metrics, KPIs, and other calculated data are processed here for ready-to-use reporting.
  
  

---

### ⭐ Key Features
- **CRM and ERP Data Integration**: The project integrates data from Customer Relationship Management (CRM) and Enterprise Resource Planning (ERP) systems.
- **ETL Pipelines**: Automated pipelines to load, clean, and transform data into the Medallion Architecture.
- **Stored Procedures**: SQL stored procedures manage data processing across the three layers.
- **Error Handling**: Built-in error handling using `TRY...CATCH` in SQL for logging errors during ETL operations.
- **Scalable Design**: Optimized for handling large datasets and efficient querying.
---

### 🛠️ Technologies Used:
- **SQL Server** (SSMS) for database management and querying.
- **T-SQL** for writing stored procedures, data transformation, and aggregation.
- **BULK INSERT** for high-performance data ingestion into the Bronze layer.
- **Stored Procedures** for defining ETL processes and transformations in the Silver and Gold layers.

---



