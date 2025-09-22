create database projectdb;
use projectdb;
CREATE TABLE diversity_inclusion (
    Employee_ID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Job_Level_after_FY20_promotions VARCHAR(30),
    New_hire_FY20 VARCHAR(5),
    FY20_Performance_Rating INT,
    Promotion_in_FY21 VARCHAR(5),
    In_base_group_for_Promotion_FY21 VARCHAR(5),
    Target_hire_balance DECIMAL(10 , 2 ),
    FY20_leaver VARCHAR(5),
    In_base_group_for_turnover_FY20 VARCHAR(5),
    Department_asof_2020_07_01 VARCHAR(50),
    Leaver_FY VARCHAR(10),
    Job_Level_after_FY21_promotions VARCHAR(30),
    Last_Department_in_FY20 VARCHAR(50),
    FTE_group VARCHAR(20),
    Time_type VARCHAR(20),
    Department_JL_group_PRA_status VARCHAR(50),
    Department_JL_group_for_PRA VARCHAR(60),
    Job_Level_group_PRA_status VARCHAR(20),
    Job_Level_group_for_PRA VARCHAR(30),
    Time_in_Job_Level_asof_2020_07_01 INT,
    Job_Level_before_FY20_promotions VARCHAR(30),
    Promotion_in_FY20 VARCHAR(5),
    FY19_Performance_Rating INT,
    Age_group VARCHAR(50),
    Age_asof_2020_07_01 INT,
    Nationality_1 VARCHAR(50),
    Region_group_nationality1 VARCHAR(50),
    Broad_region_group_nationality1 VARCHAR(50),
    Last_hire_date VARCHAR(50),
    Years_since_last_hire INT,
    Rand VARCHAR(40)
);
SELECT*FROM projectdb.diversity_inclusion;
#1. Retrieve all employees who are from Germany

SELECT 
    *
FROM
    projectdb.diversity_inclusion
WHERE
    Nationality_1 = 'Germany';
    #2. Count the total number of Male and Female employees

SELECT 
    gender, COUNT(*) AS total_employees
FROM
    projectdb.diversity_inclusion
GROUP BY gender;
#3. Show All Employees Who Are New Hires In FY20

SELECT 
    Employee_ID,
    gender,
    Job_Level_after_FY20_promotions,
    Nationality_1
FROM
    projectdb.diversity_inclusion
WHERE
    New_hire_FY20 = 'Y';
    #4. Find The Average Performance Rating By Job Level

SELECT 
    Job_Level_after_FY20_promotions AS Job_Level,
    AVG(FY20_Performance_Rating) AS avg_rating
FROM
    projectdb.diversity_inclusion
GROUP BY Job_Level_after_FY20_promotions;
#5. Get The Number Of Employees Who Got A Promotion In FY21

SELECT 
    COUNT(*) AS promoted_employees
FROM
    projectdb.diversity_inclusion
WHERE
    (Promotion_in_FY21) = 'Yes';
    #6. List the Top 5 Oldest Employees With Age And Job Level

SELECT 
    Employee_id,
    Age_asof_2020_07_01 AS Age,
 Job_Level_after_FY20_promotions AS Job_Level
FROM
    projectdb.diversity_inclusion
ORDER BY Age_asof_2020_07_01 DESC
LIMIT 5;
#7. Find The Region With The Highest Number Of Employees

SELECT 
    Region_group_nationality1 AS region,
    COUNT(*) AS total_employees
FROM
    projectdb.diversity_inclusion
GROUP BY Region_group_nationality1
ORDER BY total_employees DESC;
#8. Calculate The Average Years Since Last Hire By Region

SELECT 
    Region_group_nationality1 AS region,
    AVG(Years_since_last_hire) AS avg_years
FROM
    projectdb.diversity_inclusion
GROUP BY Region_group_nationality1;
#9. Find The Performance Trend: Compare Average 'FY19 Performance Rating' Vs 'FY20 Performance Rating' For Each Job Level

SELECT 
    Job_Level_after_FY20_promotions,
    AVG(FY19_Performance_Rating) AS avg_FY19,
    AVG(FY20_Performance_Rating) AS avg_FY20
FROM
    projectdb.diversity_inclusion
GROUP BY Job_Level_after_FY20_promotions
ORDER BY Job_Level_after_FY20_promotions;
#10. Find The Employees Who Left In FY20 But Had A Performance Rating Above 3?

SELECT 
    employee_id,
    gender,
    Job_Level_after_FY20_Promotions AS job_level,
    Department_asof_2020_07_01 AS department,
    FY20_Performance_Rating,
    FY20_Leaver
FROM
    projectdb.diversity_inclusion
WHERE
    FY20_Leaver = 'Yes'
        AND FY20_Performance_Rating > 3;








    

