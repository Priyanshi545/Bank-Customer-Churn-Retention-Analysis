# Bank Customer Churn & Retention Analysis

## 1. Project Overview

This project analyzes customer churn in a banking dataset to identify customer segments associated with higher churn risk and understand the factors related to customer retention.

The project combines **Python/Pandas, MySQL, and Power BI** to demonstrate an end-to-end data analytics workflow:

**Raw Data → Data Cleaning → Exploratory Analysis → SQL Analysis → Power BI Dashboard → Business Insights**

The main objective is to help a bank understand **who is leaving, which customer characteristics are associated with churn, and where retention efforts should be focused.**

---

## 2. Business Objective

Customer churn directly affects a bank's customer base and long-term revenue potential. The analysis focuses on answering questions such as:

- What percentage of customers have churned?
- Does churn vary by geography and gender?
- How does customer age relate to churn?
- Does account activity affect churn?
- Does the number of products held by a customer relate to churn?
- How does customer balance differ between retained and churned customers?
- Are customers with or without credit cards more likely to churn?
- Which customer segments appear to require stronger retention attention?

---

## 3. Dataset

The dataset contains **10,000 customer records** and originally included 14 columns.

During cleaning, `RowNumber` and `Surname` were removed because they were not required for the analysis.

### Final analytical columns

| Column | Description |
|---|---|
| `CustomerId` | Unique customer identifier |
| `CreditScore` | Customer credit score |
| `Geography` | Customer country |
| `Gender` | Customer gender |
| `Age` | Customer age |
| `Tenure` | Number of years the customer has been with the bank |
| `Balance` | Customer account balance |
| `NumOfProducts` | Number of banking products used |
| `HasCrCard` | Whether the customer has a credit card |
| `IsActiveMember` | Whether the customer is an active bank member |
| `EstimatedSalary` | Estimated customer salary |
| `Exited` | Churn indicator: 1 = churned, 0 = retained |

There is **no date column** in the dataset, so the analysis does not use date-based trends or time-series visuals.

---

## 4. Data Cleaning

The data-cleaning process was performed using Python and Pandas.

### Initial checks

- Rows: **10,000**
- Columns: **14**
- Missing values: **None**
- Duplicate rows: **None**

### Cleaning steps

1. Loaded the raw CSV dataset.
2. Checked dataset dimensions and data types.
3. Checked for missing values.
4. Checked for duplicate records.
5. Removed `RowNumber`.
6. Removed `Surname`.
7. Verified that `CustomerId` remained unique.
8. Checked categorical values such as `Geography` and `Gender`.
9. Checked numerical distributions and unusual values.
10. Saved the cleaned dataset for SQL and Power BI analysis.

The final dataset contains:

**10,000 rows × 12 columns**

---

## 5. Key Dataset Statistics

### Churn

- Retained customers: **7,963**
- Churned customers: **2,037**
- Overall churn rate: **20.37%**

### Customer characteristics

- Countries: **France, Spain, Germany**
- Gender categories: **Female, Male**
- Zero-balance customers: **3,617**
- Customers with a credit card: **7,055**
- Customers without a credit card: **2,945**
- Active members: **5,151**
- Inactive members: **4,849**

### Products

| Number of Products | Customers |
|---:|---:|
| 1 | 5,084 |
| 2 | 4,590 |
| 3 | 266 |
| 4 | 60 |

---

## 6. SQL Analysis

MySQL was used to perform structured customer and churn analysis on the cleaned `bank_customers` table.

The SQL analysis focuses on:

- Customer-level summaries
- Churn counts and rates
- Geographic churn comparisons
- Gender-based comparisons
- Activity-status analysis
- Product-level churn analysis
- Credit-card comparisons
- Balance and salary analysis
- Customer segmentation and risk-oriented analysis

The SQL scripts are organized separately in the project's `SQL` folder.

---

## 7. Power BI Dashboard

The cleaned dataset was imported into Power BI to create an interactive dashboard.

### Page 1 — Customer Churn Overview

This page provides a high-level view of the customer base and overall churn situation.

Typical KPI-level information includes:

- Total Customers
- Churned Customers
- Retained Customers
- Overall Churn Rate

