# Bank Customer Churn & Retention Analysis

An end-to-end **Data Analyst portfolio project** that analyzes customer churn in a banking dataset using **Python, MySQL, and Power BI**.

The project transforms raw customer data into cleaned analytical data, SQL-based insights, and an interactive Power BI dashboard to understand customer churn and identify segments that may require retention attention.

---

# 📌 Key Results

**Metric**            **Result**

Total Customers        10,000
Retained Customers      7,963
Churned Customers       2,037
Overall Churn Rate     20.37%
Active Members          5,151
Inactive Members        4,849

## What this project demonstrates

Data cleaning and validation using Python/Pandas

Exploratory customer and churn analysis

Business-oriented analysis using MySQL/SQL

Interactive 3-page Power BI dashboard

DAX-based customer segmentation and measures

Translating analytical findings into retention recommendations

---

# 📊 Dashboard Preview

The project includes a 3-page Power BI dashboard focused on customer
churn, customer risk, and customer profile characteristics.

## Executive Dashboard

![Executive Dashboard](Power_BI/Screenshots/Page_1.png)

## Customer & Churn Risk

![Customer & Churn Risk](Power_BI/Screenshots/Page_2.png)

## Customer Insights

![Customer Insights](Power_BI/Screenshots/Page_3.png)
---

## 📊 Power BI Dashboard

The Power BI dashboard contains **three analytical pages**.

### Page 1 — Customer Churn Overview

Provides a high-level overview of the customer base and churn situation.

Focus areas include:

- Total customers
- Churned customers
- Retained customers
- Overall churn rate
- Customer demographics
- High-level churn comparisons

---

### Page 2 — Customer Risk Insights

Focuses on customer characteristics associated with churn risk.

Key areas include:

- Customer activity
- Geography
- Product usage
- Credit-card ownership
- Customer status

One of the key calculated columns is:

```DAX
Activity Status =
IF(
    bank_customers[IsActiveMember] = 1,
    "Active",
    "Inactive"
)
```

This classification is used to compare churn behavior between active and inactive customers.

---

### Page 3 — Customer Profile Insights

Provides deeper analysis of customer profile characteristics.

Variables explored include:

- Age
- Balance
- Estimated Salary
- Credit Score
- Tenure
- Number of Products

This page complements the churn-focused pages by examining the underlying customer profile.

---

## 🎯 Business Objectives

The main objectives of this project are to:

1. Calculate the overall customer churn rate.
2. Compare churn across different customer segments.
3. Analyze the relationship between customer activity and churn.
4. Examine churn by geography and gender.
5. Understand how product usage differs across customers.
6. Compare retained and churned customers using numerical attributes.
7. Identify customer segments that may require stronger retention strategies.
8. Present the findings through an interactive Power BI dashboard.

---

## 📊 Dataset

The dataset contains **10,000 customer records**.

The original dataset contained 14 columns. `RowNumber` and `Surname` were removed during preprocessing because they were not required for the analytical objectives.

### Final Analytical Columns

| Column | Description |
|---|---|
| `CustomerId` | Unique customer identifier |
| `CreditScore` | Customer credit score |
| `Geography` | Customer country |
| `Gender` | Customer gender |
| `Age` | Customer age |
| `Tenure` | Number of years with the bank |
| `Balance` | Customer account balance |
| `NumOfProducts` | Number of banking products used |
| `HasCrCard` | Credit-card ownership indicator |
| `IsActiveMember` | Customer activity indicator |
| `EstimatedSalary` | Estimated customer salary |
| `Exited` | Churn indicator: 1 = churned, 0 = retained |

### Target Variable

`Exited`

- `0` → Retained customer
- `1` → Churned customer

---

## 🧹 Data Cleaning & Validation

Data cleaning was performed using **Python and Pandas**.

### Initial dataset checks

- Rows: **10,000**
- Columns: **14**
- Missing values: **None**
- Duplicate rows: **None**

### Cleaning steps

- Loaded the raw CSV dataset.
- Checked dimensions and data types.
- Checked missing values.
- Checked duplicate records.
- Removed `RowNumber`.
- Removed `Surname`.
- Verified `CustomerId` uniqueness.
- Checked categorical values.
- Reviewed numerical variables and distributions.
- Exported the cleaned dataset for SQL and Power BI.

### Final dataset

**10,000 rows × 12 columns**

---

## 🔎 Key Analytical Findings

### 1. Overall churn is material

The dataset has an overall churn rate of 20.37%, meaning
approximately 1 in 5 customers has exited.

**Business implication :** A meaningful portion of the customer base is
at risk of being lost, making customer retention an important business
focus.

### 2. Customer activity is associated with churn behavior

