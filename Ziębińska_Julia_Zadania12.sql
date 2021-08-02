------------------------------------------------------------------------------------------
---------- Wyświetl produkty wraz z cenami oraz informacją o najniższej,
---------- średniej i najwyższej cenie. Wartości zaokrąglij do dwóch miejsc po przecinku.
------------------------------------------------------------------------------------------
---------- UNION
------------------------------------------------------------------------------------------
---------- 80 rows
------------------------------------------------------------------------------------------
select ProductName, UnitPrice,MIN(UnitPrice)as 'Min',MAX(UnitPrice) as 'Max', AVG(UnitPrice) as 'Avg'
from Products
group by ProductName, UnitPrice
union
select '',null,null,null,ROUND(AVG(UnitPrice),2)
from Products
union
select '',null,null,ROUND(MAX(UnitPrice),2),null
from Products
union
select '',null,ROUND(MIN(UnitPrice),2),null,null
from Products



------------------------------------------------------------------------------------------
---------- Wyświetl cenę najdroższego produkt z każdej kategorii (wraz z nazwą kategorii),
---------- oraz ogólną średnią cenę produktu. Wyniki zaokrąglij.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
create view w1
as
    (
    select C.CategoryName, MAX(P.UnitPrice) as 'Maks_Cena',null as 'Srednia'
from Products P join Categories C on P.CategoryID = C.CategoryID
group by C.CategoryName
    )

select * from w1
union
select null,null,AVG(Maks_Cena)
from w1


------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto i kraj pracowników mieszkających w "USA"
---------- poza miastem "Seattle".
------------------------------------------------------------------------------------------
---------- EXCEPT
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
select FirstName,LastName,City,Country
from Employees
where Country='USA'
except (select FirstName,LastName,City,Country
from Employees
where City='Seattle')



------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto i kraj pracowników mieszkających w "Seattle"
---------- poza "USA".
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
select FirstName,LastName,City,Country
from Employees
where City='Seattle' and Country<>'USA'



------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto i kraj pracowników mieszkających "USA"
---------- w mieście "Seattle".
------------------------------------------------------------------------------------------
---------- INTERSECT
------------------------------------------------------------------------------------------
---------- 2 rows
------------------------------------------------------------------------------------------
select FirstName,LastName,City,Country
from Employees
where Country='USA' and City='Seattle'



------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------
---------- Wyświetl informacje o istnieniu pracownika po podaniu jego ID.
------------------------------------------------------------------------------------------
---------- Istnieje pracownik o takim ID
------------------------------------------------------------------------------------------
declare @id int;
set @id =1;
declare @isExist int = (select EmployeeID from Employees where EmployeeID=@id)
IF @id=@isExist
    PRINT N'Istnieje pracownik o takim ID'
go


------------------------------------------------------------------------------------------
---------- Nie istnieje pracownik o takim ID
------------------------------------------------------------------------------------------
declare @id int;
set @id =100;
declare @isExist int = (select EmployeeID from Employees where EmployeeID=@id)
IF @id=@isExist
    PRINT N'Istnieje pracownik o takim ID'
else
    PRINT N'Nie istnieje pracownik o takim ID'



------------------------------------------------------------------------------------------
---------- Używając pętli wyświetl 10 kolejnych liczb, zaczynając od 1.
------------------------------------------------------------------------------------------
---------- 1
---------- 2
---------- 3
---------- 4
---------- 5
---------- 6
---------- 7
---------- 8
---------- 9
---------- 10
------------------------------------------------------------------------------------------
declare @i int = 1
while (@i<=10)
begin
    PRINT @i
    set @i=@i+1
end

---------- lub
