USE Sales_Analytics;

SELECT TOP 46991 *
FROM Orders;
   TRUNCATE TABLE Persons;
   DROP TABLE Persons;
  Delete from Persons
  CREATE TABLE Persons (
    PersonID INT IDENTITY(1,1) PRIMARY KEY,
    Person   VARCHAR(255),
    Region   VARCHAR(255)
); 
SELECT * FROM Persons;
ALTER TABLE Persons ALTER COLUMN Person VARCHAR(255);
DROP TABLE IF EXISTS Persons;

CREATE TABLE Persons (
    Person VARCHAR(255),
    Region VARCHAR(255) PRIMARY KEY
);
Select * from Persons
   Drop table if exists Returns
   CREATE TABLE Returns (
    [Returned] VARCHAR(255),
    [Order ID] VARCHAR(255) NOT NULL,
    [Market]   VARCHAR(255)
);
   Truncate table Returns
Select * from Returns
SELECT DISTINCT o.Region
FROM Orders o
LEFT JOIN dbo.Persons p ON o.Region = p.Region
WHERE p.Region IS NULL;
SELECT * FROM dbo.Orders WHERE Region = 'Region';
DELETE FROM Orders WHERE Region = 'Region';
SELECT COUNT(*) FROM dbo.Orders WHERE [Order ID] = 'Order ID';
  SELECT DISTINCT Region, LEN(Region) FROM Orders WHERE Region LIKE '%Emea%';
  SELECT Region, LEN(Region) FROM dbo.Persons;
  SELECT COUNT(*) AS EmeaRows,
       COUNT(DISTINCT [Order ID]) AS EmeaOrders
FROM Orders
WHERE Region = 'Emea';
INSERT INTO Persons (Person, Region)
VALUES ('Unassigned', 'Emea');
Select * from Persons
SELECT COUNT(*) AS TotalReturns,
       SUM(CASE WHEN o.[Order ID] IS NOT NULL THEN 1 ELSE 0 END) AS Matched,
       SUM(CASE WHEN o.[Order ID] IS NULL THEN 1 ELSE 0 END) AS Unmatched
FROM Returns r

ALTER TABLE Orders ALTER COLUMN Region VARCHAR(255);
SELECT [Order ID], COUNT(*) AS Cnt
FROM Returns
GROUP BY [Order ID]
HAVING COUNT(*) > 1;
 
Select * from Returns
Select * from Orders
     --Ship Date--
	   --Format--
SELECT DISTINCT TOP 20 [Shipping Date]
FROM dbo.Orders
          --Handle Bad Dates--
SELECT COUNT(*) AS BadShipDates
FROM dbo.Orders
WHERE TRY_CONVERT(date,
  LTRIM(SUBSTRING(REPLACE(REPLACE([Shipping Date], ',', ''), '"', ''),
  CHARINDEX(' ', REPLACE(REPLACE([Shipping Date], ',', ''), '"', '')) + 1, 50))) IS NULL;
        --Add Ship Date Column in Orders.db from Varchar to Date Format
  ALTER TABLE dbo.Orders ADD ShipDateClean DATE;
        --Update Shipping Date Column--
  UPDATE dbo.Orders
SET [Shipping Date] = TRY_CONVERT(date,
  LTRIM(SUBSTRING(REPLACE(REPLACE([Shipping Date], ',', ''), '"', ''),
  CHARINDEX(' ', REPLACE(REPLACE([Shipping Date], ',', ''), '"', '')) + 1, 50)));
          --Type Null--
SELECT COUNT(*) AS NullShipDates FROM dbo.Orders WHERE [Shipping Date] IS NULL;
            --Date Format--
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'ShipDateClean';
SELECT TOP 10 [Shipping Date] FROM dbo.Orders;
ALTER TABLE dbo.Orders ADD OrderDateClean DATE;
UPDATE dbo.Orders
SET [Order Date] = TRY_CONVERT(date,
  LTRIM(SUBSTRING(REPLACE(REPLACE([Order Date], ',', ''), '"', ''),
  CHARINDEX(' ', REPLACE(REPLACE([Order Date], ',', ''), '"', '')) + 1, 50)));
  Select TOP 46691 [Order Date] from dbo.Orders
  
 SELECT COUNT(*) AS BadSales
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,2), [ Sales ]) IS NULL;
ALTER TABLE dbo.Orders ALTER COLUMN [ Sales ] DECIMAL(18,2);
SELECT COUNT(*) AS BadSales
FROM dbo.Orders
SELECT COUNT(*) AS BadQty
FROM dbo.Orders
WHERE TRY_CONVERT(int, LTRIM(RTRIM(Quantity))) IS NULL;
ALTER TABLE dbo.Orders ALTER COLUMN Quantity INT;
SELECT COUNT(*) AS Rows_, SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS NullQty,
       MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty
