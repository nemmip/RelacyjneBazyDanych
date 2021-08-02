use Northwind
select O.OrderID,
       O.OrderDate,
       OD.UnitPrice*OD.Quantity as 'Wartosc',
       O.ShippedDate,
       lag(OD.UnitPrice*OD.Quantity,1,0) over ( order by O.ShippedDate asc) as 'WartZamPop',
       lag(O.ShippedDate,1,null) over ( order by O.ShippedDate asc) as 'DataPoprzZam'
from Orders O join [Order Details] OD on O.OrderID = OD.OrderID