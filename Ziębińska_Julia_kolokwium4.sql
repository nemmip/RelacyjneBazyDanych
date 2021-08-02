use northwind
------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko i wiek pracownika podczas przyjmowania do pracy.
---------- Rekordy posortuj rosnąco po wieku przyjęcia do pracy.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select FirstName
     ,LastName
     ,DATEDIFF(yy,BirthDate,HireDate) as 'Wiek'
from Employees
ORDER BY Wiek


------------------------------------------------------------------------------------------
---------- Wyświetl UNIKALNY opis terytorium i identyfikator regionu
---------- dla przypadków, w których opis terytorium zaczyna się na jedną z liter
---------- imienia "szymon". Rekordy posortowane w kolejności odwrotnej do alfabetycznej
---------- względem opisu terytorium. (Przetłumacz nazwy kolumn).
------------------------------------------------------------------------------------------
---------- 15 rows
------------------------------------------------------------------------------------------
select TerritoryDescription as 'OpisTerytorium'
     ,RegionID as 'IDRegionu'
from Territories
where TerritoryDescription like '[szymon]%'
order by TerritoryDescription desc

------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko i tydzień, w którym urodził się pracownik,
---------- dla 60% pracowników, których długość nazwiska jest większa od 7 znaków.
---------- Wyniki wyświetl w kolejności rosnącej względem tygodnia.
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
select top 60 percent FirstName
     ,LastName
     ,DATEPART(WEEK, BirthDate) as 'Tydzien'
from Employees
where LEN(LastName)>7
order by Tydzien asc