The page also provides demographic and customer-status comparisons to establish the overall churn picture.

---

### Page 2 — Customer Risk Insights

This page focuses on customer characteristics associated with higher churn risk.

The analysis considers factors such as:

- Customer activity
- Geography
- Product usage
- Credit-card ownership
- Customer status

A key visual used on this page is:

**Churn Rate by Activity Status**

The `Activity Status` classification is created using:

```DAX
Activity Status =
IF(
    bank_customers[IsActiveMember] = 1,
    "Active",
    "Inactive"
)
```

This allows active and inactive customers to be compared directly.

---

### Page 3 — Customer Profile Insights

The third page focuses on customer profile characteristics and relationships between numerical variables.

The analysis includes variables such as:

- Age
- Balance
- Estimated Salary
- Credit Score
- Tenure
- Number of Products

The page is designed to complement the first two pages by providing deeper customer-profile analysis rather than repeating the same churn visuals.

---

## 8. Important Business Insights

### Overall churn

The dataset has an overall churn rate of **20.37%**.

This means approximately one in five customers in the dataset has exited the bank.

### Customer activity

Customer activity is an important dimension for retention analysis. Comparing active and inactive customers helps identify whether engagement with the bank is associated with customer retention.

Inactive customers should therefore be considered an important segment for further retention analysis.

### Product usage

Most customers use one or two banking products. Very few customers use three or four products.

The small number of customers with three or four products makes these groups important to evaluate carefully because their churn behavior can be more volatile due to their small population sizes.

### Customer profile

Age, balance, credit score, salary, tenure, and product usage provide useful dimensions for understanding customer segments.

These variables should be considered together rather than using a single variable as the sole explanation for churn.

---

## 9. Business Recommendations

Based on the analysis, the bank can consider the following retention strategies:

### 1. Improve engagement among inactive customers

Develop targeted communication and engagement campaigns for inactive customers.

Examples include:

- Personalized banking offers
- Product education
- Digital banking engagement
- Relevant service notifications

### 2. Monitor high-risk customer segments

Use customer characteristics such as age, activity status, product usage, geography, and balance to identify segments that deserve additional retention attention.

### 3. Investigate product relationships

Customers with different numbers of products should be analyzed separately to understand whether product adoption is associated with stronger or weaker retention.

### 4. Use segmentation instead of one-size-fits-all campaigns

Retention strategies should be adapted to customer segments rather than applying the same campaign to every customer.

### 5. Build a future churn-prediction model

The current project is primarily a descriptive and diagnostic analytics project.

A future extension could use machine learning models such as:

- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting

The model could estimate the probability that an individual customer will churn.

---

## 10. Tools & Technologies

- **Python**
- **Pandas**
- **NumPy**
- **Matplotlib**
- **MySQL**
- **Power BI**
- **DAX**
- **Jupyter Notebook**
- **VS Code**
- **Git / GitHub**

---

## 11. Project Workflow

```text
Raw CSV Dataset
       ↓
Python / Pandas
       ↓
Data Cleaning & Validation
       ↓
Cleaned CSV Dataset
       ↓
MySQL
       ↓
SQL Analysis
       ↓
Power BI
       ↓
Interactive Dashboard
       ↓
Business Insights & Recommendations
```

---

## 12. Project Outcome

This project demonstrates an end-to-end **Data Analyst workflow** using a realistic banking customer dataset.

The project covers:

- Data cleaning
- Exploratory data analysis
- Data validation
- SQL querying
- Customer segmentation
- Churn analysis
- Dashboard development
- DAX calculations
- Business interpretation
- Retention recommendations

The final result is an interactive Power BI dashboard supported by Python-based data preparation and MySQL analysis.

---

## 13. Conclusion

The Bank Customer Churn & Retention Analysis project provides a structured view of customer churn and the characteristics associated with customer retention.

The analysis shows that churn should be examined across multiple dimensions, including customer activity, demographics, product usage, geography, balance, and other customer attributes.

By combining **Python, SQL, and Power BI**, the project demonstrates the ability to transform raw customer data into actionable business insights and provides a strong foundation for a future predictive churn-modeling project.
