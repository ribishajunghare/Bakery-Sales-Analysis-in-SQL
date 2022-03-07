--Let's look at the data

SELECT *
 FROM [PROJECT 1].[dbo].[BakerySales];

SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'BakerySales' 

--Spliting DateTime column(Year, Month, Day, Weekday)

SELECT
YEAR(DateTime) AS Year,
DATENAME(MONTH, DateTime) AS Month,
DAY(DateTime) AS Day,
DATENAME(WEEKDAY, DateTime) AS Weekday
 FROM [PROJECT 1].[dbo].[BakerySales];

 
ALTER TABLE BakerySales
ADD Year int;

UPDATE BakerySales
SET Year = YEAR(DateTime);

ALTER TABLE BakerySales
DROP COLUMN Month

ALTER TABLE BakerySales
ADD Month nvarchar(255);

UPDATE BakerySales
SET Month = DATENAME(MONTH, DateTime);

ALTER TABLE BakerySales
ADD Date int;

UPDATE BakerySales
SET Date = DAY(DateTime);

ALTER TABLE BakerySales
ADD Day nvarchar(255);

UPDATE BakerySales
SET Day = DATENAME(WEEKDAY, DateTime);

--Now let's see if everything is updated or not

SELECT *
 FROM [PROJECT 1].[dbo].[BakerySales];


-- let's look at distinct items in the store

SELECT DISTINCT(Items)
FROM [PROJECT 1].[dbo].[BakerySales];    --There are in total 94 items in this store

--Total number of each items sold and which item is being sold frequently

SELECT Items, COUNT(*)
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Items
ORDER BY COUNT(*) DESC;   --  Coffee is being sold highest. I think mostly people like coffee or the store may be famous for coffee

--Now by Daypart

SELECT Daypart, COUNT(*)
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Daypart
ORDER BY COUNT(*) DESC;  -- The store is busy in the afternoon 

-- now by DayType

SELECT DayType, COUNT(*)
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY DayType
ORDER BY COUNT(*) DESC;  -- During the weekdays the store make the highest sales. 
                         -- It may be beacause as people are heading towards office and they may be buying it.


-- let's look now at which month they sold the highest item

SELECT Month, COUNT(*)
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Month
ORDER BY COUNT(*) DESC;  -- In the month of March 


-- now by day

SELECT Day, COUNT(*)
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Day
ORDER BY COUNT(*) DESC; -- Though during the weekday they sold the highest item but from this we get its saturday when the store is busy.






