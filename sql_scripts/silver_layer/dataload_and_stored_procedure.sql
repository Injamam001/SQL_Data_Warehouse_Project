/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/


CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN 

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	
	BEGIN TRY
		/*
		CRM Table
		=================================
		Table 1: silver.crm_cust_info
		=================================
		*/
		SET @batch_start_time = GETDATE();
		SET @start_time = GETDATE();

		TRUNCATE TABLE silver.crm_cust_info;
		INSERT INTO silver.crm_cust_info (
			cst_id,
			cst_key,
			cst_firstname,
			cst_lastname,
			cst_marital_status,
			cst_gndr,
			cst_create_date
		)

		SELECT 
			cst_id,
			cst_key,
			TRIM(cst_firstname) AS cst_firstname,
			TRIM(cst_lastname) AS cst_lastname,
		
			CASE 
				WHEN cst_marital_status = 'S' THEN 'Single'
				WHEN cst_marital_status = 'M' THEN 'Married'
				ELSE 'n/a'
			END AS cst_marital_status,

			CASE 
				WHEN cst_gndr = 'F' THEN 'Female'
				WHEN cst_marital_status = 'M' THEN 'Male'
				ELSE 'n/a'
			END AS cst_gndr,

			cst_create_date

		FROM 
			(

			SELECT *,
				ROW_NUMBER()OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS row_num
			FROM bronze.crm_cust_info) as t
			WHERE row_num = 1 AND cst_id IS NOT NULL;
			
			SET @end_time = GETDATE();
			PRINT '----------------------------'
			PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'
		/*
		CRM Table
		=================================
		Table 2: silver.crm_prd_info
		=================================
		*/

		SET @start_time = GETDATE();

		TRUNCATE TABLE silver.crm_prd_info;
		INSERT INTO silver.crm_prd_info (
			prd_id,
			cat_id,
			prd_key,
			prd_nm,
			prd_cost,
			prd_line,
			prd_start_dt,
			prd_end_dt
			)

		SELECT 
			prd_id,
			REPLACE(TRIM(SUBSTRING(prd_key,1,5)),'-','_') AS cat_id, -- extract category id
			TRIM(SUBSTRING(prd_key,7,LEN(prd_key))) AS prd_key, -- extract product key
			prd_nm,
			ISNULL(prd_cost,0) AS prd_cost,

			CASE 
				WHEN prd_line = 'M' THEN 'Mountain'
				WHEN prd_line = 'R' THEN 'Road'
				WHEN prd_line = 'S' THEN 'Other Sales'
				WHEN prd_line = 'T' THEN 'Touring'
				ELSE 'n/a'
			END AS prd_line,

			CAST(prd_start_dt AS DATE) AS prd_start_dt,
			CAST(LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS DATE) AS prd_end_dt
		FROM bronze.crm_prd_info;

			SET @end_time = GETDATE();
			PRINT '----------------------------'
			PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'
		/*
		CRM Table
		=================================
		Table 3: silver.crm_sales_details
		=================================
		*/

		SET @start_time = GETDATE();

		TRUNCATE TABLE silver.crm_sales_details;
		INSERT INTO silver.crm_sales_details (
			sls_ord_num,
			sls_prd_key,
			sls_cust_id,
			sls_order_dt,
			sls_ship_dt,
			sls_due_dt,
			sls_sales,
			sls_quantity,
			sls_price
			)

	
		SELECT * FROM (
			SELECT 
				sls_ord_num,
				sls_prd_key,
				sls_cust_id,
	
				CASE 
					WHEN LEN(sls_order_dt) !=8 THEN NULL
					ELSE CAST(CAST(sls_order_dt AS VARCHAR)AS DATE)
				END AS sls_order_dt,

				CAST(CAST(sls_ship_dt AS VARCHAR) AS DATE) AS sls_ship_dt,
				CAST(CAST(sls_due_dt AS VARCHAR) AS DATE) AS sls_due_dt,

				CASE 
					WHEN sls_sales != sls_quantity*sls_price OR sls_sales <=0 OR sls_sales IS NULL 
						THEN sls_quantity*ABS(sls_price)
					ELSE sls_sales
				END AS sls_sales,

				sls_quantity,

				CASE 
					WHEN sls_price != sls_sales/sls_quantity OR sls_price <=0 OR sls_price IS NULL 
						THEN ABS(sls_sales)/sls_quantity
					ELSE sls_price
				END AS sls_price
			FROM bronze.crm_sales_details) t where sls_sales = sls_price/sls_quantity

		UNION ALL

		SELECT
			sls_ord_num,
				sls_prd_key,
				sls_cust_id,
				sls_order_dt,
				sls_ship_dt,
				sls_due_dt,
				sls_sales,
				sls_quantity,
				sls_sales*sls_quantity AS sls_price
	
		FROM (
			SELECT 
				sls_ord_num,
				sls_prd_key,
				sls_cust_id,
	
				CASE 
					WHEN LEN(sls_order_dt) !=8 THEN NULL
					ELSE CAST(CAST(sls_order_dt AS VARCHAR)AS DATE)
				END AS sls_order_dt,

				CAST(CAST(sls_ship_dt AS VARCHAR) AS DATE) AS sls_ship_dt,
				CAST(CAST(sls_due_dt AS VARCHAR) AS DATE) AS sls_due_dt,

				CASE 
					WHEN sls_sales != sls_quantity*sls_price OR sls_sales <=0 OR sls_sales IS NULL 
						THEN sls_quantity*ABS(sls_price)
					ELSE sls_sales
				END AS sls_sales,

				sls_quantity,

				CASE 
					WHEN sls_price != sls_sales/sls_quantity OR sls_price <=0 OR sls_price IS NULL 
						THEN ABS(sls_sales)/sls_quantity
					ELSE sls_price
				END AS sls_price
			FROM bronze.crm_sales_details) t where sls_sales != sls_price/sls_quantity;



		SET @end_time = GETDATE();
		PRINT '----------------------------'
		PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'

		/*
		ERP Table
		=================================
		Table 4: silver.erp_cat_g1v2
		=================================
		*/

		SET @start_time = GETDATE();

		INSERT INTO silver.erp_cat_g1v2(
			id,
			cat,
			subcat,
			maintenance
		)
		SELECT 
			id,
			cat,
			subcat,
			maintenance
		FROM BRONZE.erp_cat_g1v2;
		SET @end_time = GETDATE();
		PRINT '----------------------------'
		PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'

		/*
		ERP Table
		=================================
		Table 5: silver.erp_cust_az12
		=================================
		*/

		SET @start_time = GETDATE();

		INSERT INTO silver.erp_cust_az12 (
			cid,
			bdate,
			gen
		)

		SELECT 
	
			CASE 
				WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
				ELSE cid
			END AS cid,

			CASE 
				WHEN bdate > GETDATE() THEN NULL
				ELSE bdate
			END AS bdate,

			CASE
				WHEN gen = 'M' OR UPPER(TRIM(gen)) = 'MALE' THEN 'Male'
				WHEN gen = 'F' OR UPPER(TRIM(gen)) = 'FEMALE' THEN 'Female'
				ELSE 'n/a'
			END AS gen
	
		FROM bronze.erp_cust_az12;

		SET @end_time = GETDATE();
		PRINT '----------------------------'
		PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'

		/*
		ERP Table
		=================================
		Table 6: silver.erp_loc_a101
		=================================
		*/

		SET @start_time = GETDATE();

		INSERT INTO silver.erp_loc_a101 (
			cid,
			cntry
		)
		SELECT 
			REPLACE(cid,'-','') AS cid,
			CASE 
				WHEN UPPER(TRIM(cntry)) = 'DE' THEN 'Germany'
				WHEN UPPER(TRIM(cntry)) LIKE 'US%' THEN 'United States'
				WHEN cntry IS NULL OR cntry = '' THEN 'n/a'
				ELSE cntry
			END AS cntry
		FROM bronze.erp_loc_a101;
		SET @end_time = GETDATE();
		PRINT '----------------------------'
		PRINT 'Load Duraton: '+ CAST(DATEDIFF(second,@start_time, @end_time) AS VARCHAR) + ' seconds'
	
		SET @batch_end_time = GETDATE();
		PRINT '----------------------------'
		PRINT 'Sliver Layer Loading is Completed'
		PRINT 'Total Loading Time ' + CAST(DATEDIFF(second,@batch_start_time, @batch_end_time) AS VARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
	PRINT '================================================'
	PRINT 'Error Occured During Loading Silver Layer';
	PRINT 'Error Message: ' + ERROR_MESSAGE();
	PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR)
	PRINT 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR)
	PRINT '================================================'
	END CATCH

END;

