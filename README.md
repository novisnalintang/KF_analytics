# KF_analytics
This project analyzes transaction data from Kimia Farma pharmacies to evaluate business performance across branches, products, and cities. The analysis focuses on identifying sales trends, profitability, and customer satisfaction using SQL queries in BigQuery

## Objectives
The main objectives of this project are:
- Analyze sales performance across branches and cities
- Calculate net sales and net profit after discounts
- Identify products that contribute the most to revenue
- Evaluate customer ratings for both transactions and branches

## Dataset
The analysis uses four datasets:

1. **kf_final_transaction**
   - transaction_id
   - product_id
   - branch_id
   - customer_name
   - date
   - price
   - discount_percentage
   - rating

2. **kf_product**
   - product_id
   - product_name
   - product_category
   - price

3. **kf_inventory**
   - inventory_id
   - branch_id
   - product_id
   - product_name
   - opname_stock

4. **kf_kantor_cabang**
   - branch_id
   - branch_category
   - branch_name
   - kota
   - provinsi
   - rating

## Data Processing
The datasets were joined using SQL in **Google BigQuery**.  
Key transformations performed include:

- Joining transaction data with product and branch data
- Calculating net sales after discount
- Determining gross profit percentage based on price tiers
- Calculating net profit for each transaction

## SQL Query
The main query used for the analysis can be found in:
kf_analytics.sql

## Key Output Columns
The final analysis table contains:

- transaction_id
- date
- branch_id
- branch_name
- kota
- provinsi
- rating_cabang
- customer_name
- product_id
- product_name
- actual_price
- discount_percentage
- persentase_gross_laba
- net_sales
- net_profit
- rating_transaksi
