use Northwind
------------------------------------------------------------------------------------------
---------- Stwórz widok wyświetlający imię, nazwisko,
---------- stanowisko i datę zatrudnienia pracowników.
------------------------------------------------------------------------------------------
---------- CREATE VIEW
------------------------------------------------------------------------------------------
create view Pracownicy
as
   select FirstName
        ,LastName
        ,Title
        ,HireDate
from Employees




------------------------------------------------------------------------------------------
---------- Wyświetl dane personalne pracowników. Wykorzystaj wcześniej stworzony widok.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select * from Pracownicy


------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko i rok zatrudnienia pracowników.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select FirstName
     ,LastName
     ,HireDate
from Pracownicy



------------------------------------------------------------------------------------------
---------- Stwórz widok wyświetlający dane pracowników z regionu "WA".
------------------------------------------------------------------------------------------
create view PracownicyWA
as
    select *
    from Employees
    where Region = 'WA'


------------------------------------------------------------------------------------------
---------- Wyświetl dane pracowników z regionu "WA".
------------------------------------------------------------------------------------------
---------- 5 rows
------------------------------------------------------------------------------------------
select * from PracownicyWA



------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto i opis terytorium pracowników.
---------- Wykorzystaj wcześniej stworzony widok.
------------------------------------------------------------------------------------------
---------- 20 rows
------------------------------------------------------------------------------------------
select FirstName
     ,LastName
     ,City
     ,TerritoryDescription
from PracownicyWA join EmployeeTerritories ET on PracownicyWA.EmployeeID = ET.EmployeeID
    join Territories T on ET.TerritoryID = T.TerritoryID




------------------------------------------------------------------------------------------
---------- Wyświetl kraj, liczbę zamówień i % udział zamówień.
------------------------------------------------------------------------------------------
---------- 21 rows
------------------------------------------------------------------------------------------
---------- DECLARE, SET
------------------------------------------------------------------------------------------
declare @liczba_wszystkich_zam int = (select COUNT(OrderID) from Orders)
print @liczba_wszystkich_zam
select ShipCountry
     ,COUNT(OrderID) as 'Liczba_Zam'
     ,100 * cast(COUNT(OrderID)as float)
         /@liczba_wszystkich_zam as 'Udzial_zam'
from Orders
group by ShipCountry