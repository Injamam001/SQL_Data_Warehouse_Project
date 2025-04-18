# Data Warehouse & Analytics Framework

This project implements a **Medallion Architecture** (Bronze, Silver, Gold layers) for a data warehouse designed to handle large-scale data ingestion, transformation, and reporting. The primary data sources are **CRM** and **ERP** systems, allowing for the seamless integration of customer and business operations data. This architecture enhances data quality, scalability, and efficiency in data analysis and reporting by organizing data into different layers.

## 📖 Project Overview

This project involves:

- **Data Architecture**: Designing a Modern Data Warehouse using the Medallion Architecture with Bronze, Silver, and Gold layers.
- **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
- **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
- **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

## 🔗 Necessary Links

#### 🖥️ SSMS (SQL Server Management Studio)

- [📦 Bronze Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/bronze_layer) – Raw data ingestion and staging logic  
- [✨ Silver Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/silver_layer) – Cleansing and transformation queries  
- [🥇 Gold Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/gold_layer) – Business-ready aggregations and analytics
- [🧹 Data Cleaning Scripts](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/quality_check/quality_check_for_loading_data_into_silver_layer.sql) – Standardization, null handling, deduplication, formatting fixes, etc.

#### 🐬 MySQL Workbench

- [📦 Bronze Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/bronze_layer) – Raw data ingestion and staging logic  
- [✨ Silver Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/silver_layer) – Cleansing and transformation queries  
- [🥇 Gold Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/gold_layer) – Business-ready aggregations and analytics
- [🧹 Data Cleaning Scripts](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/sql_scripts_mysql/bronze_layer/data_cleaning_bronze.sql) – Standardization, null handling, deduplication, formatting fixes, etc.


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
  
  <img src="https://raw.githubusercontent.com/Injamam001/SQL_Data_Warehouse_Project/main/docs/Medallion_Data_Architecture.png" alt="Medallion Data Architecture" style="width:90%; height:500px;"/>


---

### Data Flow Diagram
![Data Flow](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/data_flow_diagram.png)

---

### Data Integration Diagram
![Data Flow](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/data_integration.png)


---

### Star Schema
![Star Schema](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/star_schema_gold_layer.png)

---
### ⭐ Key Features
- **CRM and ERP Data Integration**: The project integrates data from Customer Relationship Management (CRM) and Enterprise Resource Planning (ERP) systems.
- **ETL Pipelines**: Automated pipelines to load, clean, and transform data into the Medallion Architecture.
- **Stored Procedures**: SQL stored procedures manage data processing across the three layers.
- **Error Handling**: Built-in error handling using `TRY...CATCH` in SQL for logging errors during ETL operations.
- **Scalable Design**: Optimized for handling large datasets and efficient querying.
---

### 🛠️ Technologies Used:
- **SQL Server**: Database management system for handling data.
- **MySQL Workbench**: Used for developing and executing SQL-based ETL logic to load and manage data within the data warehouse.
- **SQL Server Management Studio (SSMS)**: Used for developing and executing SQL-based ETL logic to load and manage data within the data warehouse.
- **ETL (Extract, Transform, Load)**: Processes for data ingestion and transformation.
- **Git**: Version control for managing the project.
- **draw.io**: Used for creating architectural diagrams.

---



