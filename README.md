# 📦 Data Warehouse & Analytics Framework



This project implements a **Medallion** Architecture-based Data Warehouse using MySQL and SSMS. It focuses on data ingestion, cleansing, transformation, and modeling to support advanced analytics and business intelligence. The primary data sources are **CRM** and **ERP** systems, allowing for the seamless integration of customer and business operations data. This architecture enhances data quality, scalability, and efficiency in data analysis and reporting by organizing data into different layers.


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



## 💡 Objectives
- Establish a scalable, modular data warehouse  
- Enable business-ready analytics  
- Improve data quality and consistency  
- Support BI dashboards and reporting  


## 🧱 Architecture Overview
This project is based on the **Medallion Architecture**, consisting of three layers:

- **Bronze Layer**: Handles raw data ingestion from CRM, ERP, and external systems.
- **Silver Layer**: Processes and transforms raw data, applying business rules and validations. 
- **Gold Layer**: Aggregates and models data into fact and dimension tables for reporting.
  

> 📌 Click [**here**](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/Medallion_Data_Architecture.png) to see the architecture diagram.



## ⚙️ ETL Pipeline Description

This project implements a structured ETL (Extract, Transform, Load) pipeline following the Medallion Architecture. Raw data from CRM and ERP systems is ingested into the Bronze Layer, cleaned and standardized in the Silver Layer, and finally transformed into business-ready dimensional models in the Gold Layer. **ETL** methods and techniques used in this project are listed below:

#### 📥Extraction 

- **Method:** Pull Extraction

- **Type:** Full Extraction

- **Technique:** File Parsing
  

#### 🔄Transformation

- Data enrichment
- Data standardization and normalization
- Data integration
- Business rules and logic
- Derived columns
- Data aggregations

#### 📤Load 

- **Processing type:** Batch Processing

- **Method:** Full Load (Truncate & Insert)

- **Slowly Changing Dimension (SCD):** SCD Type 1 (Overwrite)


## 🛠️ Technologies Used

- **MySQL Workbench** – SQL-based ETL logic and transformations  
- **SSMS (SQL Server Management Studio)** – SQL-based ETL logic and transformations 
- **GitHub** – Version control and collaboration  
- **draw.io**: Used for creating architectural diagrams.



### 📊 Data Modeling
The project uses a Star Schema model:

- **Fact Table**: Sales
- **Dimension Tables**: Customer, Product


> ⭐ Click [**here**](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/star_schema_gold_layer.png) to see the star schema model.




## 🔗 Necessary Links

#### 🖥️ SSMS (SQL Server Management Studio)

- [📦 Bronze Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/bronze_layer) – Raw data ingestion and staging logic  
- [✨ Silver Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/silver_layer) – Cleansing and transformation queries  
- [🥇 Gold Layer Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts/gold_layer) – Business-ready aggregations and analytics
- [🧹 Data Cleaning Scripts (SSMS)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/quality_check/quality_check_for_loading_data_into_silver_layer.sql) – Standardization, null handling, deduplication, formatting fixes, etc.

#### 🐬 MySQL Workbench

- [📦 Bronze Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/bronze_layer) – Raw data ingestion and staging logic  
- [✨ Silver Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/silver_layer) – Cleansing and transformation queries  
- [🥇 Gold Layer Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/sql_scripts_mysql/gold_layer) – Business-ready aggregations and analytics
- [🧹 Data Cleaning Scripts (MySQL)](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/sql_scripts_mysql/bronze_layer/data_cleaning_bronze.sql) – Standardization, null handling, deduplication, formatting fixes, etc.


#### 🗂️ Datasets
- [📊 CRM Dataset](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/datasets/source_crm)
- [📂 ERP Dataset](https://github.com/Injamam001/SQL_Data_Warehouse_Project/tree/main/datasets/source_erp)

#### 🖼️ Diagrams

- 🧱 [Medallion Architecture Diagram](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/Medallion_Data_Architecture.png)
- 📊 [Data Flow Diagram](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/data_flow_diagram.png) 
- 🔄 [Data Integration Diagram](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/data_integration.png)  
- ⭐ [Star Schema Diagram](https://github.com/Injamam001/SQL_Data_Warehouse_Project/blob/main/docs/star_schema_gold_layer.png)

## Features

- 📊 Cleaned and structured data layers
- 🧱 Medallion architecture design
- ⚙️ Automated ETL/ELT pipelines
- 🔍 Optimized for reporting and analytics


## 🚀 How to Run / Deployment Instructions
1. Clone this repo  
2. Load SQL scripts in MySQL Workbench or SSMS  
3. Execute scripts layer-by-layer (Bronze → Silver → Gold)  
4. Load data into reporting tools (optional) 


## 📬 Contact

<a href="https://www.linkedin.com/in/i-haque/" style="text-decoration: none;">
  <img src="https://github.com/user-attachments/assets/5be0fbc4-7983-4862-a1b8-30c5b79f8df5" width="30" height="30" alt="LinkedIn" style="vertical-align: middle;">
</a>

*Feel free to connect with me for any queries!*







## 📄 License
[MIT License](LICENSE)




