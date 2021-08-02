use Northwind
select distinct P.ProductName,
       C.CategoryName,
       P.UnitPrice,
       min(OD.UnitPrice) over (partition by OD.ProductID) as 'minCenaSprzed',
       max(OD.UnitPrice) over ( partition by OD.ProductID) as 'maxCenaSprzed',
       avg(OD.UnitPrice) over ( partition by OD.ProductID) as 'sredCenaSprzed',
       avg(P.UnitPrice) over () as 'sredCenaWszyProd',
       min(P.UnitPrice) over () as 'minCenaWszyProd',
       max(P.UnitPrice) over () as 'maxCenaWszyProd',
       avg(OD.UnitPrice) over () as 'sredCenaSprzedProd',
       min(OD.UnitPrice) over () as 'minCenaSprzedProd',
       max(OD.UnitPrice) over () as 'maxCenaSprzedProd',
       avg(P.UnitPrice) over ( partition by P.CategoryID) as 'sredCenaKat',
       min(P.UnitPrice) over ( partition by P.CategoryID) as 'minCenaKat',
       max(P.UnitPrice) over ( partition by p.CategoryID) as 'maxCenaKat'
from Products P join Categories C on C.CategoryID = P.CategoryID
join [Order Details] OD on P.ProductID = OD.ProductID

select
       CategoryID,
       avg(UnitPrice)
from Products
group by CategoryID

