use northwind
-- pokaż pracowników którzy zrealizowali więcej niż 70 zamówień
-- 2 kolumny: IdPracownika, liczba zam
-- źródło: orders

select *
from Orders

select EmployeeID
     ,COUNT(OrderID) as 'Ile_zam'
from Orders
group by EmployeeID
having COUNT(OrderID)>70 -- having to jest where ale dla grup

-- podaj pracowików, którzy zrealizowali więcej niż 70 zamówień w roku 1997
select EmployeeID
     ,COUNT(OrderID) as 'Ile_zam'
from Orders
    where YEAR(OrderDate) = 1997
    group by EmployeeID
having COUNT(OrderID)>70
order by COUNT(OrderID) desc -- 'Ile_zam' desc lub (najmniej zalecana) 2 desc czyli sortuj względem drugiej kolumny

-- DZIELENIE ZADAŃ
-- wyrażenia CTE
with chwilowa
    as (
        select EmployeeID
                ,COUNT(OrderID) as 'Ile_zam'
        from Orders
            group by EmployeeID
    )
select *
from chwilowa
where Ile_zam > 70
order by Ile_zam desc -- w tym przypadku order by możemy użyć tylkow kontekście wywołania chwilowej tabeli

-- ile jest produktów  w każdej kategorii
select CategoryID
     ,COUNT(ProductID) as 'Ile_prod'
from Products
    group by CategoryID
order by 'Ile_prod' desc

-- podaj 3 pierwsze kateogrie pod względem liczebności z uwzględniemiem dubli
select top 3 with ties
    CategoryID
     ,COUNT(ProductID) as 'Ile_prod'
from Products
    group by CategoryID
order by 'Ile_prod' desc -- order by jest jedyną klauzurą która toleruje wywołanie przez alias
 -- Kolejność działań
--1. ustalamy źródło (from)
--2. co znajduje się w źródle (select)
--3.Odsianie rekordów (where)
--4.grupowanie (group by)
--5.Odsianie grup (having)
--6.sortowanie i zwrócenie wyniku [order by]

-- zapytania select możemy zagnieżdżać
-- select wewnętrzny musi być w nawiasie
-- select wewnętrzny musi zwracać wartości w formie i typie pasującej do selecta zewnętrznego

-- nie ma ograniczeń w możliwościach zagnieżdżania selectów
select *
from (select EmployeeID
          ,COUNT(OrderID) as 'Ile_zam'
        from Orders
        where YEAR(OrderDate)=1997
        group by EmployeeID) chwilowa
where Ile_zam>70

-- jaki procent zamówień zrealizowali poszczególni pracownicy
-- ile kolumn: EmployeeId, Liczba zam, udział procentowy
-- źródło: orders
select COUNT(OrderID) as Ile_zam
from Orders
-- wyszło 830
-- NIE WOLNO WPISYWAĆ DO ZAPYTAŃ STAŁYCH!!
select EmployeeID
     ,COUNT(OrderID) as Ile_zam
     ,100* cast(COUNT(OrderID)as float)/ -- jawna konwersja na typ float
            (select COUNT(OrderID) as Ile_zam
            from Orders) as Procent
from Orders
group by EmployeeID

-- zmienne
declare @ile_razem_zam int = (select COUNT(OrderID) from Orders)
select EmployeeID
     ,COUNT(OrderID) as Ile_zam
     ,100*cast(COUNT(OrderID)as float)
        /@ile_razem_zam as Procent
from Orders
    group by EmployeeID
-- instrukcja go
-- rozpoczęcie nowego kontekstu
go
declare @ile_razem_zam int = (select OrderID from Orders) -- zmienna musi zwracać pojedynczą wartość!!!!
-- inny sposób przypisania wartości do zmiennej
go
declare @ile_razem_zam int
set @ile_razem_zam = (select COUNT(OrderID)from Orders)
select EmployeeID
     ,COUNT(OrderID) as Ile_zam
     ,100*cast(COUNT(OrderID)as float)
        /@ile_razem_zam as Procent
from Orders
    group by EmployeeID

-- ##############
declare @i int
set @i = 1
set @i +=1
print @i

-- widoki
-- chcemy utrwalić zapytanie
-- NIE UTRWALAMY DANYCH tylko sam select
-- do tego celu służą widoki
go
create view  procent_real_zam --polecenie create które coś w bazie tworzy i jest uniwersalne (nie tworzy tylko widoków)
as                              -- tworzy widok, ale go nie urucamia
    select EmployeeID
         ,COUNT(OrderID) as Ile_zam
         ,100* cast(COUNT(OrderID)as float)/ -- jawna konwersja na typ float
                (select COUNT(OrderID) as Ile_zam
                from Orders) as Procent
    from Orders
    group by EmployeeID
-- wchodzi na stałe do bazy, dopóki nie usuniemy tego jawnie, to tam zostanie
-- zasady tworzenia widoków
--widok jest efektem polecenia select!
--1.Widoki traktujemy jak tabele
--2.Wszystkie kolumny muszą być nazwane
--3. Nies stosujemy order by
--4. Widok NIE przechowuje danych - jest uruchamiany zawsze gdy jest wywoływany
-- a więc zwraca aktualne dane

select *
from procent_real_zam
where Procent>10 -- pracownicy z udziałem większym niż 10%

-- edycja widoków już utworzonych i istniejących!
alter view  procent_real_zam
as
    select EmployeeID
         ,COUNT(OrderID) as Ile_zam
         ,100* cast(COUNT(OrderID)as float)/ -- jawna konwersja na typ float
                (select COUNT(OrderID) as Ile_zam
                from Orders) as Procenty
    from Orders
    group by EmployeeID
-- brutalne kasowanie widoku
drop view  procent_real_zam -- usunięcie widoku