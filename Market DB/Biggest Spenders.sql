-- Biggest Spenders
use MarketDB;
SELECT TOP 5 b.BuyerName, SUM(s.Quantity * p.UnitPrice) AS TotalSpent
FROM Sales s
JOIN Buyers b ON s.BuyerID = b.BuyerID
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY b.BuyerName
ORDER BY TotalSpent DESC;
