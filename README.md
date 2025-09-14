<!-- Banner Section -->
<p align="center">
  <img src="https://github.com/AyusRay/30-DAYS-OF-DATA-ANALYSIS-/blob/main/Banner%20.png" alt="30 Days of Data Analysis Banner" width="800"/>
</p>





# 30-DAYS-OF-DATA-ANALYSIS-
A public log of my journey to deepen my skills in Data Analysis over 30 days. Each day focuses on a different concept, tool, or project.



# Day 1: Data Cleaning & Preparation

Dataset: Titanic Demographic Data

Tools: Python, Pandas

Highlights: Handled missing values, feature transformations, and demographic breakdowns. Built a clean dataset ready for analysis.
✅ Key Insight: Survival chances varied strongly by gender and passenger class, highlighting the importance of preprocessing before modeling.


# Day 2: SQL & Exploratory Data Analysis (EDA)

Dataset: Swiggy Customer Analysis

Tools: SQL (MySQL)

Highlights: Wrote SQL queries to analyze customer ordering patterns, retention, and spending.
✅ Key Insight: High-frequency customers showed distinct order behaviors (preferred food categories & peak order times), valuable for retention strategies.


# Day 3: Text Analysis — Sentiment & Word Frequency

Dataset: Tweets with sentiment labels

Tools: Python, NLP

Highlights: Created text_length feature, applied text preprocessing (cleaning, stopword removal), and analyzed positive vs. negative word frequencies.
✅ Key Insight: Positive tweets commonly used words like love, great, happy, while negative tweets featured bad, worst, problem. Clear patterns emerged even with simple NLP techniques.

# Day 4: SQL Analysis — CTEs, Window Functions, Joins & Subqueries

Dataset: Employee/Department relational database
Tools: SQL, MySQL

Highlights: Practiced CTEs, Window Functions, Joins, and Subqueries. ✔ Key Insight: Ranked employees by salary per department, calculated cumulative totals, found departments with no employees, and identified multi-project workers using advanced SQL techniques.

Skills: CTEs, Window Functions, Joins, Subqueries


# Day 5: A/B Testing Analysis — Hypothesis Testing, Statistical Significance & Business Insight
Project: A/B Test Analysis: Button Color & Conversion Rates
Dataset: Simulated e-commerce A/B test data (~10,000 users)
Tools: Python (Pandas, SciPy, NumPy, Matplotlib, Statsmodels)
Highlights:
Designed and executed a full A/B test analysis to determine if a red "Buy Now" button (Treatment) outperformed the existing green button (Control). Performed data validation, calculated conversion rates, and conducted a statistical t-test. Enhanced the analysis by calculating the confidence interval for the difference in conversion rates and performing a statistical power analysis to validate the test's reliability.
 ✅ Key Insight:
The red button (Group B: 11.34% conversion) statistically significantly outperformed the green button (Group A: 9.58% conversion) with a p-value of 0.004. The 95% confidence interval shows the true uplift is between 0.56% and 2.96%. With a statistical power of 0.82, the test result is highly reliable. The recommendation is to implement the red button, which could lead to a substantial increase in revenue at scale.
 Skills: Hypothesis Testing, Statistical Significance (p-values), Confidence Intervals, Power Analysis, Data Visualization, Business Decision Mapping.


 # Day 6: ML Preprocessing — Feature Engineering, Scaling & Encoding 
 Project : Credit Risk Prediction Pipeline
Dataset: Synthetic credit risk data (15 samples, 8 features)
Tools: Python (Pandas, Scikit-learn, NumPy)
Highlights: Built an end-to-end preprocessing pipeline for credit risk modeling. Handled missing values, performed train-test splitting, applied feature scaling to numerical variables, and encoded categorical features using both ordinal and one-hot encoding techniques. Implemented proper data leakage prevention by fitting transformers only on training data.
Key Insight: Successfully transformed raw data into ML-ready format using ColumnTransformer, scaling numerical features (age, income, loan_amount, credit_score) with StandardScaler, ordinally encoding employment_length, and one-hot encoding home_ownership and loan_intent. The pipeline increased feature dimensions from 7 to 12 while maintaining data integrity and preventing leakage.
Skills: Feature Engineering, Data Scaling, Encoding Techniques, Pipeline Construction, Data Leakage Prevention

