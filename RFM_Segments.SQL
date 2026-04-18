CREATE DATABASE rfm_analysis;
USE rfm_analysis;

USE rfm_analysis;
SELECT TOP 10 * FROM [RFM_Segments.xls];

--1. Segment Summary:
SELECT Segment,
       COUNT(CustomerID) AS Total_Customers,
       ROUND(AVG(Monetary), 2) AS Avg_Revenue,
       ROUND(AVG(Frequency), 2) AS Avg_Frequency,
       ROUND(AVG(Recency), 2) AS Avg_Recency
FROM [RFM_Segments.xls]
GROUP BY Segment
ORDER BY Avg_Revenue DESC;

--2 Revenue by Segment:
SELECT Segment,
       ROUND(SUM(Monetary), 2) AS Total_Revenue,
       COUNT(CustomerID) AS Customers,
       ROUND(SUM(Monetary) * 100.0 / (SELECT SUM(Monetary) FROM [RFM_Segments.xls]), 2) AS Revenue_Percentage
FROM [RFM_Segments.xls]
GROUP BY Segment
ORDER BY Total_Revenue DESC;

--3 Top 10 Champion Customers:
SELECT COUNT(*) 
FROM [RFM_Segments.xls]
where Segment = 'Champion';

SELECT DISTINCT Segment 
FROM [RFM_Segments.xls];

SELECT TOP 10 *
FROM [RFM_Segments.xls]
ORDER BY Monetary DESC;

-- 4 At Risk Customers:
SELECT COUNT(*) AS total_rows
FROM [RFM_Segments.xls];

SELECT DISTINCT Segment
FROM [RFM_Segments.xls];

SELECT TOP 10 *
FROM [RFM_Segments.xls]
ORDER BY Monetary DESC;

SELECT TOP 10 *
FROM [RFM_Segments.xls]
WHERE Segment LIKE '%Risk%'
ORDER BY Monetary DESC;