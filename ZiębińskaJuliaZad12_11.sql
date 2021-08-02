use Northwind
declare @minCatID int = (select min(CategoryID) from Categories)
declare @minName varchar(15) = (select CategoryName from Categories where CategoryID=@minCatID)
select *,
       lead(CategoryName,1,@minName) over (order by CategoryID asc) as nextCatName
from Categories