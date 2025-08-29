--Low Stock Alert
use MarketDB;
SELECT Name, Stock
FROM Produce
WHERE Stock < 10;

