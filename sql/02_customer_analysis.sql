-- ============================================================
-- BANK CUSTOMER CHURN
-- CUSTOMER ANALYSIS
-- ============================================================

USE bank_customer_churn;

-- Basic customer overview--

SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT CustomerId) AS unique_customers
FROM bank_customers;

-- Customer distribution by geography

SELECT
    Geography,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Geography
ORDER BY customer_count DESC;

-- Customer distribution by gender

SELECT
    Gender,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Gender
ORDER BY customer_count DESC;

-- Customer age analysis

SELECT
    MIN(Age) AS youngest_customer,
    MAX(Age) AS oldest_customer,
    ROUND(AVG(Age), 2) AS average_age
FROM bank_customers;

-- Age group

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY age_group
ORDER BY customer_count DESC;

-- Credit score analysis

SELECT
    MIN(CreditScore) AS minimum_credit_score,
    MAX(CreditScore) AS maximum_credit_score,
    ROUND(AVG(CreditScore), 2) AS average_credit_score
FROM bank_customers;

-- credit score segment

SELECT
    CASE
        WHEN CreditScore < 580 THEN 'Poor'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Fair'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Good'
        WHEN CreditScore BETWEEN 740 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END AS credit_score_segment,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY credit_score_segment
ORDER BY customer_count DESC;

-- Tenure analysis

SELECT
    Tenure,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Tenure
ORDER BY Tenure;

SELECT
    MIN(Tenure) AS minimum_tenure,
    MAX(Tenure) AS maximum_tenure,
    ROUND(AVG(Tenure), 2) AS average_tenure
FROM bank_customers;

-- Product ownership analysis

SELECT
    NumOfProducts,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- Credit card ownership analysis

SELECT
    CASE
        WHEN HasCrCard = 1 THEN 'Has Credit Card'
        ELSE 'No Credit Card'
    END AS credit_card_status,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY credit_card_status
ORDER BY customer_count DESC;

-- Active membership analysis

SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active Member'
        ELSE 'Inactive Member'
    END AS membership_status,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY membership_status;

-- Balance analysis

SELECT
    MIN(Balance) AS minimum_balance,
    MAX(Balance) AS maximum_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM bank_customers;

-- Salary analysis

SELECT
    MIN(EstimatedSalary) AS minimum_salary,
    MAX(EstimatedSalary) AS maximum_salary,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary
FROM bank_customers;

-- Customer profile by geography

SELECT
    Geography,
    COUNT(*) AS customer_count,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(CreditScore), 2) AS average_credit_score,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary
FROM bank_customers
GROUP BY Geography
ORDER BY customer_count DESC;

-- Customer profile by number of products

SELECT
    NumOfProducts,
    COUNT(*) AS customer_count,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary,
    ROUND(AVG(CreditScore), 2) AS average_credit_score
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;