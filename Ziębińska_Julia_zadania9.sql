------------------------------------------------------------------------------------------
---------- Stwórz bazę o nazwie "test".
------------------------------------------------------------------------------------------
---------- CREATE DATABASE
------------------------------------------------------------------------------------------
create DATABASE test



------------------------------------------------------------------------------------------
---------- Usuń bazę o nazwie "test".
------------------------------------------------------------------------------------------
---------- DROP DATABASE
------------------------------------------------------------------------------------------
drop database test



------------------------------------------------------------------------------------------
---------- Zmień wartość jednostek na zamówieniu z tabeli produkty na 3.
------------------------------------------------------------------------------------------
---------- UPDATE
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
use Northwind
update dbo.Products
set dbo.Products.UnitPrice = 3



------------------------------------------------------------------------------------------
---------- Ustaw wartość UnitsOnOrder na 50 dla produktów z kategorii owoce morza.
------------------------------------------------------------------------------------------
---------- 12 rows
------------------------------------------------------------------------------------------
use Northwind
declare @categoryID int = (select CategoryID from Categories where CategoryName='Seafood')
update dbo.Products
set dbo.Products.UnitsOnOrder = 50
where CategoryID=@categoryID


------------------------------------------------------------------------------------------
---------- Przelicz cenę produktów z dolarów na złotówki po kursie 3.78.
---------- Wyniki zaokrąglij do drugiego miejsca po przecinku.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
use Northwind
update dbo.Products
set dbo.Products.UnitPrice = ROUND(UnitPrice*3.78,2)



------------------------------------------------------------------------------------------
---------- Zamień wszystkie litery nazwy produktu na duże.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
use Northwind
update dbo.Products
set dbo.Products.ProductName = UPPER(ProductName)



------------------------------------------------------------------------------------------
---------- Dodaj nowego pracownika. Wykorzystaj własne lub przykładowe dane.
---------- Uzupełnij kolumny: imię, nazwisko, tytuł, data urodzenia, data zatrudnienia,
---------- ulica, miasto, region, kod pocztowy, państwo, identyfikator przełożonego.
------------------------------------------------------------------------------------------
---------- INSERT INTO
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
use Northwind
insert into Northwind.dbo.Employees(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, PostalCode, Country,ReportsTo)
values ('Ziębińska','Julia','IT','Ms.','2000-06-23',GETDATE(),'Papieska 21','Wadowice','34-100','Poland',5)



------------------------------------------------------------------------------------------
---------- Dodaj nowe terytorium. Wykorzystaj najszybszy sposób.
---------- Identyfikator terytorium = 99999, opis terytorium = Śląsk,
---------- identyfikator regionu = 1.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
use Northwind
insert into Northwind.dbo.Territories(TerritoryID, TerritoryDescription, RegionID)
values ('99999','Śląsk',1)



------------------------------------------------------------------------------------------
---------- Usuń wszystkich pracowników.
------------------------------------------------------------------------------------------
---------- DELETE
------------------------------------------------------------------------------------------
---------- ? rows
------------------------------------------------------------------------------------------
use Northwind
delete
    from Employees



------------------------------------------------------------------------------------------
---------- Usuń dodanego wcześniej pracownika.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
declare @ostatniPracownik int = (select MAX(EmployeeID) from Employees)
DELETE dbo.Employees
where EmployeeID = @ostatniPracownik



------------------------------------------------------------------------------------------
---------- Usuń klientów, którzy nie złożyli jeszcze zamówienia.
------------------------------------------------------------------------------------------
---------- 2 rows
------------------------------------------------------------------------------------------
use Northwind
delete Customers
where CustomerID not in
(select distinct CustomerID
from Orders)