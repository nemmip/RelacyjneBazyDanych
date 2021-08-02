use Northwind
-- działania bezpośrednie na zbiorach

-- warunek jest taki aby struktury zbiorów były identycze
-- kolumny i ich typy
-- podaj produkty nie kupowane w niemczech
-- odejmowanie zbiorów
-- wszystkie produkty minus te które były kupowane

select ProductName
from Products
except
select P.ProductName
    from Customers C join Orders O
                     on C.CustomerID = O.CustomerID
        join [Order Details] OD
                    on O.OrderID = OD.OrderID
        join Products P
                    on OD.ProductID = P.ProductID
        where C.Country = 'Germany'
         group by P.ProductName
-- except za wyjątkiem(minus)
-- union  - dodawanie elementów zbiorów bez powtórzeń
-- union all - j.w ale z powtórzeniami
-- intersect - iloczyn zbiorów

--pokaż klientów z Francji lub Niemiec
select CompanyName
     ,Country
from Customers
where Country in ('Germany','France')

-- równoważnie
select CompanyName
     ,Country
from Customers
where Country = 'Germany'
union
select CompanyName
     ,Country
from Customers
where Country = 'France'
-- union all
select CompanyName
     ,Country
from Customers
where Country = 'Germany'
union all
select CompanyName
     ,Country
from Customers
where Country = 'France'
union
select ' ', 'wybierz'
-- podaj produkty ktore były kupowane zarówno w Niemczech jak i we Francji
select *
from (
     select distinct P.ProductName
              , C.Country
              ,COUNT(*) as ile
from Customers C
         join Orders O
              on C.CustomerID = O.CustomerID
         join [Order Details] OD
              on O.OrderID = OD.OrderID
         join Products P
              on OD.ProductID = P.ProductID
where C.Country = 'Germany'
group by P.ProductName, C.Country

         )G
        join
        (
            select distinct P.ProductName
              , C.Country
              ,COUNT(*) as ile
            from Customers C
         join Orders O
              on C.CustomerID = O.CustomerID
         join [Order Details] OD
              on O.OrderID = OD.OrderID
         join Products P
              on OD.ProductID = P.ProductID
        where C.Country = 'France'
        group by P.ProductName, C.Country
            )F
on G.ProductName=F.ProductName
-- skrócenie kodu
-- procedury
alter procedure prod_z_kraj(@kraj nvarchar(15))
as
    select distinct P.ProductName
                    ,C.Country
                    ,COUNT(*) as ile
    from Customers C join Orders O on C.CustomerID = O.CustomerID
    join [Order Details] [O D] on O.OrderID = [O D].OrderID
    join Products P on [O D].ProductID = P.ProductID
    where C.Country = @kraj
group by P.ProductName, C.Country
exec prod_z_kraj @kraj = 'France'
--nie działa
select *
from
     (exec prod_z_kraj @kraj='Germany')G
    join
         (exec prod_z_kraj @kraj='France')F
    on G.ProductName = F.ProductName
go
-- intersect
select distinct P.ProductName
from Customers C
         join Orders O
              on C.CustomerID = O.CustomerID
         join [Order Details] OD
              on O.OrderID = OD.OrderID
         join Products P
              on OD.ProductID = P.ProductID
where C.Country = 'Germany'
intersect
select distinct P.ProductName
    from Customers C
         join Orders O
              on C.CustomerID = O.CustomerID
         join [Order Details] OD
              on O.OrderID = OD.OrderID
         join Products P
              on OD.ProductID = P.ProductID
    where C.Country = 'France'
-- złączenia zewnętrzne
-- które produktu nie były kupowane we Francji
create view tab_1
as
    select 'a' as tekst, 1 as 'liczba'
union
select 'c',3
union
select 'e',5
union
select 'f',7

select * from tab_1

create view tab_2
as
    select 'a' as tekst2, 2 as 'liczba'
union
select 'b',4
union
select 'e',6
union
select 'f',7
union
select 'g',8
union
select 'i',9

select * from tab_2
-- złączenie naturalne
select *
from tab_1 join tab_2
    on tab_1.tekst = tab_2.tekst2 -- szuka identycznych wartości w kolumnie
    and tab_1.liczba=tab_2.liczba

-- pokaż wszystkie rekordy z tab_1 i te z tab_2 które mają identyczne teksty
select *
from tab_1
select *
from tab_2

--złączenie lewe
select *
from tab_1 left join tab_2
                on tab_1.tekst = tab_2.tekst2

select *
from tab_1 left outer join tab_2
    on tab_1.tekst = tab_2.tekst2
    and tab_1.liczba = tab_2.liczba

select *
from tab_1 right outer join tab_2
    on tab_1.tekst = tab_2.tekst2
    and tab_1.liczba = tab_2.liczba
-- które teksty z tab_1 nie występują w tab_2
select *
from tab_1 left outer join tab_2
    on tab_1.tekst=tab_2.tekst2
where tab_2.tekst2 is null

-- które teksty z tab_2 nie występują w tab_1
select *
from tab_2 left outer join tab_1
    on tab_1.tekst=tab_2.tekst2
where tab_1.tekst is null

-- pełne złączenie zewnętrzne
select *
from tab_1 full outer join tab_2
    on tab_1.tekst=tab_2.tekst2

-- sposób kolejny
-- dwie tabele i złączmy je zewnętrznie
-- pełna lista prod
select *
from
    (select * from Products)P
    --lista produktów sprzedawanych we Francji
    left outer join
    (select distinct P.ProductName
        from Customers C
             join Orders O
                  on C.CustomerID = O.CustomerID
             join [Order Details] OD
                  on O.OrderID = OD.OrderID
             join Products P
                  on OD.ProductID = P.ProductID
        where C.Country = 'France')F
    on P.ProductName = F.ProductName
    where F.ProductName is null

-- złączenie kartezjańskie
select *
from tab_1, tab_2
-- zwraca wszystkie pary takie, że 1 element jest z tab_1 a drugi z tab_2
select *
from Customers,Categories
order by CompanyName
-- liczba rekordów iloczyn liczby rekordów z poszczególnych tabel
select *
from tab_1 join tab_2
on tab_1.tekst>tab_2.tekst2