------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator zamówienia, datę zamówienia, nazwę produktu,
---------- cenę produktu (po której został sprzedany), zniżkę.
---------- Wyświetl również dodatkową kolumnę z informacją o "Wysokość zniżki".
---------- 0% - Brak
---------- Do 5% włącznie - Mała
---------- Powyżej 5% - Duża
---------- Wynik zapytani posortuj rosnąco po zniżce.
------------------------------------------------------------------------------------------
---------- 2155 rows
------------------------------------------------------------------------------------------
use northwind
select 0.OrderID
     ,0.OrderDate
     ,P.ProductName
     ,[O D].UnitPrice
     ,[O D].Discount
     ,CASE
        when [O D].Discount = 0 then 'Brak'
        when [O D].Discount <=0.05 then 'Mała'
        when [O D].Discount >0.05 then 'Duża'
    end as 'Wysokość znizki'
from Orders O join [Order Details] [O D]
    on O.OrderID = [O D].OrderID join Products P
        on P.ProductID = [O D].ProductID
order by [O D].Discount asc


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, najmniejszy zapas
---------- (przy określonej nazwie dostawcy i telefonie),
---------- nazwę dostawcy, telefon. Wyniki posortuj rosnąco po najmniejszym zapasie.
---------- Załóż, że nie wszystkie produkty muszą mieć dostawcę (ODPOWIEDNIE ZŁĄCZENIE).
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
select P.ProductName
     ,P.UnitsInStock
     ,S.CompanyName
     ,S.Phone
from Products P left join Suppliers S on P.SupplierID = S.SupplierID
order by P.UnitsInStock asc