--Frequent Buyers
use MarketDB;
SELECT b.BuyerName, COUNT(s.SaleID) AS NumberOfPurchases
FROM Sales s
JOIN Buyers b ON s.BuyerID = b.BuyerID
GROUP BY b.BuyerName
HAVING COUNT(s.SaleID) >= 3;