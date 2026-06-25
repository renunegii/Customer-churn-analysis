-- Created DataBase and imported table from the csv file
CREATE DATABASE IF NOT EXISTS customer_churn;
USE customer_churn;

CREATE TABLE stg_Churn (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Married VARCHAR(5),
    State VARCHAR(50),
    Number_of_Referrals INT,
    Tenure_in_Months INT,
    Value_Deal VARCHAR(20),
    Phone_Service VARCHAR(5),
    Multiple_Lines VARCHAR(20),
    Internet_Service VARCHAR(5),
    Internet_Type VARCHAR(20),
    Online_Security VARCHAR(20),
    Online_Backup VARCHAR(20),
    Device_Protection_Plan VARCHAR(20),
    Premium_Support VARCHAR(20),
    Streaming_TV VARCHAR(20),
    Streaming_Movies VARCHAR(20),
    Streaming_Music VARCHAR(20),
    Unlimited_Data VARCHAR(20),
    Contract VARCHAR(20),
    Paperless_Billing VARCHAR(5),
    Payment_Method VARCHAR(20),
    Monthly_Charge DECIMAL(10,2),
    Total_Charges DECIMAL(10,2),
    Total_Refunds DECIMAL(10,2),
    Total_Extra_Data_Charges INT,
    Total_Long_Distance_Charges DECIMAL(10,2),
    Total_Revenue DECIMAL(10,2),
    Customer_Status VARCHAR(10),
    Churn_Category VARCHAR(30),
    Churn_Reason VARCHAR(100)
);
-- Here starts exploration

-- Gender distribution in Percentage
SELECT Gender, COUNT(Gender) AS TotalCount,
COUNT(Gender) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Gender;

-- Contract type distribution
SELECT Contract, COUNT(Contract) AS TotalCount, 
COUNT(Contract) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Contract;

-- Customer status vs revenue contribution
SELECT Customer_Status, COUNT(Customer_Status) AS TotalCount, SUM(Total_Revenue) AS TotalRev,
       SUM(Total_Revenue) / (SELECT SUM(Total_Revenue) FROM stg_Churn) * 100 AS RevPercentage
FROM stg_Churn
GROUP BY Customer_Status;

-- State distribution, ranked
SELECT State, COUNT(State) AS TotalCount,
       COUNT(State) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY State
ORDER BY Percentage DESC;
