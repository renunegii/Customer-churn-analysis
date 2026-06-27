USE customer_churn;
CREATE VIEW vw_ChurnData AS
SELECT * FROM prod_churn WHERE Customer_Status IN ('Churned', 'Stayed');

CREATE VIEW vw_JoinData AS
SELECT * FROM prod_churn WHERE Customer_Status = 'Joined';

SELECT COUNT(*) FROM vw_ChurnData;
SELECT COUNT(*) FROM vw_JoinData;

-- Contract type frequency
SELECT Contract, COUNT(*) AS Total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM vw_ChurnData), 2) AS Pct
FROM vw_ChurnData
GROUP BY Contract
ORDER BY Total DESC;

-- Payment method frequency
SELECT Payment_Method, COUNT(*) AS Total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM vw_ChurnData), 2) AS Pct
FROM vw_ChurnData
GROUP BY Payment_Method
ORDER BY Total DESC;

-- Internet type frequency
SELECT Internet_Type, COUNT(*) AS Total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM vw_ChurnData), 2) AS Pct
FROM vw_ChurnData
GROUP BY Internet_Type
ORDER BY Total DESC;