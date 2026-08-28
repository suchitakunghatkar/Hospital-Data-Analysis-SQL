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

## 💡 Key Insights

Based on the SQL analysis, the following key insights were identified:

- The dataset contains **100 hospital records** covering the period from **January 11, 2023, to December 30, 2023**.

- **Apollo Health** recorded the highest total patient volume with **1,192 patients**, followed closely by **Heritage Hospital** with **1,179 patients**.

- **Urology** recorded the highest total medical expenses, totaling **433,418.49**.

- The **City Hospital – Gynecology** combination recorded the highest total medical expenses of **116,525.85** among all hospital-department combinations.

- **Healing Touch** recorded the highest total medical expenses among hospitals with **352,178.06**, followed by **City Hospital** with **347,988.44**.

- **Heritage Hospital** had the highest patient-to-doctor ratio of **5.31**, indicating the highest recorded patient workload relative to doctor count.

- Several individual records had medical expenses above the overall average, with the highest being **49,955.41** at **Healing Touch – Neurology**.

- Patient volume showed significant monthly variation, reaching its highest level in **November 2023 with 1,240 patients**, while **July 2023 recorded the lowest volume with 405 patients**.

- Medical expenses were highest in **September 2023**, totaling **341,284.23**, followed closely by **December 2023** with **337,788.45**.

- Several records had an above-average length of stay, with the longest recorded stay being **15 days**.

- The data quality check identified **0 records** where the discharge date occurred before the admission date, indicating no invalid date sequences in the dataset.

- Using a high-expense threshold of **30,000**, **City Hospital** had the highest proportion of high-expense records at **70.00%**, followed by **Fortis Care** at **63.64%** and **Metro Hospital** at **54.55%**.

- **Apollo Health** had the lowest proportion of high-expense records at **27.27%** among all hospitals.

## 📁 Project Structure

```text
Hospital-Data-Analysis-SQL/
│
├── README.md
├── hospital_data_analysis.sql
└── hospital_data.csv
```

## 🚀 How to Run the Project

### Prerequisites

- PostgreSQL
- pgAdmin or any SQL client

### Steps

1. Clone or download this repository.

2. Create a database in PostgreSQL.

```sql
CREATE DATABASE hospital_data_analysis;
```

3. Connect to the `hospital_data_analysis` database and create the `hospital_data` table.

```sql
CREATE TABLE hospital_data (
    hospital_name VARCHAR(100),
    location VARCHAR(100),
    department VARCHAR(100),
    doctors_count INTEGER,
    patients_count INTEGER,
    admission_date DATE,
    discharge_date DATE,
    medical_expenses NUMERIC(12,2)
);
```

4. Import the `Hospital_Data.csv` dataset into the `hospital_data` table using pgAdmin.

5. Open and run the `hospital_data_analysis.sql` file to perform the analysis.
   
    
## 🛠️ Tools Used

- **PostgreSQL** – Used for database creation, data querying, and analysis.
- **pgAdmin 4** – Used to manage the PostgreSQL database, import the dataset, and execute SQL queries.
- **GitHub** – Used to host and showcase the project and its documentation.
  

## 📌 Conclusion

This project demonstrates the use of SQL and PostgreSQL to analyze hospital data and generate meaningful business insights. The analysis covers patient volume, medical expenses, department performance, patient-to-doctor workload, ranking analysis, date-based trends, and data quality checks.

The project showcases practical SQL skills commonly used in Data Analyst roles, including data exploration, aggregations, filtering, joins, subqueries, CTEs, window functions, and date analysis.

