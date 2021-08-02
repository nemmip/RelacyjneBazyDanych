use Northwind
select rank() over (order by OrderDate asc) as Rank,
       *
from Orders