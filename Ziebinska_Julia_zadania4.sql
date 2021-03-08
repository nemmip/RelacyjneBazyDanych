use Northwind
------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów.
------------------------------------------------------------------------------------------
---------- COUNT()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT CustomerID)
from Customers



------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów posiadających fax.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT Fax)
from Customers


------------------------------------------------------------------------------------------
---------- Wyświetl liczbę zrealizowanych zamówień do poszczególnych miast.
------------------------------------------------------------------------------------------
---------- GROUP BY
------------------------------------------------------------------------------------------
---------- Użycie funkcji agregacji wymaga klauzuli GROUP BY.
---------- W klauzuli GROUP BY należy wskazać wszystkie elementy
---------- które znajdują się w klauzuli SELECT i NIE należą do funkcji agregacji.
------------------------------------------------------------------------------------------
---------- 70 rows
------------------------------------------------------------------------------------------
 SELECT DISTINCT ShipCity, COUNT(ShipCity)
from Orders
GROUP BY ShipCity



------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i sumę jego opłat frachtowych,
---------- dla zamówień z roku 1998. Sortowanie od największej opłaty.
------------------------------------------------------------------------------------------
---------- SUM()
------------------------------------------------------------------------------------------
---------- 81 rows
------------------------------------------------------------------------------------------
SELECT DISTINCT CustomerID
              ,SUM(Freight) as 'Sum'
from Orders
where DATEPART(year, OrderDate)=1998
group by CustomerID
order by Sum desc



------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i sumę jego opłat frachtowych,
---------- dla zamówień z dnia 17 marca. Identyfikator klienta nie może zawierać "aa".
---------- Sortowanie od najniższej do najwyższej opłaty (rosnące).
------------------------------------------------------------------------------------------
---------- 4 rows
------------------------------------------------------------------------------------------
SELECT CustomerID, SUM(Freight) as 'Sum'
from Orders
where (DATEPART(day, OrderDate)=17 and DATEPART(month, OrderDate)=03)
and CustomerID not like '%aa%'
GROUP BY CustomerID
order by Sum asc



------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i średnią opłatę frachtową dla poszczególnych
---------- miesięcy.
------------------------------------------------------------------------------------------
---------- AVG()
------------------------------------------------------------------------------------------
---------- 526 rows
------------------------------------------------------------------------------------------
SELECT CustomerID, DATEPART(MONTH, OrderDate) as Month, AVG(DISTINCT Freight) as 'Average'
from Orders
GROUP BY DATEPART(MONTH, OrderDate),CustomerID


------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator kategorii, najmniejszą, największą i średnią cenę oraz
---------- liczbę produktu w poszczególnych kategoriach.
---------- Wyniki posortuj malejąco po licznie produktów.
------------------------------------------------------------------------------------------
---------- MAX(), MIN()
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------
select CategoryID
     , MIN(UnitPrice) as Minimum
     , MAX(UnitPrice) as Maximum
     , AVG(UnitPrice) as Average
     , SUM(UnitsInStock) as Quantinity
from Products
group by CategoryID
order by Quantinity desc



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, jego cenę, nazwę kategorii do której należy oraz
---------- opis kategorii.
------------------------------------------------------------------------------------------
---------- INNER JOIN
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
select ProductName, UnitPrice, CategoryName, Description
from Products
INNER JOIN Categories C on Products.CategoryID = C.CategoryID

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------




	
------------------------------------------------------------------------------------------
---------- Wyświetl datę zamówienia, identyfikator klienta, cenę jaką zapłacono za produkt,
---------- zastosowaną zniżkę, nazwę produktu i jego standardową cenę.
------------------------------------------------------------------------------------------
---------- 2155 rows
------------------------------------------------------------------------------------------
select OrderDate
     , CustomerID
     , od.UnitPrice as 'ZaplaconaCena'
     , Discount, ProductName
     , p.UnitPrice as 'StandardowaCena'
from Orders o
    INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
    INNER JOIN Products p ON od.ProductID=p.ProductID
