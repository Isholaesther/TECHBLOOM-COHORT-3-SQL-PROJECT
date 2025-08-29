-- Top 5 Best sellers
use MarketDB;
SELECT TOP 5 p.Name, SUM(s.Quantity) AS TotalSold
FROM Sales s
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY p.Name
ORDER BY TotalSold DESC;
