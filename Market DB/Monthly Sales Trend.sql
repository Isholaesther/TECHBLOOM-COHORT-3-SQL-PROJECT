--Monthly Sales Trend
use MarketDB;
SELECT FORMAT(SaleDate, 'yyyy-MM') AS Month, SUM(s.Quantity * p.UnitPrice) AS Revenue
FROM Sales s
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY FORMAT(SaleDate, 'yyyy-MM')
ORDER BY Month;
