use Northwind;

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę jednostkową,
---------- jednostek w magazynie. Wybierz tylko produkty których cena jest większa od 10
---------- oraz nazwa zawiera napis "lager". Listę wyświetl posortowaną po malejącej cenie.
------------------------------------------------------------------------------------------
---------- 2 rows
------------------------------------------------------------------------------------------
select ProductName
     ,QuantityPerUnit
     ,UnitPrice
     ,UnitsInStock
from Products
where (UnitPrice>=10) and (ProductName like '%lager%')


------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto oraz kraj pracowników,
---------- wybierz tylko pracowników z miasta "Seattle" lub kraju "uk".
---------- Wyniki wyświetl posortowane rosnąco po kraju i mieście.
------------------------------------------------------------------------------------------
---------- 6 rows
------------------------------------------------------------------------------------------
select FirstName
     ,LastName
     ,City
     ,Country
from Employees
where (City='Seattle') or (Country='UK')
order by Country,City asc