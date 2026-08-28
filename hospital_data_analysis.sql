--1. Dataset Overview
--Business Question:
--What is the overall size and time period of the dataset?
SELECT
    COUNT(*) AS total_records,
    MIN(admission_date) AS earliest_admission,
    MAX(admission_date) AS latest_admission
FROM hospital_data;
--SQL concepts: COUNT(), MIN(), MAX()


--2. Hospital-wise Patient Analysis
--Business Question:
--Which hospitals have the highest total patient volume?
SELECT
    hospital_name,
    SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_patients DESC;
--SQL concepts: SUM(), GROUP BY, ORDER BY


--3. Department-wise Expense Analysis
--Business Question:
--Which departments have the highest total medical expenses?
SELECT
    department,
    SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY department
ORDER BY total_expenses DESC;


--4. Top 5 Hospital-Department Combinations
--Business Question:
--Which hospital and department combinations have the highest medical expenses?
SELECT
    hospital_name,
    department,
    SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY
    hospital_name,
    department
ORDER BY total_expenses DESC
LIMIT 5;


--5. Above-Average Medical Expenses
--Business Question:
--Which records have medical expenses greater than the overall average?
SELECT
    hospital_name,
    department,
    medical_expenses
FROM hospital_data
WHERE medical_expenses >
(
    SELECT AVG(medical_expenses)
    FROM hospital_data
)
ORDER BY medical_expenses DESC;
--SQL concepts: Subquery, AVG(), WHERE


--6. Hospitals with Above-Average Total Expenses
WITH hospital_expenses AS (
    SELECT
        hospital_name,
        SUM(medical_expenses) AS total_expenses
    FROM hospital_data
    GROUP BY hospital_name
)

SELECT
    hospital_name,
    total_expenses
FROM hospital_expenses
WHERE total_expenses >
(
    SELECT AVG(total_expenses)
    FROM hospital_expenses
)
ORDER BY total_expenses DESC;
--SQL concepts:CTE, GROUP BY, SUM(), Subquery, AVG()


--7. Patient-to-Doctor Workload Analysis
--Business Question:
--Which hospital has the highest patient load per doctor?
WITH hospital_summary AS (
    SELECT
        hospital_name,
        SUM(patients_count) AS total_patients,
        SUM(doctors_count) AS total_doctors
    FROM hospital_data
    GROUP BY hospital_name
)

SELECT
    hospital_name,
    total_patients,
    total_doctors,
    ROUND(
        total_patients::NUMERIC /
        NULLIF(total_doctors, 0),
        2
    ) AS patients_per_doctor
FROM hospital_summary
ORDER BY patients_per_doctor DESC;
--SQL concepts: CTE, Calculated Metric, Type Casting, NULLIF(), ROUND()


--8. Rank Hospitals by Patient Volume
SELECT
    hospital_name,
    SUM(patients_count) AS total_patients,
    RANK() OVER (
        ORDER BY SUM(patients_count) DESC
    ) AS patient_rank
FROM hospital_data
GROUP BY hospital_name
ORDER BY patient_rank;
--SQL concepts: RANK(), OVER(), Window Functions


--9. Top 3 Patient Records Within Each Department
WITH ranked_patients AS (
    SELECT
        hospital_name,
        department,
        patients_count,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY patients_count DESC
        ) AS patient_rank
    FROM hospital_data
)

SELECT *
FROM ranked_patients
WHERE patient_rank <= 3
ORDER BY department, patient_rank;
--SQL concepts: CTE, DENSE_RANK(), PARTITION BY, Top N Analysis


--10. Monthly Patient Trend
SELECT
    DATE_TRUNC('month', admission_date) AS month,
    SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month;
--SQL concepts: DATE_TRUNC(), SUM(), Time-series analysis


--11. Monthly Medical Expense Trend
SELECT
    DATE_TRUNC('month', admission_date) AS month,
    SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month;


--12. Length of Stay Analysis
--Business Question:
--Which records have a length of stay greater than the overall average?
SELECT
    hospital_name,
    department,
    admission_date,
    discharge_date,
    discharge_date - admission_date AS length_of_stay
FROM hospital_data
WHERE discharge_date - admission_date >
(
    SELECT AVG(discharge_date - admission_date)
    FROM hospital_data
)
ORDER BY length_of_stay DESC;


--13. Data Quality Check
--Checked for invalid records where the discharge date occurred before the admission date.
SELECT *
FROM hospital_data
WHERE discharge_date < admission_date;



--14. Optional: High-Expense Record Analysis
--This demonstrates CASE WHEN and conditional aggregation.
SELECT
    hospital_name,
    COUNT(*) AS total_records,

    SUM(
        CASE
            WHEN medical_expenses >= 30000 THEN 1
            ELSE 0
        END
    ) AS high_expense_records,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN medical_expenses >= 30000 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS high_expense_percentage

FROM hospital_data
GROUP BY hospital_name
ORDER BY high_expense_percentage DESC;