create database SzamponyBaza
use SzamponyBaza

create table Kategorie
(
KategoriaID int primary key identity (100,1),
Nazwa nvarchar(20) unique,
Opis nvarchar(50) not null,
);
create table Produkty
(
Produkt_ID int primary key identity(1,1),
Nazwa nvarchar(20) unique,
Kategoria_ID int foreign key references Kategorie,
Opis nvarchar(50) not null,
Cena float not null,
StanMagazynu int not null ,
);
create table Pracownicy
(
Pracownik_ID int primary key not null identity(1,1),
Imie nvarchar(10) not null,
Nazwisko nvarchar(20) not null,
Stanowisko nvarchar(30) not null,
ID_Przelozonego int null,
Kraj nvarchar(15) not null,
Miasto nvarchar(15)not null,
Ulica nvarchar(50) not null,
NrDomu int not null,
NrLokalu nvarchar(3) null,
Telefon nvarchar (11) not null check(Telefon like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
create table Klienci
(
Klient_ID int primary key not null identity(1,1),
Imie nvarchar(10) not null,
Nazwisko nvarchar(20) not null,
Kraj nvarchar(15) not null,
Miasto nvarchar(15)not null,
Ulica nvarchar(50) not null,
NrDomu int not null,
NrLokalu nvarchar(3) null,
Telefon nvarchar (11) not null check(Telefon like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

create table Zamowienia
(
Zamowienie_ID int primary key not null identity(1,1), --pierwsza jedynka to że zaczynami od 1 i potem inkrementujemy o 1
StartDate Datetime check(StartDate > 2010),
ExceptedDate Datetime not null,
Klient_ID int foreign key references Klienci,
Produkt_ID int foreign key references Produkty,
Pracownik_ID int foreign key references Pracownicy,
Zrealizowany int check (Zrealizowany in (0,1)),
);

create table SzczegolyZam
(
Zamowienie_ID int foreign key references Zamowienia,
Produkt_ID int foreign key references Produkty,
Cena float not null,
Ilosc int not null
)
insert into Kategorie values
('Szampon dla kobiet','Produkty do mycia głowy dla kobiet'),
('Odżywka do włosów', 'Produkty pielęgnacyjne po użyciu szamponu'),
('Lakier do włosów','Produkty utrwalające fryzurę'),
('Pianka do włosów','Produkty nadające objętość'),
('Inne','Inne produkty');
select *from Kategorie
insert into Produkty values
('2w1',100,'Szampon 2w1 dla kobiet',7.99,1000),
('Supreme',100,'Szampon premium dla kobiet',24.98,500),
('Naturalna',101,'Odżywka do włosów z naturalnych składników',60.00,1000),
('Supertrwały',102,'Lakier do włosów 24h',12.99,2000),
('Supervolume',103,'Pianka do włosów nadająca objętość',15.99,2100),
('Keratin Mask',104,'Maska keratynowa do włosów',19.99,600);

insert into Pracownicy values
('Jan', 'Kowalski','Dyrektor regionalny',null,'Polska','Wrocław','Krzywa',5,12,'123456789'),
('Anna','Nowak','Specjalista ds.marketingu',1,'Polska','Warszawa','Syrenia',4,null,'234567891'),
('Tomasz','Rychły','Brygadzista',1,'Polska','Katowice','Częstochowska',8,10,'000000000'),
('Andrzej','Mazur','Magazynier',3,'Polska','Chorzów','Piankowa',1,null,'111111111'),
('Dariusz','Fajny','Magazynier',3,'Polska','Chorzów','Górnicza',7,null,'111111112'),
('Amadeusz','Mądry','Magazynier',3,'Polska','Bytom','Kościucszki',140,15,'111111111');
insert into Klienci values
('Hans','Lande','Niemcy','Hamburg','Strass',40,19,'444444444'),
('Agnieszka','Niemieszka','Polska','Gdańsk','Morska',9,15,'222222222'),
('Gustavo','Front','Hiszpania','Madryt','Calle',1,null,'333333333'),
('Dieter','Schwarz','Niemcy','Berlin','Neckarsulm',81,null,'555555555'),
('Jeronimo','Martins','Portugalia','Lizbona','Estremadura',60,200,'666666666'),
('Dirk','Rossmann','Niemcy','Lubecka','Burgwedel',149,null,'777777777');
insert into Zamowienia values
('2021-01-10','2021-01-17',1,1,2,1),
('2021-02-08','2021-02-16',2,2,1,1),
('2021-03-05','2021-03-10',2,3,2,0),
('2021-03-18','2021-03-20',3,4,2,1),
('2021-04-05','2021-04-10',4,5,1,1),
('2021-04-05','2021-04-20',5,6,2,0);

insert into SzczegolyZam values
(1,1,7.99,500),
(2,2,24.98,250),
(3,3,60,750),
(4,4,12.99,1000),
(5,5,15.99,1750),
(6,6,19.99,300);

select *from Pracownicy

select *from Produkty
where Cena>10

select *from SzczegolyZam
where Ilosc>=1000

select *from Pracownicy
where ID_Przelozonego is null

select *from Klienci
where Nazwisko = 'Rossmann'

select *from Pracownicy
where Stanowisko = 'Magazynier' and Miasto = 'Chorzów'
