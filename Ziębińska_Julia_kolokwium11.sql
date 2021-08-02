------------------------------------------------------------------------------------------
---------- Stwórz kopię tabeli Employees o nazwie "Pracownicy".
---------- Wyświetl wszystkie rekordy z tabeli Pracownicy.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
use northwind
select *
into Pracownicy1
from Employees

select *
from Pracownicy1



------------------------------------------------------------------------------------------
---------- Dodaj do tabeli Pracownicy kolumnę "Przelozony"
---------- (typ znakowy, maksymalnie 16 znaków).
---------- Zmień zawartość kolumny Przelozony na nazwisko i imię odpowiedniej osoby.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
alter table Pracownicy1
add Przelozony nvarchar(16)

update Pracownicy1
set Przelozony = 'Fuller Andrew'
where ReportsTo is not null and ReportsTo = 2


------------------------------------------------------------------------------------------
---------- Usuń kolumny Extension, Notes, ReportsTo z tabeli Pracownicy.
---------- Wyświetl dane wszystkich pracowników.
------------------------------------------------------------------------------------------
----------
------------------------------------------------------------------------------------------
alter table Pracownicy1
drop column Extension, Notes,ReportsTo



------------------------------------------------------------------------------------------
---------- Do tabeli Pracownicy dodaj kolumnę "Rocznik",
---------- która będzie rokiem urodzenia pracownika.
---------- Wyświetl dane wszystkich pracowników.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------
alter table Pracownicy1
add Rocznik char(4)





------------------------------------------------------------------------------------------
---------- Stwórz tabele Przedmiot składającą się z 5 kolumn:
---------- PrzedmiotID (klucz główny, nadawany automatycznie od 1 co 10),
---------- Nazwa (wartość nie pusta, tekstowa, maksymalnie 30 znaków, unikalna),
---------- ProwadzacyID (wartość nie pusta, liczbowa),
---------- LiczbaGodzin (liczba całkowita, domyślnie 30),
---------- TypZajec (wartość tekstowa, dokładnie 15 znaków).
---------- Dodaj 2 przykładowe rekordy i wyświetl je.
------------------------------------------------------------------------------------------
create table Przedmiot(
    PrzedmiotID int identity (1,10) primary key,
    Nazwa nvarchar(30) not null unique,
    ProwadzacyID int not null,
    LiczbaGodzin int default 30,
    TypZajec char(15)
)
insert into Przedmiot
values ('Programowanie',1,30,'ćwiczenia progr'),
       ('Bazy Danych', 2,45,'wykład stacjona')
select * from Przedmiot


