use northwind
select s.CompanyName,
       p.ProductName,
       s.Country,
       s.City,
       p.UnitPrice,
       avg(p.UnitPrice) over () as 'srednia_wszystkich_prod',
       min(p.UnitPrice) over () as 'minimalna_wszystkich_prod',
       max(p.UnitPrice) over () as 'maksymalna_wszystkich_prod',
       avg(p.UnitPrice) over ( partition by s.CompanyName) as 'srednia_dostawca',
       min(p.UnitPrice) over ( partition by s.CompanyName) as 'minimalna_dostawca',
       max(p.UnitPrice) over ( partition by s.CompanyName) as 'maksymalna_dostawca',
       avg(p.UnitPrice) over ( partition by s.Country) as 'srednia_kraj',
       min(p.UnitPrice) over ( partition by s.Country) as 'minimalna_kraj',
       max(p.UnitPrice) over ( partition by s.Country) as 'maksymalna_kraj',
       avg(p.UnitPrice) over ( partition by s.Country,s.City) as 'srednia_kraj_miasto',
       min(p.UnitPrice) over ( partition by s.Country,s.City) as 'minimalna_kraj_miasto',
       max(p.UnitPrice) over ( partition by s.Country,s.City) as 'maksymalna_kraj_miasto'
from Suppliers s join Products p on s.SupplierID = p.SupplierID
