------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, stanowisko (tytuł) pracownika.
---------- Dodatkowo przetłumacz wartość kolumny stanowisko i wyświetl je w nowej kolumnie:
---------- "Vice President, Sales" = Wiceprezes,
---------- "Inside Sales Coordinator" = Wewnętrzny Koordynator Sprzedaży,
---------- w pozostałych przypadkach ustaw wartość "Przedstawiciel Handlowy".
---------- Uwzględnij pracowników którzy mają inne imię niż pracownik o nazwisku "Buchanan".
---------- Sortowanie malejące po nazwisku i imieniu.
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------
use northwind
declare @imie varchar(20) = (select FirstName from Employees where LastName like 'Buchanan')
select FirstName,
       LastName,
       Title,
       case
        when Title like 'Vice President, Sales' then 'Wiceprezes'
        when Title like 'Inside Sales Coordinator' then 'Wewnętrzny Koordynator Sprzedaży'
        else 'Przedstawiciel Handlowy'
    end as 'Stanowisko'
from Employees
where FirstName not like @imie
order by LastName, FirstName desc


------------------------------------------------------------------------------------------
---------- Znajdź zamówienia ZREALIZOWANE w kwietniu.
---------- Wypisz nazwę firmy, osobę kontaktową, telefon,
---------- sumę opłat frachtowych z kwietnia dla danego klienta, oraz łączną sumę opłat
---------- frachtowych za zamówienia ZREALIZOWANE w kwietniu dla wszystkich klientów.
---------- Wynik posortuj malejąco względem czwartej kolumny.
------------------------------------------------------------------------------------------
---------- 64 rows
------------------------------------------------------------------------------------------
select C.CompanyName,
       C.ContactName,
       C.Phone,
       SUM(Freight) as 'SumaOplatKlient'
from Orders O join Customers C on C.CustomerID = O.CustomerID
where MONTH(OrderDate) = 4
group by C.CompanyName, C.ContactName, C.Phone