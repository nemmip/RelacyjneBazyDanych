use Northwind
--------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko oraz inicjały (inicjały w jednej kolumnie)
---------- wszystkich pracowników. Sortowanie alfabetyczne po inicjałach.
--------------------------------------------------------------------------------
---------- 9 rows
--------------------------------------------------------------------------------
select FirstName
     ,LastName
     ,left(FirstName,1)+left(LastName,1) as 'Inicjaly'
from Employees
order by Inicjaly asc


--------------------------------------------------------------------------------
---------- Wyświetl nazwę kategorii, długość nazwy kategorii, opis oraz obraz.
---------- Sortowanie rosnące po liczbie znaków w nazwie kategori.
--------------------------------------------------------------------------------
---------- 8 rows
--------------------------------------------------------------------------------
select CategoryName
     ,len(CategoryName) as 'Dlugosc_Nazwy'
     ,Description
     ,Picture
from Categories
order by Dlugosc_Nazwy asc