# Day 7: Loan Default Prediction Model
📊 Project Overview
Built machine learning models to predict loan defaults using Logistic Regression and Decision Trees.
🎯 Results
- **Logistic Regression Accuracy**: 100%
- **Decision Tree Accuracy**: 100%
- **Target Achievement**: ✅ Exceeded 85% accuracy goal
⚠️ Important Note
The perfect accuracy is likely due to the very small dataset (15 samples). In real-world applications with larger datasets, expect more typical accuracy ranges of 85-95%.
🛠️ Technical Implementation
- Data preprocessing with missing value handling
- Categorical variable encoding
- Feature scaling for Logistic Regression
- Two model types for comparison
- Comprehensive evaluation



# Day -8 Model Evaluation & Risk Factor Analysis
Performed comprehensive model evaluation using Confusion Matrix, ROC–AUC, and SHAP analysis. The model achieved 96.5% accuracy with an AUC of 0.99, indicating excellent predictive power. Feature importance analysis identified worst area, worst concave points, and mean concave points as the top three risk factors influencing predictions.


# Day 9: Bank Performance Scorecard Analysis

Consolidated and analyzed a multi-level bank performance scorecard. Key metrics revealed **strong asset growth (222% attainment)** but significant shortfalls in **deposits (81% attainment)** and **revenue (-6.6% attainment)**. Top risk factors identified were revenue decline and major performance disparity between teams.


# Day 10 : Customer Purchase Analysis

This Jupyter Notebook contains Day 10 of a data analysis project focused on customer purchase behavior. It includes:
Loading and exploring customer purchase data from an Excel file.
Performing descriptive analytics such as calculating average purchase amounts, demographic breakdowns (gender and age), and product category analysis.
Visualizing data using matplotlib and seaborn, including bar charts to compare total sales and average purchase amounts across product categories.
The notebook demonstrates foundational data manipulation, statistical analysis, and visualization techniques using pandas, numpy, matplotlib, and seaborn.


# Day 11-14 : Apple Stock Price Time Series Analysis (TSA)
This Jupyter Notebook contains a multi-day project focused on performing Time Series Analysis (TSA) on historical Apple Inc. (AAPL) stock data. The analysis spans from data loading and preparation to advanced modeling and forecasting.

The project includes:
Loading and preprocessing historical stock price data (Open, High, Low, Close, Volume).
Exploratory Data Analysis (EDA) with visualizations of price trends and trading volume over time.
Decomposing the time series into its core components: trend, seasonality, and residuals to understand underlying patterns.
Statistical testing for stationarity using the Augmented Dickey-Fuller (ADF) test.
Model identification by analyzing Autocorrelation (ACF) and Partial Autocorrelation (PACF) plots to determine parameters for ARIMA family models.
Building and training predictive models, including ARIMA and SARIMA, to capture serial dependence and seasonal patterns.
Evaluating model performance by comparing forecasted values against actual test data using metrics like Mean Absolute Error (MAE) and Root Mean Squared Error (RMSE).
Generating and visualizing future price forecasts.




# Day 15 -16 Strategic Profitability Analysis - Key Findings:

Hospitality sector generates highest revenue ($65.4M) despite third-largest balance

Large clients (>$10M) deliver best interest spreads (2.17%)

Ontario holds 47% of portfolio risk ($3.77B total balance)

Portfolio shows 31 accounts with negative interest spreads

Operating Lines dominate (69% of accounts, 342 total)

Average interest spread across portfolio: 1.82%

Total annual revenue: $187.7M from $8.08B portfolio

Recommendation: Focus on Large clients and Hospitality sector while diversifying Ontario exposure

# Day 17-19 📊 Loan Portfolio Performance Dashboard

This project presents a Loan Portfolio Performance Dashboard built using Python (for EDA) and Power BI (for visualization) to analyze loan balances, revenues, and profitability across sectors, regions, and client sizes. The dashboard highlights key insights such as the Hospitality sector leading in revenue ($65.4M), large clients (> $10M) achieving best spreads (2.17%), and Ontario holding 47% of portfolio risk ($3.77B). With KPIs on loan balance, revenue, interest spreads, and client distribution, it enables executives to quickly assess performance, identify risks, and make strategic decisions—such as focusing on large clients and the hospitality sector while diversifying Ontario exposure.





