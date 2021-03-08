------------------------------------------------------------------------------------------
---------- DIAGRAM BAZY
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
---------- Wy�wietl dane wszystkich pracownik�w.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select *
from Employees



------------------------------------------------------------------------------------------
---------- Wy�wietl produkty kt�rych cena (z podatkiem VAT) jest wi�ksza ni� 49 
---------- i mniejsza ni� 99.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select *
from Products
where UnitPrice*1.23>49 and UnitPrice*1.23<99



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę jednostkową,
---------- walutę (dodaj kolumnę), jednostek w magazynie dla produktów których
---------- cena (z podatkiem VAT) jest większa niż 49 i mniejsza niż 99.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select ProductName,QuantityPerUnit,UnitPrice,'zł',UnitsInStock
from Products
where UnitPrice*1.23 between 49 and 99



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę jednostkową,
---------- walutę (dodaj kolumnę), jednostek w magazynie dla produktów których
---------- cena (z podatkiem VAT) jest większa niż 49 i mniejsza niż 99.
---------- Dodaj alias dla dodanej kolumny.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select ProductName,QuantityPerUnit,UnitPrice,'zł' as 'Waluta',UnitsInStock
from Products
where UnitPrice*1.23 between 49 and 99



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę netto (cena jednostkowa),
---------- cenę brutto (cena jednostkowa z podatkiem VAT), walutę, jednostek w magazynie
---------- dla produktów, których cena z podatkiem VAT jest większa niż 49
---------- i mniejsza niż 99. Dodaj aliasy dla dodanych kolumny.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select ProductName
     ,QuantityPerUnit
     ,UnitPrice
     ,UnitPrice*1.23 as CenaBrutto
     , 'zł' as Waluta
     ,UnitsInStock
from Products
where UnitPrice*1.23 between 49 and 99



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta wraz z jego pełnym adresem (ulica, miasto, kod pocztowy).
---------- Wyniki posortuj względem miasta.
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------
select CompanyName
     ,Address
     ,City
     ,PostalCode
from Customers
order by City asc


------------------------------------------------------------------------------------------
---------- Wyświetl produkty których nazwa zaczyna się na literę "b" lub "s".
------------------------------------------------------------------------------------------
---------- 10 rows
------------------------------------------------------------------------------------------
select *
from Products
where ProductName like 'b%' or ProductName like 's%'

--------- lub
select *
from Products
where ProductName like 'b_%' or ProductName like 's_%'




------------------------------------------------------------------------------------------
---------- Wyświetl produkty których nazwa zaczyna się na literę z przedziału "b" - "s".
------------------------------------------------------------------------------------------
---------- 64 rows
------------------------------------------------------------------------------------------
select *
from Products
where ProductName like '[b-s]%'



------------------------------------------------------------------------------------------
---------- Wyświetl nazwy firmy klienckich oraz liczbę znaków ich nazwy.
---------- Wyniki posortuj malejąco względem drugiej kolumny.
------------------------------------------------------------------------------------------
---------- LEN()
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------
select CompanyName, len(CompanyName) as NameLenght
from Customers
order by NameLenght asc



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę kategorii oraz jej skrót składający się z 3 pierwszych liter.
------------------------------------------------------------------------------------------
---------- LEFT()
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------
select CategoryName, LEFT(CategoryName,3) as ShortName
from Categories


------------------------------------------------------------------------------------------
---------- Wyświetl imię i nazwisko pracownika
---------- oraz skrót imienia składający się z pierwszej i ostatniej litery.
------------------------------------------------------------------------------------------
---------- LEFT(), RIGHT()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select FirstName,LastName,left(FirstName,1)+right(FirstName,1) as ShortName
from Employees



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę dostawcy
---------- oraz pierwsze 5 liter (czyli litery 1,2,3,4,5) nazwy firmy.
------------------------------------------------------------------------------------------
---------- SUBSTRING()
------------------------------------------------------------------------------------------
---------- 29 rows
------------------------------------------------------------------------------------------
select CompanyName, substring(CompanyName,1,5) as First5
from Suppliers



------------------------------------------------------------------------------------------
---------- Czyszczenie bia�ych znak�w.
------------------------------------------------------------------------------------------
---------- LTRIM()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT ' QWERTY' AS 'napis + spacja', 
	LEN(' QWERTY') AS 'długość napisu ze spacją',
	LTRIM(' QWERTY') AS 'napis bez spacji', 
	LEN(LTRIM(' QWERTY')) AS 'długość napisu bez spacji'



------------------------------------------------------------------------------------------
---------- Wyświetl dane pracowników, zamień kraj "UK" na "United Kingdom".
------------------------------------------------------------------------------------------
---------- REPLACE()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
select EmployeeID
     ,LastName
     ,FirstName
     ,Title
     ,TitleOfCourtesy
     ,BirthDate
     ,HireDate
     ,Address
     ,City
     ,Region
     ,PostalCode
     , replace(Country,'UK','United Kingdom') as Country
     ,HomePhone
     ,Extension
     ,Photo
     ,Notes
     ,ReportsTo
     ,PhotoPath
from Employees

