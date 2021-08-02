use Northwind
------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu i odpowiadającej mu kategorii.
------------------------------------------------------------------------------------------
---------- INNER JOIN
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
select ProductName, CategoryName
from Products
inner join Categories C on Products.CategoryID = C.CategoryID



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu i dostawcy.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
select ProductName,CompanyName
from Products
inner join Suppliers S on Products.SupplierID = S.SupplierID



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, dostawcy i kategorii dla firm zawierających w nazwie
---------- wyraz "Pavlova".
------------------------------------------------------------------------------------------
---------- 5 rows
------------------------------------------------------------------------------------------
select ProductName,CompanyName,CategoryName
from Products
inner join Suppliers S on Products.SupplierID = S.SupplierID
inner join Categories C on Products.CategoryID = C.CategoryID
where CompanyName like '%Pavlova%'


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, opis kategorii i nazwę dostawcy.
---------- Uwzględnij tylko firmy zawierające w nazwie napis "Pavlova".
---------- Ogranicz się do produktów z kategorii: "beverages", "seafood".
------------------------------------------------------------------------------------------
---------- 2 rows
------------------------------------------------------------------------------------------
select ProductName,Description,CompanyName
from Products
inner join Categories C on Products.CategoryID = C.CategoryID
inner join Suppliers S on S.SupplierID = Products.SupplierID
where CompanyName like '%Pavlova%' and (CategoryName='Beverages' or CategoryName='Seafood')



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, cenę jednostkową oraz cenę na zamówieniu.
---------- Wybierz tylko produkty z kategorii "beverages".
------------------------------------------------------------------------------------------
---------- 404 rows
------------------------------------------------------------------------------------------
select ProductName, Products.UnitPrice,od.UnitPrice as CenaPoZamówieniu
from Products
inner join [Order Details] od on Products.ProductID = od.ProductID
inner join Categories C on Products.CategoryID = C.CategoryID
where CategoryName ='Beverages'


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, cenę jednostkową oraz cenę na zamówieniu.
---------- Wybierz tylko produkty z kategorii "beverages".
---------- Uwzględnij tylko unikalne rekordy.
------------------------------------------------------------------------------------------
---------- 24 rows
------------------------------------------------------------------------------------------
select distinct ProductName,Products.UnitPrice,od.UnitPrice as CenaPoZamówieniu
from Products
inner join [Order Details] od on Products.ProductID = od.ProductID
inner join Categories C on Products.CategoryID = C.CategoryID
where CategoryName='Beverages'

------------------------------------------------------------------------------------------
---------- Wyświetl wszystkich klientów oraz datę składanych zamówień (jeśli istnieje).
------------------------------------------------------------------------------------------
---------- LEFT JOIN
------------------------------------------------------------------------------------------
---------- 832 rows
------------------------------------------------------------------------------------------
select *,OrderDate
from Customers
Left Join Orders O on Customers.CustomerID = O.CustomerID



------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz liczbę jego zamówień.
------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------
select CompanyName, count(O.CustomerID) as LiczbaZamówień
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
group by CompanyName


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z roku 1996.
------------------------------------------------------------------------------------------
---------- 67 rows
------------------------------------------------------------------------------------------
select CompanyName, sum(O.Freight) as SumaOpłatFrachtowych
from Customers
inner join Orders O on Customers.CustomerID = O.CustomerID
where YEAR(OrderDate)='1996'
group by CompanyName