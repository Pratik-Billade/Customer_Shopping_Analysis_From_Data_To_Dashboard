# Customer Shopping Data Analysis Using SQL and Power BI

## Overview
This project presents a complete customer shopping data analysis workflow, from data preparation to SQL-based analysis and dashboard visualisation.  
It was developed as a portfolio and learning project to demonstrate practical data analytics skills using industry-standard tools.

The analysis focuses on understanding customer purchasing behaviour, product performance, discount usage, and customer segmentation.

---

## Dataset
The dataset contains customer-level shopping activity, with each record representing a purchase transaction.

It includes:
- Customer demographics (age group, gender, subscription status)
- Purchase details (item purchased, category, purchase amount, season)
- Shopping behaviour (discount applied, previous purchases, review rating, shipping type)

The raw dataset is stored separately from the cleaned dataset to maintain data integrity.

---

## Project Structure
customershopping-analysis/
│
├── dataset/
│   ├── raw/
│   └── processed/
│
├── python_data_preparation/
│   └── data_preparation.ipynb
│
├── sql_analysis/
│   └── customer_shopping_analysis.sql
│
├── powerbi/
│   ├── customer_shopping_dashboard.pbix
│   └── images/
│       ├── dashboard_overview.png
│       ├── dashboard_male_young_adult.png
│       ├── dashboard_subscribed_customers.png
│       └── dashboard_senior_clothing.png
│
├── presentation/
│   └── Customer_Shopping_Data_Analysis_Presentation.pdf
│
├── report/
│   └── Customer_Shopping_Data_Analysis_Report.pdf
│
├── docker-compose.yml
├── requirements.txt
└── README.md
---

## Data Preparation (Python)
Python was used to clean and prepare the raw dataset.  
This included handling missing values, creating derived fields such as age groups, and exporting the cleaned data for further analysis.

The full data preparation workflow is documented in the Jupyter notebook located in the `python_data_preparation` directory.

---

## SQL Analysis (PostgreSQL)
PostgreSQL was used to perform structured analytical queries on the cleaned dataset.  
The database was deployed using Docker Compose.

The SQL analysis covers:
- Revenue distribution across customer demographics
- Customer segmentation based on purchase history
- Discount usage patterns
- Product performance by category and review rating

All SQL queries are stored in the `sql_analysis` directory.

---

## Power BI Dashboard
An interactive dashboard was created in Power BI to visualise the results of the SQL analysis.

The dashboard includes:
- Key performance indicators (KPIs)
- Revenue breakdowns by customer segments
- Product and category-level analysis
- Interactive filters for demographics and behaviour

Screenshots of the dashboard, including filtered views, are available in the `powerbi/images` directory.

---

## Tools Used
- Python (pandas) – data cleaning and preparation  
- PostgreSQL – analytical SQL queries  
- Docker – database deployment  
- Power BI – dashboard and visual reporting  
- GitHub – version control and documentation  

---

## Notes
This project was completed as a learning and portfolio exercise to demonstrate end-to-end data analytics workflows using real-world tools and practices.