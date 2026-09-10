-- ============================================================
-- BANK CUSTOMER CHURN
-- CHURN ANALYSIS
-- ============================================================

USE bank_customer_churn;

-- Overall churn rate

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers;

-- Churn distribution

SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    COUNT(*) AS customer_count
FROM bank_customers
GROUP BY Exited;

-- Churn by geography

SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Geography
ORDER BY churn_rate DESC;

-- Churn by gender

SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Gender
ORDER BY churn_rate DESC;

-- Churn by age group

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY age_group
ORDER BY churn_rate DESC;

-- Churn by credit-score segment

SELECT
    CASE
        WHEN CreditScore < 580 THEN 'Poor'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Fair'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Good'
        WHEN CreditScore BETWEEN 740 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END AS credit_score_segment,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY credit_score_segment
ORDER BY churn_rate DESC;

-- Churn by tenure

SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Tenure
ORDER BY Tenure;

-- Churn by number of products

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- Churn by credit-card ownership

SELECT
    CASE
        WHEN HasCrCard = 1 THEN 'Has Credit Card'
        ELSE 'No Credit Card'
    END AS credit_card_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY HasCrCard;

-- Churn by active membership

SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active Member'
        ELSE 'Inactive Member'
    END AS membership_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY IsActiveMember;

-- Churn by balance status

SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        ELSE 'Has Balance'
    END AS balance_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY balance_status;

-- Churn by balance segment

SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Below 50K'
        WHEN Balance < 100000 THEN '50K-100K'
        ELSE '100K+'
    END AS balance_segment,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY balance_segment
ORDER BY churn_rate DESC;

-- Churn by salary segment

SELECT
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Below 50K'
        WHEN EstimatedSalary < 100000 THEN '50K-100K'
        WHEN EstimatedSalary < 150000 THEN '100K-150K'
        ELSE '150K+'
    END AS salary_segment,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY salary_segment
ORDER BY churn_rate DESC;

-- Average customer characteristics: Churned vs Retained

SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    COUNT(*) AS customer_count,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(CreditScore), 2) AS avg_credit_score,
    ROUND(AVG(Tenure), 2) AS avg_tenure,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(NumOfProducts), 2) AS avg_products,
    ROUND(AVG(EstimatedSalary), 2) AS avg_salary
FROM bank_customers
GROUP BY Exited;

-- High-risk customer profile

SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    CreditScore,
    Tenure,
    Balance,
    NumOfProducts,
    IsActiveMember,
    Exited
FROM bank_customers
WHERE IsActiveMember = 0
  AND NumOfProducts >= 2
  AND Balance > 0
  AND Age >= 40
ORDER BY Age DESC;

-- Churn rate by geography and activity

SELECT
    Geography,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Geography, IsActiveMember
ORDER BY Geography, churn_rate DESC;

-- Churn rate by geography and gender

SELECT
    Geography,
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Geography, Gender
ORDER BY churn_rate DESC;

-- Identify the strongest churn segments The HAVING COUNT(*) >= 50 prevents us from treating tiny groups as 
-- meaningful just because they happen to have a high churn rate.

SELECT
    Geography,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status,
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY
    Geography,
    IsActiveMember,
    NumOfProducts
HAVING COUNT(*) >= 50
ORDER BY churn_rate DESC;