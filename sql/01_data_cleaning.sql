-- Database setup

CREATE DATABASE bank_customer;
USE bank_customers;

-- Create the raw table

CREATE TABLE bank_customers (
    RowNumber INT,
    CustomerId INT,
    Surname VARCHAR(100),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary DECIMAL(15,2),
    Exited INT
);

-- Inspect the data

SELECT *
FROM bank_customers; 

SELECT COUNT(*) AS total_records
FROM bank_customers;

SELECT
    CustomerId,
    CreditScore,
    Geography,
    Gender,
    Age,
    Tenure,
    Balance,
    NumOfProducts,
    HasCrCard,
    IsActiveMember,
    EstimatedSalary,
    Exited
FROM bank_customers
LIMIT 10;

-- Check for NULL values

SELECT
    SUM(CustomerId IS NULL) AS null_customer_id,
    SUM(CreditScore IS NULL) AS null_credit_score,
    SUM(Geography IS NULL) AS null_geography,
    SUM(Gender IS NULL) AS null_gender,
    SUM(Age IS NULL) AS null_age,
    SUM(Tenure IS NULL) AS null_tenure,
    SUM(Balance IS NULL) AS null_balance,
    SUM(NumOfProducts IS NULL) AS null_num_products,
    SUM(HasCrCard IS NULL) AS null_credit_card,
    SUM(IsActiveMember IS NULL) AS null_active_member,
    SUM(EstimatedSalary IS NULL) AS null_salary,
    SUM(Exited IS NULL) AS null_exited
FROM bank_customers;

-- Check duplicate Customer IDs

SELECT CustomerId,
COUNT(*) AS Duplicate_customer_record
FROM bank_customers
GROUP BY CustomerId
HAVING COUNT(*)>1;

-- Overall Uniqueness

SELECT 
COUNT(*) AS total_customers,
COUNT(DISTINCT CustomerID) AS unique_customers
FROM bank_customers;


-- Geography Distribution

SELECT Geography,
COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Geography
ORDER BY customer_count DESC;

-- Gender Distribution

SELECT Gender,
COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Gender
ORDER BY customer_count DESC;

-- Churn status distribution

SELECT
    Exited,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Exited
ORDER BY Exited;

-- Validate numerical ranges--

-- Credit Score

SELECT
    MIN(CreditScore) AS min_credit_score,
    MAX(CreditScore) AS max_credit_score
FROM bank_customers;

-- Age

SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age
FROM bank_customers;

-- Tenure

SELECT
    MIN(Tenure) AS min_tenure,
    MAX(Tenure) AS max_tenure
FROM bank_customers;

-- Number of products

SELECT
    MIN(NumOfProducts) AS min_products,
    MAX(NumOfProducts) AS max_products
FROM bank_customers;

-- Salary

SELECT
    MIN(EstimatedSalary) AS min_salary,
    MAX(EstimatedSalary) AS max_salary
FROM bank_customers;

-- Check invalid values--

-- Invalid credit scores

SELECT *
FROM bank_customers
WHERE CreditScore < 0
   OR CreditScore > 850;

-- Invalid age

SELECT *
FROM bank_customers
WHERE Age < 18
   OR Age > 100;

-- Invalid tenure

SELECT *
FROM bank_customers
WHERE Tenure < 0
   OR Tenure > 10;

-- Invalid product count

SELECT *
FROM bank_customers
WHERE NumOfProducts <= 0;

-- Invalid binary fields

SELECT *
FROM bank_customers
WHERE HasCrCard NOT IN (0, 1)
   OR IsActiveMember NOT IN (0, 1)
   OR Exited NOT IN (0, 1);

-- Final validation--

SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT CustomerId) AS unique_customers,
    SUM(Exited = 1) AS churned_customers,
    SUM(Exited = 0) AS retained_customers
FROM bank_customers;

SELECT
    Geography,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers
FROM bank_customers
GROUP BY Geography
ORDER BY churned_customers DESC;