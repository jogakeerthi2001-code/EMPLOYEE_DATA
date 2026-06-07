-- Databricks notebook source
Describe workspace.default.employee_data_50_records;

-- COMMAND ----------

SELECT * FROM workspace.default.employee_data_50_records;

-- COMMAND ----------

Select * from workspace.default.employee_data_50_records where Department="IT" and Salary>45000 order by Salary;

-- COMMAND ----------

Select distinct(Location) from workspace.default.employee_data_50_records;

-- COMMAND ----------

Select count(*) from employee_data_50_records;

-- COMMAND ----------

SELECT * From employee_data_50_records Where ExperienceYears>3 and Department="Sales";


-- COMMAND ----------

select * from employee_data_50_records order by Salary desc LIMIT 3;

-- COMMAND ----------

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Department
               ORDER BY Salary DESC
           ) AS rn
    FROM employee_data_50_records
) t
WHERE rn <= 3;