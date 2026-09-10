-- ============================================================
-- BANK CUSTOMER CHURN
-- BUSINESS INSIGHTS
-- ============================================================

USE bank_customer_churn;

-- Business KPI summary

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(CreditScore), 2) AS average_credit_score,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary
FROM bank_customers;

-- Country having higher churn rate

SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Geography
ORDER BY churn_rate DESC;

-- Identify churn driver

SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;

-- Product usage and churn

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY churn_rate DESC;

-- Age and churn

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

-- Customer engagement insight

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN IsActiveMember = 1 AND Exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN IsActiveMember = 1 THEN 1 ELSE 0 END), 0),
        2
    ) AS active_customer_churn_rate,

    ROUND(
        100.0 * SUM(CASE WHEN IsActiveMember = 0 AND Exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN IsActiveMember = 0 THEN 1 ELSE 0 END), 0),
        2
    ) AS inactive_customer_churn_rate
FROM bank_customers;

-- Churned vs retained customer profile

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

-- High-risk customer segments

SELECT
    Geography,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status,
    CASE
        WHEN Age < 40 THEN 'Under 40'
        ELSE '40+'
    END AS age_segment,

    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,

    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM bank_customers

GROUP BY
    Geography,
    IsActiveMember,
    CASE
        WHEN Age < 40 THEN 'Under 40'
        ELSE '40+'
    END

HAVING COUNT(*) >= 50

ORDER BY churn_rate DESC;

-- Customers retention attention

SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    CreditScore,
    Tenure,
    Balance,
    NumOfProducts,
    HasCrCard,
    IsActiveMember,
    EstimatedSalary
FROM bank_customers
WHERE IsActiveMember = 0
  AND Age >= 40
  AND NumOfProducts >= 2
ORDER BY Balance DESC;

-- Geographic retention priority

SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customers
GROUP BY Geography
HAVING COUNT(*) >= 500
ORDER BY churn_rate DESC;

-- Final executive insight

SELECT
    'Overall Churn Rate' AS metric,
    CONCAT(
        ROUND(SUM(Exited) * 100.0 / COUNT(*), 2),
        '%'
    ) AS result
FROM bank_customers

UNION ALL

SELECT
    'Total Customers',
    CAST(COUNT(*) AS CHAR)
FROM bank_customers

UNION ALL

SELECT
    'Churned Customers',
    CAST(SUM(Exited) AS CHAR)
FROM bank_customers

UNION ALL

SELECT
    'Average Customer Age',
    CAST(ROUND(AVG(Age), 2) AS CHAR)
FROM bank_customers

UNION ALL

SELECT
    'Average Credit Score',
    CAST(ROUND(AVG(CreditScore), 2) AS CHAR)
FROM bank_customers

UNION ALL

SELECT
    'Average Balance',
    CAST(ROUND(AVG(Balance), 2) AS CHAR)
FROM bank_customers;