FROM dbo.Orders;
SELECT COLUMN_NAME, DATA_TYPE int
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'Quantity';
SELECT COLUMN_NAME, DATA_TYPE Decimal, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME LIKE '%Profit%';
SELECT COUNT(*) AS BadProfit
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,2), LTRIM(RTRIM(Profit))) IS NULL;
SELECT DISTINCT Profit
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,2), LTRIM(RTRIM(Profit))) IS NULL;
DROP VIEW IF EXISTS dbo.vw_Sales_Final;
ALTER TABLE dbo.Orders ALTER COLUMN Profit DECIMAL(18,2);
UPDATE dbo.Orders
SET Profit = '0'
WHERE LTRIM(RTRIM(Profit)) IN ('Rs-', 'Rs -', '-');
UPDATE dbo.Orders
SET Profit = LTRIM(RTRIM(Profit));
SELECT COUNT(*) AS BadProfit
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,2), Profit) IS NULL;
ALTER TABLE dbo.Orders ALTER COLUMN Profit DECIMAL(18,2);
SELECT COLUMN_NAME, DATA_TYPE Decimal, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME = 'Profit';
SELECT COUNT(*) AS Rows_,
       SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS NullProfit,
       SUM(Profit) AS TotalProfit
FROM dbo.Orders;
SELECT DISTINCT TOP 30 Discount FROM dbo.Orders ORDER BY Discount;
SELECT COUNT(*) AS BadDiscount
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,4), LTRIM(RTRIM(Discount))) IS NULL;
UPDATE dbo.Orders SET Discount = LTRIM(RTRIM(Discount));
Select COLUMN_NAME, Data_Type decimal,NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS 
Where  TABLE_NAME = 'Orders' AND COLUMN_NAME = 'Discount';
UPDATE dbo.Orders SET Discount = LTRIM(RTRIM(Discount));
ALTER TABLE dbo.Orders ALTER COLUMN Discount DECIMAL(18,4);
SELECT '[' + COLUMN_NAME + ']' AS ExactName, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders' AND COLUMN_NAME LIKE '%Shipping%Cost%';
SELECT COUNT(*) AS BadShipCost
FROM dbo.Orders
WHERE TRY_CONVERT(decimal(18,2), LTRIM(RTRIM([ Shipping Cost ]))) IS NULL;
UPDATE dbo.Orders
SET [ Shipping Cost ] = LTRIM(RTRIM([ Shipping Cost ]));
SELECT COUNT(*) AS BadRowID
FROM dbo.Orders
WHERE TRY_CONVERT(int, LTRIM(RTRIM([Row ID]))) IS NULL;
ALTER TABLE dbo.Orders ALTER COLUMN [Row ID] INT;
UPDATE dbo.Orders SET [Row ID] = LTRIM(RTRIM([Row ID]));
SELECT 'Orders' AS T, COUNT(*) AS Cnt FROM dbo.Orders
UNION ALL SELECT 'Persons', COUNT(*) FROM dbo.Persons
UNION ALL SELECT 'Returns', COUNT(*) FROM dbo.Returns;
BACKUP DATABASE Sales_Analytics
TO DISK = 'C:\SQL_Data\Sales_Analytics.bak' WITH INIT;
USE Sales_Analytics;
GO
DROP VIEW IF EXISTS dbo.vw_Sales_Final;
GO
CREATE VIEW dbo.vw_Sales_Final AS
SELECT
    o.[Row ID], o.[Order ID],
    o.OrderDateClean AS [Order Date],
    o.ShipDateClean  AS [Shipping Date],
    o.[Shipping Mode], o.[Customer ID], o.[Customer Name], o.[Customer Segment],
    o.[Country], o.[City], o.[State], o.[Region], p.[Person],
    o.[Product ID], o.[Category], o.[Sub-Category], o.[Product Name],
    o.[ Sales ], o.[Profit], o.[Quantity], o.[Discount], o.[ Shipping Cost ],
    YEAR(o.OrderDateClean)  AS Order_Year,
    MONTH(o.OrderDateClean) AS Order_Month,
    DATENAME(MONTH, o.OrderDateClean) AS Order_MonthName,
    DATEDIFF(DAY, o.OrderDateClean, o.ShipDateClean) AS Shipping_Delay_Days,
    CASE WHEN r.[Order ID] IS NOT NULL THEN 'Yes' ELSE 'No' END AS Return_Status
FROM dbo.Orders o
LEFT JOIN dbo.Persons p ON o.[Region]   = p.[Region]
LEFT JOIN dbo.Returns r ON o.[Order ID] = r.[Order ID];
GO
                  --Validating View--
