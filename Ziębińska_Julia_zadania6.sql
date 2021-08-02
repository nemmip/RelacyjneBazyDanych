use Northwind
------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz liczbę jego zamówień.
------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------
select CompanyName, count(O.CustomerID) as LiczbaZamówień
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
group by CompanyName



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z roku 1996.
------------------------------------------------------------------------------------------
---------- 67 rows
------------------------------------------------------------------------------------------
select CompanyName, sum(O.Freight) as SumaOpłatFrachtowych
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
where YEAR(OrderDate)='1996'
group by CompanyName



------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów z poszczególnych krajów jeżeli jest ich co najmniej 5.
------------------------------------------------------------------------------------------
---------- HAVING
------------------------------------------------------------------------------------------
---------- 7 rows
------------------------------------------------------------------------------------------
select count(Country) as LiczbaKlientow, Country
from Customers
group by Country
having count(Country)>=5



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z kwietnia.
------------------------------------------------------------------------------------------
---------- 59 rows
------------------------------------------------------------------------------------------
select CompanyName, sum(O.Freight) as SumaOpłatFrachtowych
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
where MONTH(OrderDate)='4'
group by CompanyName


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz średnią opłatę frachtową dla zamówień
---------- składanych w poszczególnych miesiącach.
------------------------------------------------------------------------------------------
---------- 526 rows
------------------------------------------------------------------------------------------
select CompanyName, MONTH(OrderDate) as Miesiąc, avg(Freight) as ŚredniaOpłataFrachtowa
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
group by CompanyName, MONTH(OrderDate)




------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta, produktu oraz liczbę sprzedanych produktów.
------------------------------------------------------------------------------------------
---------- 1685 rows
------------------------------------------------------------------------------------------
select CompanyName,ProductName,sum(od.Quantity) as LiczbaSprzedanychProduktów
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
inner join [Order Details] od on O.OrderID = od.OrderID
inner join Products P on od.ProductID = P.ProductID
group by CompanyName, ProductName



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę dostawcy, kraj oraz maksymalną cenę jednostkową produktów
---------- uwzględniając tylko "USA" i "Canada".
------------------------------------------------------------------------------------------
---------- 6 rows
------------------------------------------------------------------------------------------
select CompanyName,Country, max(UnitPrice) as MaksymalnaCena
from Suppliers
inner join Products P on Suppliers.SupplierID = P.SupplierID
where Country='USA' or Country='Canada'
group by CompanyName, Country



------------------------------------------------------------------------------------------
----------  Wyświetl wartość zamówień w poszególnych miesiącach.
----------  Podziel zamówienia na duże ( > 100000 $) i małe.
------------------------------------------------------------------------------------------
---------- CASE WHEN ... THEN ... ELSE ... END
------------------------------------------------------------------------------------------
---------- 12 rows
------------------------------------------------------------------------------------------
select distinct month(OrderDate) as Miesiac
    ,case
        when SUM(UnitPrice*Quantity)>100000 then 'BIG'
        else 'SMALL'
    end
    ,SUM(UnitPrice*Quantity) as WartoscZamowien
from [Order Details]
inner join Orders O on O.OrderID = [Order Details].OrderID
group by month(OrderDate)




------------------------------------------------------------------------------------------
----------  Wyświetl wartość zamówień w poszególnych miesiącach.
----------  Podziel zamówienia na małe ( < 100000 $) i duże.
------------------------------------------------------------------------------------------
---------- IIF
------------------------------------------------------------------------------------------
---------- 12 rows
------------------------------------------------------------------------------------------
select distinct month(OrderDate) as Miesiac
              ,IIF(SUM(UnitPrice*Quantity)>100000,'BIG','SMALL')
              ,SUM(UnitPrice*Quantity) as WartoscZamowien
from [Order Details]
inner join Orders O on O.OrderID = [Order Details].OrderID
group by month(OrderDate)
