use Northwind
declare @maxCatID int = (select max(CategoryID) from Categories)
declare @maxName varchar(15) = (select CategoryName from Categories where CategoryID=@maxCatID)
select *,
       lag(CategoryName,1,@maxName) over (order by CategoryID asc) as previousCatName
from Categories