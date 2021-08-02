use Northwind
select row_number() over (order by UnitPrice asc ) as 'KolejnoscCena'
       ,*
from Products