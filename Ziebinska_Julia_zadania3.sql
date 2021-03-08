use Northwind
------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta wraz z jego pełnym adresem
---------- (ulica, miasto, kod pocztowy). Wyniki posortuj względem miasta.
------------------------------------------------------------------------------------------
---------- CONCAT()
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------
SELECT CompanyName
     ,CONCAT(Address,' ',City,' ',Region,' ',PostalCode,' ',Country) as Adres
FROM Customers
ORDER BY City asc



------------------------------------------------------------------------------------------
---------- Wyświetl dane pracownika, imię małymi literami, nazwisko dużymi
------------------------------------------------------------------------------------------
---------- LOWER(), UPPER()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
SELECT EmployeeID
     ,UPPER(LastName) as LastName
     ,LOWER(FirstName) as FirstName
     ,Title
     ,TitleOfCourtesy
     ,BirthDate
     ,HireDate
     ,Address
     ,City
     ,Region
     ,PostalCode
     ,Country
     ,HomePhone
     ,Extension
     ,Photo
     ,Notes
     ,ReportsTo
     ,PhotoPath
FROM Employees




------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu oraz pozycję spacji w nazwie produktu.
------------------------------------------------------------------------------------------
---------- CHARINDEX()
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
SELECT ProductName, CHARINDEX(' ', ProductName) as Spacja
FROM Products



------------------------------------------------------------------------------------------
---------- Wyświetl pierwszą część nazwy produktu (do spacji).
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
SELECT
       IIF(CHARINDEX(' ',ProductName)=0, ProductName,LEFT(ProductName,CHARINDEX(' ',ProductName))) as ProductName
FROM Products



------------------------------------------------------------------------------------------
---------- Wyświetl bieżącą datę systemową oraz jej poszczególne składowe.
------------------------------------------------------------------------------------------
---------- GETDATE()
------------------------------------------------------------------------------------------
---------- DATEPART()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT GETDATE()

---------- Lub
SELECT DATEPART(year, GETDATE()) as Year
     ,DATEPART(month, GETDATE()) as Month
     ,DATEPART(day, GETDATE()) as Day
     ,DATEPART(hour,GETDATE()) as Hour
     ,DATEPART(minute, GETDATE()) as Minutes
     ,DATEPART(second, GETDATE()) as Seconds

	


------------------------------------------------------------------------------------------
---------- Wyświetl zamówienia złożone w czerwcu 1997 roku.
---------- Wyniki pokaż w kolejności zamówień.
------------------------------------------------------------------------------------------
---------- 30 rows
------------------------------------------------------------------------------------------
SELECT *
from Orders
where DATEPART(year, OrderDate)=1997 and DATEPART(month, OrderDate)=06
order by OrderID asc

------------------------------------------------------------------------------------------
---------- Wyświetl zamówienia złożone w 1997 roku od stycznia do czerwca.
---------- Wyniki posortuj względem daty zamówienia.
------------------------------------------------------------------------------------------
---------- 185 rows
------------------------------------------------------------------------------------------
SELECT *
from Orders
where DATEPART(year, OrderDate)=1997 and (DATEPART(month,OrderDate) between 01 and 06)
order by OrderDate asc



------------------------------------------------------------------------------------------
---------- Wyświetl imię i nazwisko pracownika oraz czas jego pracy (w latach).
------------------------------------------------------------------------------------------
---------- DATEDIFF()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
SELECT FirstName, LastName, DATEDIFF(year,HireDate, getdate()) as HireTime
from Employees



------------------------------------------------------------------------------------------
---------- Wyświetl wszystkie zamówienia niezrealizowane w terminie
---------- wraz z informacją o ich opóźnieniu.
---------- Wyniki posortuj malejąco względem opóźnienia.
------------------------------------------------------------------------------------------
---------- CAST()
------------------------------------------------------------------------------------------
---------- 37 rows
------------------------------------------------------------------------------------------
select 'Opóźniony' as Status,*
from Orders
where CAST(RequiredDate as int) < CAST(ShippedDate as int)
ORDER BY (CAST(RequiredDate as int)-CAST(ShippedDate as int)) asc




------------------------------------------------------------------------------------------
---------- Wyświetl najdroższe 10 produktów w kolejności malejącej po cenie.
------------------------------------------------------------------------------------------
---------- TOP
------------------------------------------------------------------------------------------
---------- 10 rows
------------------------------------------------------------------------------------------
SELECT top(10) *
from Products
ORDER BY UnitPrice desc




------------------------------------------------------------------------------------------
---------- Wyświetl 1% najtańszych ZAMÓWIONYCH produktów
---------- wraz z informacją o cenie, zniżce i ich liczbie.
------------------------------------------------------------------------------------------
---------- PERCENT
------------------------------------------------------------------------------------------
---------- 22 rows
------------------------------------------------------------------------------------------
select top(1)PERCENT UnitPrice, Discount, Quantity
from [Order Details]
order by UnitPrice asc



------------------------------------------------------------------------------------------
---------- Wyświetl w kolejności odwrotnej do alfabetycznej
---------- miasta do których były realizowane zamówienia.
---------- Wyniki posortuj względem miasta dostarczenia,
------------------------------------------------------------------------------------------
---------- DISTINCT()
------------------------------------------------------------------------------------------
---------- 70 rows
------------------------------------------------------------------------------------------
SELECT DISTINCT ShipCity
from Orders
order by ShipCity desc
