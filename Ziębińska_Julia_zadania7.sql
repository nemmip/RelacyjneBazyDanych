use Northwind
------------------------------------------------------------------------------------------
---------- Wyświetl nazwę firmy, liczbę złożonych przez klienta zamówień
---------- oraz liczbę wszystkich zamówień.
------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------
declare @ile_razem_zam int
set @ile_razem_zam = (select COUNT(OrderID)from Orders)
select CompanyName
     ,COUNT(O.CustomerID) as 'Liczba_zam_klienta'
     ,@ile_razem_zam as 'Liczba_wszystkich_zam'
from Customers join Orders O on Customers.CustomerID = O.CustomerID
group by CompanyName


------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, datę urodzenia, numer domowy oraz identyfikator
---------- zwierzchnika, dla pracowników młodszych od pracownika o nazwisku "King".
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
declare @DataKing datetime
set @DataKing = (select BirthDate from Employees where LastName='King')
select FirstName
     ,LastName
     ,BirthDate
     ,HomePhone
     ,EmployeeID
from Employees
where cast(@DataKing-BirthDate as int)<0



------------------------------------------------------------------------------------------
---------- Wyświetl dane klienta który złożył największe zamówienie.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- Poprawne rozwiązanie
------------------------------------------------------------------------------------------
declare @IDKlienta as varchar(10) = (select cast(CustomerID as varchar) from
(select top 1 CustomerID
     ,COUNT(OrderID) as 'Liczba'
from Orders
group by CustomerID
order by Liczba desc
) tabela)

select *
from Customers
where CustomerID = @IDKlienta





------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------
---------- Wyświetl liczbę produktów z kategorii która ma ich najwięcej
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
select top 1 CategoryID
     ,COUNT(ProductID) as 'Liczba_produktow'
from Products
group by CategoryID
order by Liczba_produktow desc



------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------