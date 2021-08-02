use Northwind
create view Zamowienia
    as
with chwilowa
as (
    select top 5 COUNT(O.OrderID) as 'Liczba_zam'
               ,O.CustomerID as 'ID'
    from Orders O join Customers C on C.CustomerID = O.CustomerID
    group by O.CustomerID
    order by Liczba_zam desc
    )
select *
from chwilowa join Customers on chwilowa.ID = Customers.CustomerID

select *
from Zamowienia
