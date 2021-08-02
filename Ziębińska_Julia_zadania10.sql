------------------------------------------------------------------------------------------
---------- Dodaj do tabeli Products kolumnę "Kategoria".
---------- Uzupełnij dodaną kolumnę odpowiednimi nazwami kategorii.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
use northwind
alter table dbo.Products
add Kategoria nvarchar(15)
update dbo.Products
set Products.Kategoria = (SELECT CategoryName
                            from Categories c where c.CategoryID = Products.CategoryID)


------------------------------------------------------------------------------------------
---------- Przekopiuj dane z tabeli Products do nowej tabeli Produkty.
---------- Z tabeli Produkty usuń kolumnę CategoryID.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------
select *
into Produkty
from Products

---------- lub



------------------------------------------------------------------------------------------
---------- Usuń kolumnę Photo z tabeli Employees.
------------------------------------------------------------------------------------------
alter table dbo.Employees
drop column Photo



------------------------------------------------------------------------------------------
---------- Dodaj kolumnę "Wartosc" do tabeli Produkty.
---------- Kolumna "Wartosc" jest iloczynem UnitsInStock i UnitPrice.
------------------------------------------------------------------------------------------
alter table dbo.Produkty
add Wartosc int
update dbo.Produkty
set Produkty.Wartosc = UnitsInStock*UnitPrice



------------------------------------------------------------------------------------------
---------- Stwórz tabele Student składającą się z 5 kolumn:
---------- ID (klucz główny, nadawany automatycznie),
---------- Imie (wartość nie pusta),
---------- Nazwisko (wartość nie pusta),
---------- Pesel (unikalna liczba),
---------- Miasto (domyślnie "Katowice").
---------- Dodaj przykładowe dane.
------------------------------------------------------------------------------------------
create table Student
    (ID int identity,
    Imie  varchar(255) not null,
    Nazwisko varchar(255) not null ,
    Pesel int unique,
    Miasto varchar(255) default 'Katowice')

insert into Student(Imie, Nazwisko, Pesel,Miasto)
values ('Julia','Ziębińska','00578946591','Częstochowa')

------------------------------------------------------------------------------------------
---------- Dodaj przykładowe dane testowe do tabeli Student - trzy wiersze.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
insert into Student(Imie, Nazwisko, Pesel)
values ('Amanda','Komorek',00252537154),
       ('Antoni','Kazanowski',00211687696),
       ('Miłosz','Tobolski',00301343394)



------------------------------------------------------------------------------------------
---------- Wyświetla dane z tabeli Student. Usuń tabelę.
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
select *
from Student
drop table Student