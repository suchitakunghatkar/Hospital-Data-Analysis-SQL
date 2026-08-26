# Hospital Data Analysis using SQL
This project analyzes hospital data using PostgreSQL to identify patient trends, medical expenses, department performance, patient-to-doctor workload, and length-of-stay patterns.
The project demonstrates SQL skills including data exploration, aggregate functions, GROUP BY, HAVING, CASE statements, subqueries, CTEs, JOINs, window functions, and date functions.

## 📌 Project Overview
The goal of this project is to analyze hospital data and extract meaningful business insights related to patient volume, medical expenses, department performance, doctor workload, and patient stay duration.
The analysis was performed using PostgreSQL and includes data quality checks, exploratory analysis, business metrics, and time-based analysis.

## 📂 Dataset Information
The dataset contains hospital-related records used to analyze patient volume, doctor availability, medical expenses, departments, and patient admission and discharge dates.
### Key Columns
- Hospital Name
- Location
- Department
- Doctors Count
- Patients Count
- Admission Date
- Discharge Date
- Medical Expenses

## 🛠️ SQL Skills & Techniques Used
This project demonstrates the following SQL concepts and techniques:
- Data Exploration and Data Validation
- SELECT, WHERE, ORDER BY, and LIMIT
- Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING
- CASE WHEN for conditional analysis
- Subqueries
- Common Table Expressions (CTEs)
- JOINs: INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN
- Window Functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, and LEAD
- Date Functions: DATE_TRUNC, EXTRACT, and date arithmetic
- NULLIF and COALESCE
- Conditional Aggregation
- Business Metrics and Performance Analysis

## 📊 Business Questions & Analysis
The following business questions were explored using SQL:

### 1. Dataset Overview
- What is the total number of records in the dataset?
- What is the time period covered by the hospital data?

### 2. Hospital Performance Analysis
- Which hospitals have the highest total patient volume?
- Which hospitals have the highest total medical expenses?
- Which hospitals have above-average total expenses?

### 3. Department Analysis
- Which departments have the highest total patient volume?
- Which departments have the highest medical expenses?
- Which hospital-department combinations have the highest total medical expenses?

### 4. Patient-to-Doctor Workload Analysis
- Which hospitals have the highest patient-to-doctor ratio?
- Which hospitals may have a comparatively higher recorded patient workload?

### 5. Expense Analysis
- Which records have medical expenses greater than the overall average?
- What percentage of records fall into the high-expense category?

### 6. Ranking and Performance Analysis
- How do hospitals rank based on total patient volume?
- Which departments rank highest based on total medical expenses?
- What are the top patient-volume records within each department?

### 7. Time-Based Analysis
- How does patient volume change over time?
- How do medical expenses vary on a monthly basis?
- Which records have a length of stay greater than the overall average?

### 8. Data Quality Analysis
- Are there any records where the discharge date is earlier than the admission date?
