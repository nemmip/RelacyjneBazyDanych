use Northwind
select dense_rank() over (order by OrderDate asc) as Rank,
       *
from Orders