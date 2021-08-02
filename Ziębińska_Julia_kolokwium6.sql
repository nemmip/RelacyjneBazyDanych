------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz liczbę jego zamówień.
---------- Uwzględnij klientów którzy złożyli co najmniej 10 zamówień.
---------- Wyniki posortuj malejąco względem liczby zamówień.
------------------------------------------------------------------------------------------
---------- 39 rows
------------------------------------------------------------------------------------------
use Northwind
select C.CompanyName, COUNT(O.OrderID) as 'Liczba_Zam'
from Customers C join Orders O on C.CustomerID = O.CustomerID
group by C.CompanyName
having COUNT(O.OrderID)>=10
order by Liczba_Zam desc



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę kategorii, jej opis, nazwę produktu i firmy która go dostarcza.
---------- Uwzględnij tylko sery (nabiał).
---------- Wyniki posortuj alfabetycznie względem nazwy produktu.
------------------------------------------------------------------------------------------
---------- 10 rows
------------------------------------------------------------------------------------------
select C.CategoryName, C.Description,P.ProductName,S.CompanyName
from Categories C join Products P on C.CategoryID = P.CategoryID
                join Suppliers S on S.SupplierID = P.SupplierID
where C.Description like 'Cheeses'
order by P.ProductName