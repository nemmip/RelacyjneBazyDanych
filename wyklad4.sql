use Northwind
select * from Orders
select * from Customers
-- złączenia: mogą być różnych rodzajów/ typów
-- 1.najczęściej złączenia naturalne
-- 2.zamieniają dwie tabele w jedną
-- 3.złączenia mogą tworzyć łańcuchy
-- 4. z 2 i 3 wynika, że można złączać dowolną liczbę tabel
-- 5. to ze tabele nie są połączone relacją nie jest przeszkodą w ich złączeniu
-- 6. łączenie w oparciu  warunek powinno odbywać się według wyrażeń tego samego typu

-- podaj nazwę produktu i kategorii do której należy

select *
from Products

select *
from Categories

select *
from Products join Categories on Products.CategoryID = Categories.CategoryID
-- powstała tabela w której jest m+n kolumn i tyle wierszy ile produktów

select ProductName, Products.CategoryID
     ,CategoryName, Categories.CategoryID
from Products join Categories on Products.CategoryID = Categories.CategoryID

-- podaj ile zamówień złożyli poszczególni klienci
-- nazwa klienta, liczba zamówień
--1. łączenie
select *
from Orders join Customers
            on Orders.CustomerID = Customers.CustomerID
--2. wyciągnięcie tych informacji, których potrzebujemy
select Customers.CompanyName
     ,Orders.OrderID
from Orders join Customers
            on Orders.CustomerID = Customers.CustomerID
--3.Uporządkować wszystko
select Customers.CompanyName
     ,count(Orders.OrderID) as 'ile_zam'
from Orders join Customers
            on Orders.CustomerID = Customers.CustomerID
group by Customers.CompanyName
order by Customers.CompanyName

--podaj klientów, którzy kupowali produkty z więcej niż 7 kategorii
--1. zdefiniuj co chcesz uzyskac
-- nazwa klienta, liczba różnych kategorii, liczba kat>7
--2. gdzie to jest?
-- tabele customers i categories + tabele pośrednie orders, order details, products
--2.1
select *
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
--2.2
select C.CompanyName
     , Ca.CategoryName
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
order by C.CompanyName, Ca.CategoryName

--2.3
select C.CompanyName
     , count(Ca.CategoryName) as 'ile_kat' -- uwaga z powtórzeniami!
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
group by C.CompanyName
order by C.CompanyName
--2.4
select C.CompanyName
     , count(distinct Ca.CategoryName) as 'ile_kat' -- uwaga bez powtórzeń
     , count(Ca.CategoryName) as 'ile_kat_Z_powt'
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
group by C.CompanyName
order by C.CompanyName
--2.5
select C.CompanyName
     , count(distinct Ca.CategoryName) as 'ile_kat' -- uwaga bez powtórzeń
     , count(Ca.CategoryName) as 'ile_kat_Z_powt'
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
group by C.CompanyName
having count(distinct Ca.CategoryName)>7    -- ostateczny warunek
order by C.CompanyName

-- Podaj klientów którzy kupowali produkty z wszystkich kategorii
declare @ile_Kat int = (select COUNT(*)from Categories)
select C.CompanyName
     , count(distinct Ca.CategoryName) as 'ile_kat' -- uwaga bez powtórzeń
     , count(Ca.CategoryName) as 'ile_kat_Z_powt'
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
group by C.CompanyName
having count(distinct Ca.CategoryName)=@ile_Kat    -- ostateczny warunek
order by C.CompanyName

-- podaj produkty, które przez klientów były kupowane tylko raz
select C.CompanyName
     , P.ProductName
     , count(P.ProductName) as 'ile_razy'
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
    join Categories Ca
                on P.CategoryID = Ca.CategoryID
group by C.CompanyName, P.ProductName
having count(P.ProductName)=1    -- ostateczny warunek
order by C.CompanyName, P.ProductName

-- wersja 2
go
create view  klienci_i_zam
as
    select C.*
         ,O.CustomerID as 'CustomerId2'
        , O.EmployeeID
        , O.OrderID
from Customers C join Orders O
                on C.CustomerID = O.CustomerID

select * from klienci_i_zam
-- pytania o dane których NIE ma w bazie
-- podaj produkty, których nie kupowali klienci z Niemiec
-- unikalnych produktów kupowanych przez klientów z Niemiec
select P.ProductName --distinct można użyć lub
from Customers C join Orders O
                on C.CustomerID = O.CustomerID
    join [Order Details] OD
                on O.OrderID = OD.OrderID
    join Products P
                on OD.ProductID = P.ProductID
where C.Country = 'Germany'
group by P.ProductName      --group by
--having count(P.ProductName)=0    -- ostateczny warunek
order by P.ProductName
-- finalnie
select * -- od pełnej listy
from Products
where ProductName not in(   --odejmij te które były kupowane
                        select P.ProductName --distinct można użyć lub
                    from Customers C join Orders O
                                    on C.CustomerID = O.CustomerID
                        join [Order Details] OD
                                    on O.OrderID = OD.OrderID
                        join Products P
                                    on OD.ProductID = P.ProductID
                    where C.Country = 'Germany'
                    group by P.ProductName      --group by
                    --having count(P.ProductName)=0    -- ostateczny warunek
    )