SELECT COUNT(*) AS ViewRows, SUM([ Sales ]) AS ViewSales FROM dbo.vw_Sales_Final;  -- 46,990 / 11,584,084.09
SELECT COUNT(*) AS NullYear FROM dbo.vw_Sales_Final WHERE Order_Year IS NULL;  -- 0
                         --Basic Queries--
SELECT COUNT(DISTINCT [Order ID]) AS TotalOrders,
       SUM ([ Sales ]) AS TotalSales,
       SUM(Profit) AS TotalProfit,
       SUM([ Sales ]) / COUNT(DISTINCT [Order ID]) AS AvgOrderValue
FROM dbo.vw_Sales_Final;
SELECT COUNT(*) AS NullYear FROM dbo.vw_Sales_Final WHERE Order_Year IS NULL;
SELECT COUNT(*) AS NegDelay FROM dbo.vw_Sales_Final WHERE Shipping_Delay_Days < 0;
                          --Intermediate Queries--
-- Region-wise sales
SELECT Region, SUM([ Sales ]) AS TotalSales
FROM dbo.vw_Sales_Final GROUP BY Region ORDER BY TotalSales DESC;

-- Category-wise profit
SELECT Category, SUM(Profit) AS TotalProfit
FROM dbo.vw_Sales_Final GROUP BY Category ORDER BY TotalProfit DESC;

-- Top 10 products by sales
SELECT TOP 10 [Product Name], SUM([ Sales ]) AS TotalSales
FROM dbo.vw_Sales_Final GROUP BY [Product Name] ORDER BY TotalSales DESC;

-- Loss-making products
SELECT [Product Name], SUM(Profit) AS TotalProfit
FROM dbo.vw_Sales_Final GROUP BY [Product Name]
HAVING SUM(Profit) < 0 ORDER BY TotalProfit;

-- Returned orders
SELECT COUNT(DISTINCT [Order ID]) AS ReturnedOrders
FROM dbo.vw_Sales_Final WHERE Return_Status = 'Yes';
				--Advanced Queries--
-- Monthly trend
SELECT Order_Year, Order_Month, SUM([ Sales ]) AS MonthlySales
FROM dbo.vw_Sales_Final
GROUP BY Order_Year, Order_Month ORDER BY Order_Year, Order_Month;

-- Segment-wise profit
SELECT [Customer Segment], SUM(Profit) AS TotalProfit
FROM dbo.vw_Sales_Final GROUP BY [Customer Segment] ORDER BY TotalProfit DESC;

-- Average shipping delay by category
SELECT Category, AVG(CAST(Shipping_Delay_Days AS FLOAT)) AS AvgDelay
FROM dbo.vw_Sales_Final GROUP BY Category;

-- Region ranking
SELECT Region, SUM([ Sales ]) AS TotalSales,
       RANK() OVER (ORDER BY SUM([ Sales ]) DESC) AS SalesRank
FROM dbo.vw_Sales_Final GROUP BY Region;

-- Return rate (distinct orders)
SELECT CAST(COUNT(DISTINCT CASE WHEN Return_Status = 'Yes' THEN [Order ID] END) AS FLOAT)
       / COUNT(DISTINCT [Order ID]) * 100 AS ReturnRatePct
FROM dbo.vw_Sales_Final;

SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
  AND COLUMN_NAME IN ('Sales','Profit','ProfitClean','Discount','Quantity','Shipping Cost','Row ID');
 
SELECT Discount, COUNT(*) AS Cnt
FROM dbo.Orders
GROUP BY Discount
ORDER BY Discount;
SELECT AVG(CAST(Shipping_Delay_Days AS FLOAT)) AS AvgDelay
FROM dbo.vw_Sales_Final;
SELECT ROUND(AVG(CAST(Shipping_Delay_Days AS FLOAT)), 4) AS AvgDelay
FROM dbo.vw_Sales_Final;
SELECT
    COUNT(DISTINCT [Order ID]) AS TotalOrders,
    COUNT(DISTINCT CASE WHEN Return_Status = 'Yes' THEN [Order ID] END) AS ReturnedOrders,
    CAST(COUNT(DISTINCT CASE WHEN Return_Status = 'Yes' THEN [Order ID] END) AS FLOAT)
        / COUNT(DISTINCT [Order ID]) * 100 AS ReturnRatePct
FROM dbo.vw_Sales_Final;
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'vw_Sales_Final' AND COLUMN_NAME LIKE '%Sales%';
SELECT TOP 10 [Product Name],SUM ([ Sales ]) AS TotalSales
FROM dbo.vw_Sales_Final
GROUP BY [Product Name]
ORDER BY TotalSales DESC;