Active and inactive customers show different churn behavior, making
customer engagement an important dimension for retention analysis.

**Business implication :** Inactive customers can be prioritized for
targeted re-engagement initiatives.

### 3. Most customers use one or two products

The majority of customers use either one or two banking products,
while customers using three or four products form a much smaller
segment.

**Business implication :** Product usage should be monitored alongside
churn rather than treated as an isolated metric.

### 4. Churn should be analyzed across multiple customer characteristics

Customer churn should not be attributed to a single variable. The
analysis considers activity, geography, age, balance, product usage,
credit score, tenure, and other customer characteristics together.

**Business implication :** Segment-based retention strategies are more
appropriate than applying one retention approach to every customer.

---

## 📌 Business Recommendations

### Improve engagement

Develop targeted engagement strategies for inactive customers.

### Monitor high-risk segments

Use customer characteristics to identify segments requiring additional retention attention.

### Encourage appropriate product engagement

Analyze product usage carefully and identify opportunities for relevant cross-selling or product adoption.

### Use customer segmentation

Create targeted retention strategies rather than applying the same approach to every customer.

### Develop predictive churn modeling

A future version of this project can use machine learning to predict the probability of customer churn.

Potential models include:

- Logistic Regression
- Decision Tree
- Random Forest
- Gradient Boosting

---

## 🛠️ Technologies Used

- **Python**
- **Pandas**
- **NumPy**
- **Matplotlib**
- **MySQL**
- **SQL**
- **Power BI**
- **DAX**
- **Jupyter Notebook**
- **VS Code**
- **Git / GitHub**

---

## 🐍 Python Analysis

Python was used for:

- Data loading
- Data inspection
- Data cleaning
- Duplicate checking
- Missing-value checking
- Data validation
- Exploratory data analysis
- Numerical and categorical analysis
- Preparing the cleaned dataset

Main libraries:

```text
pandas
numpy
matplotlib
```

---

## 🗄️ SQL Analysis

The cleaned dataset was imported into MySQL using the table:

```text
bank_customers
```

SQL was used to perform:

- Customer-level analysis
- Churn counts
- Churn-rate calculations
- Geographic analysis
- Gender analysis
- Activity-status analysis
- Product-level analysis
- Credit-card analysis
- Balance analysis
- Salary analysis
- Customer segmentation

The SQL queries are stored in the project's `SQL` folder.

---

## 📁 Project Structure

```text
Bank-Customer-Churn-Retention-Analysis/
│
├── Power_BI/
│   ├── Bank churn dashboard.pbix
│   └── screenshots/
│       ├── page1_customer_overview.png
│       ├── page2_customer_risk_insights.png
│       └── page3_customer_profile_insights.png
│
├── data/
│   ├── raw/
│   │   └── Churn_Modelling.csv
│   └── processed/
│       └── bank_customer_churn_cleaned.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_customer_analysis.ipynb
│   └── 03_churn_analysis.ipynb
│
├── reports/
│
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_customer_analysis.sql
│   └── 03_churn_analysis.sql
│
├── README.md
├── requirements.txt
└── .gitignore
```
---

## 🚀 Project Workflow

Raw Data
   ↓
Python / Pandas
   ↓
Data Cleaning & Validation
   ↓
Exploratory Data Analysis
   ↓
MySQL / SQL Analysis
   ↓
Power BI Dashboard
   ↓
Business Insights
   ↓
Retention Recommendations


### Step 1 — Data Cleaning

Raw customer data was loaded and cleaned using Pandas.

### Step 2 — Exploratory Analysis

Customer characteristics and churn patterns were explored using Python.

### Step 3 — SQL Analysis

The cleaned dataset was imported into MySQL and analyzed using SQL queries.

### Step 4 — Power BI

The cleaned dataset was loaded into Power BI to create an interactive three-page dashboard.

### Step 5 — Business Insights

The analysis was converted into customer-risk observations and retention recommendations.

---

## 📈 Project Outcome

This project demonstrates an end-to-end **Data Analyst workflow**:

```text
Data Collection
      ↓
Data Cleaning
      ↓
Exploratory Data Analysis
      ↓
SQL Analysis
      ↓
Data Visualization
      ↓
Business Insights
      ↓
Recommendations
```

It demonstrates practical skills in:

- Data cleaning
- Exploratory data analysis
- SQL
- MySQL
- Pandas
- Power BI
- DAX
- Data visualization
- Business analysis
- Customer segmentation
- Churn analysis

---

## 🔮 Future Improvements

Possible future extensions include:

- Customer churn prediction using machine learning
- Customer risk scoring
- Feature engineering
- Model evaluation and comparison
- Automated reporting
- Advanced customer segmentation
- Retention campaign simulation

---

