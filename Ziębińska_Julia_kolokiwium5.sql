use northwind
------------------------------------------------------------------------------------------
---------- Wyświetl liczbę pracowników z poszczególnych miast.
---------- Uwzględnij tylko "London", "Seattle", "Kirkland".
---------- Wyniki posortowane malejąco po liczbie pracowników.
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
select City
     ,COUNT(City) as Liczba_Pracownikow
from Employees
where City = 'London' or City = 'Seattle' or City='Kirkland'
group by City
order by Liczba_Pracownikow


------------------------------------------------------------------------------------------
---------- Wyświetl "Datę urodzenia najstarszego pracownika" oraz,
---------- "Datę zatrudnienia pracownika z najmniejszym stażem pracy".
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
select MIN(BirthDate) AS  'DataNajstarszego',
        MAX(HireDate) AS 'NajmniejszyStaz'
from Employees


------------------------------------------------------------------------------------------
---------- Dla każdej kategorii wyświetl "Średnią cenę produktu" oraz
---------- "Liczba sztuk produktów w zapasie". Nie uwzgędniaj categorii o id 4,5,6,8.
---------- Wynki posortowane rosnąco po liczbie sztuk produktów w zapasie.
------------------------------------------------------------------------------------------
---------- 4 rows
------------------------------------------------------------------------------------------
select    CategoryID,
        AVG(UnitPrice) AS 'SredniaCenaProduktu',
        SUM(UnitsInStock) AS 'LiczbaSztukProduktowWZapasie'
from Products
where CategoryID not between 4 AND 8
group by CategoryID
order by LiczbaSztukProduktowWZapasie ASC