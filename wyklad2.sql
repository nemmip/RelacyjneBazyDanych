use Northwind

select *
from Products
where UnitPrice >30
-- podaj produkty i cenie z przedziału 20,30
select *
from Products
where UnitPrice>=20 and UnitPrice <=30
order by UnitPrice desc          -- zawsze na końcu, należy unikać

-- czy wpływa na zawartość wyniku? NIE
-- czy kolejność ma wpływ na dalsze działania?
-- sortowanie jest kosztochłonne
-- sortowanie działa jak tama w potoku
-- bez klauzuli order by kolejność w wyniku jest nieustalona
-- porzadek rosnący asc
-- porządek malejący desc
select *
from Products
where UnitPrice>=20 and UnitPrice <=30
order by UnitPrice desc

select *
from Products
where UnitPrice between 20 and 30
order by UnitPrice desc

-- podaj produkty o cenie spoza przedziału [20,30]
select *
from Products
where not (UnitPrice>=20 and UnitPrice <=30)  -- zaprzeczenie warunkowi, konieczne są nawiasy
order by UnitPrice desc

select *
from Products
where  UnitPrice<20 or UnitPrice >30  -- odwrócenie nawiasów i warunków logicznych
order by UnitPrice desc

select *
from Products
where not UnitPrice between 20 and 30-- zaprzeczenie between
order by UnitPrice desc

-- pokaż n najtańszych i n najdroższych produkt
select top 3 *
from Products
order by UnitPrice asc -- najtańsze bo rosnąco

select top 3 *
from Products
order by UnitPrice desc -- najdroższe bo malejąco

-- które zamówienia były spóźnione i o ile?
select *
from Orders
where ShippedDate > RequiredDate

select
    IIF(ShippedDate > RequiredDate, 'DELAYED','OK') as 'Status'
     ,*
from Orders

-- delayed, ok, w toku, dokładnie na czas JIT

select
    case
        when ShippedDate > RequiredDate then 'DELAYED'
        when ShippedDate=RequiredDate then 'J-I-T'
        when ShippedDate is NULL then 'W toku'
        else 'OK'
    end as 'Status'
     ,case
        when ShippedDate>=RequiredDate then  cast(ShippedDate-RequiredDate as int)
        when ShippedDate is NULL then null
        else cast(ShippedDate-RequiredDate as int)*-1
    end as 'Ile Dni'
     ,*
from Orders


-- niektóre wyrażenia nie potrzebują operacji from
select 2+2 as 'wyr1', 3+5 as 'wyr2'
select GETDATE() as 'teraz', GETDATE()+1 as 'jutro'
select GETDATE() -97900
select GETDATE()

-- ile jest zamówień poszczególnych rodzajów

--ile jest produktów z każdej kategorii
select *
from Products

-- odpowiedź będzie zawierala 2 kolumny 1 - id_kategorii, 2 -liczebność produktów w katgorii.
-- funkcje agregujące
-- sum, count, avg (średnia), max, min
-- wymagają podania według czego agregujemy

select
    CategoryID
     ,count(ProductID) as 'Ile_Produktow'
from Products
group by  CategoryID
order by CategoryID asc
-- w klauzuli group by wskazujemy wszystkie wyrażenia z select
-- które NIE zawierają funkcji agregacji

select
    case
        when ShippedDate>Orders.RequiredDate then 'DELAYED'
        when  ShippedDate=RequiredDate then 'J-I-T'
        when ShippedDate is null then 'W toku'
        else 'OK'
    end as 'Status'
     ,COUNT(OrderID) as 'ile_zam'
from Orders
group by
    case
        when ShippedDate>Orders.RequiredDate then 'DELAYED'
        when  ShippedDate=RequiredDate then 'J-I-T'
        when ShippedDate is null then 'W toku'
        else 'OK'
    end