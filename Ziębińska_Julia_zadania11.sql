------------------------------------------------------------------------------------------
---------- Stwórz bazę danych "Uczelnia".
------------------------------------------------------------------------------------------
create database Uczelnia



------------------------------------------------------------------------------------------
---------- Zmień nazwę bazy danych "Uczelnia" na "UEK".
------------------------------------------------------------------------------------------
use master
alter database Uczelnia
modify name = UEK



------------------------------------------------------------------------------------------
---------- Usuń bazę danych "UEK".
------------------------------------------------------------------------------------------
use master
drop database UEK



------------------------------------------------------------------------------------------
---------- Stwórz tabelę Ocena z następującymi kolumnami:
---------- OcenaID - klucz główny, nadawany automatycznie od 1 co 1.
---------- Nazwa - wartość tekstowa o zmiennej długości, do 20 znaków.
---------- Wartosc - wartość zmiennoprzecinkowa.
---------- Uzupełnij tabelę ocenami.
------------------------------------------------------------------------------------------
use Northwind
create table Ocena
            (OcenaID int identity(1,1) primary key
            ,Nazwa varchar(20)
            ,Wartosc float)
insert into Ocena(Nazwa, Wartosc)
values ('AiSD',4.5),
       ('Etyka gosp.', 4.5),
       ('J.angielski',4.5),
       ('J.rosyjski',5),
       ('MDI',3),
       ('MD',3),
       ('SO',4.5),
       ('WdSI',3.5),
       ('WdPK',3.5),
       ('WF',5)


drop table Ocena

------------------------------------------------------------------------------------------
---------- Stwórz tabelę Oceny z następującymi kolumnami:
---------- OcenyID - klucz główny, nadawany automatycznie od 1 co 1.
---------- OcenaIDFK - klucz obcy z tabeli Ocena.
---------- Student - liczba całkowita, domyślnie 3113.
---------- Nauczyciel - liczba całkowita, niepusta, większa od 10.
---------- Uzupełnij tabelę danymi.
------------------------------------------------------------------------------------------
create table Oceny
            (OcenyID int identity(1,1) primary key,
            OcenyIDFK int foreign key references Ocena(OcenaID),
            Student int default 3113,
            Nauczyciel int check (Nauczyciel>10));


------------------------------------------------------------------------------------------
---------- Stwórz tabelę Nauczyciel z następującymi kolumnami:
---------- NauczycielID - klucz główny, nadawany automatycznie od 1 co 1.
---------- Imie - pole tekstowe o zmiennej długości, maksymalnie 30 znaków.
---------- Nazwisko - pole tekstowe o zmiennej długości, maksymalnie 30 znaków.
---------- KodPocztowy - pole tekstowe o długości 6 znaków, sprawdzenie poprawności.
---------- StopienNaukowy - pole tekstowe o zmiennej długości, maksymalnie 30 znaków,
---------- może zawierać tylko: "mgr", "dr", "dr hab.", "prof.".
---------- Uzupełnij tabelę danymi.
------------------------------------------------------------------------------------------
create table Nauczyciel
            (NauczycieleID int identity(1,1) primary key,
            Imie varchar(30),
            Nazwisko varchar(30),
            KodPocztowy char(6) check(KodPocztowy like '[0-9][0-9]-[0-9][0-9][0-9]'),
            StopienNaukowy varchar(30) check(StopienNaukowy like 'mgr' or
                                             StopienNaukowy like 'dr' or
                                             StopienNaukowy like 'dr hab.' or
                                             StopienNaukowy like 'prof.'))

insert into Nauczyciel(Imie, Nazwisko, KodPocztowy, StopienNaukowy)
values ('Joachim','Szulc','77-310','dr'),
        ('Oskar','Szymański','18-634','dr hab.'),
       ('Radosław','Woźniak','93-087','dr hab.'),
       ('Konstanty','Witkowski','84-375','dr'),
       ('Jakub','Górski','12-630','prof.'),
       ('Gustaw','Tomaszewski','00-319','dr'),
       ('Albert', 'Przybylski','61-097','mgr'),
       ('Halina','Przybylska','61-097','prof.'),
       ('Antonina','Kaczmarczyk','83-188','dr hab.'),
       ('Łucja','Piotrowska','68-259','prof.'),
       ('Eleonora','Mazurek','40-180','mgr')
       -- wybranie T kolumn gdzie wartość kolumny C jest x lub pusta