create database Baza_Stajnia
use Baza_Stajnia
create table Pracownicy
(
    "IDPracownika" int not null primary key identity (1,1),
    "Imie" varchar(30),
    "Nazwisko" varchar(30),
    "Data Urodzenia" date,
    "Stanowisko" varchar(30)
)
create table Instruktorzy
(
    "IDInstruktora" int not null primary key identity (1,1),
    "IDPracownika" int not null foreign key references Pracownicy,
    "Imie" varchar(30) not null ,
    "Nazwisko" varchar(30) not null,
    "Data Urodzenia" date,
    "Poziom" varchar(5) check (
        Poziom like 'BOJ' or
        Poziom like 'SOJ' or
        Poziom like 'Sport'
        )
)
create table Wlasciciele
(
    "IDWlasciciela" int         not null primary key identity (1,1),
    "Imie" varchar(30) not null ,
    "Nazwisko" varchar(30) not null,
    "Numer telefonu" varchar(11) check ([Numer telefonu] like
                                        '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)
create table Konie
(
    "IDKonia"        int         not null primary key identity (1,1),
    "IDWlasciciela"   int         not null foreign key references Wlasciciele,
    "Imie"           varchar(30) not null,
    "Imie matki"     varchar(30),
    "Imie ojca"      varchar(30),
    "Rasa"           varchar(30),
    "Data urodzenia" date,
    "Wzrost"         int         not null,
    "Maść"           varchar(30),
    "Typ"            varchar(30) check (Typ like 'Rekreacja' or Typ like 'Pensjonat'),
    "Poziom" varchar(5) check (Poziom like 'BOJ' or Poziom like 'SOJ' or
                               Poziom like 'Sport' or Poziom is null)
)
create table Grupy
(
    "IDGrupy" char(1) not null primary key,
    "IDInstruktora" int not null foreign key references Instruktorzy,
    "PoziomGrupy" varchar(5) check (PoziomGrupy like 'BOJ' or PoziomGrupy like 'SOJ' or
                               PoziomGrupy like 'Sport')
)
create table Uczniowie
(
    "IDUcznia" int not null primary key identity (1,1),
    "IDGrupy" char(1)not null foreign key references Grupy,
    "Imie" varchar(30) not null ,
    "Nazwisko" varchar(30) not null,
    "Data Urodzenia" date
)
create table Lekcje
(
    "IDLekcji" int not null primary key identity (1,1),
    "IDGrupy" char(1)not null foreign key references Grupy,
    "IDUcznia" int not null foreign key references Uczniowie,
    "IDKonia" int         not null foreign key references Konie,
    "Data" date,
    "Opis" varchar(255),
    "TODO" varchar(255)
)
--wstawianie danych pracownicy
insert into Pracownicy
values ('Iwan','Ziętek','1999-09-27','Stajenny'),
       ('Małgorzata','Sokół','1989-08-29','Instruktor'),
       ('Dominika','Stankiewicz','1988-12-11','Instruktor'),
       ('Emil','Ząbek','1939-10-27','Weterynarz'),
       ('Edyta','Mencher','1993-05-03','Kowal')
--Instruktorzy
insert into Instruktorzy
values (4,'Małgorzata','Sokół','1989-08-29','SOJ'),
       (5,'Dominika','Stankiewicz','1988-10-27','BOJ')
       --wlasciciele
insert into Wlasciciele
values ('Stajnia','Stajnia','123-456-789'),
       ('Tymoteusz','Grześkiewicz','515-553-386'),
       ('Bartosz','Rutkowski','695-554-761'),
       ('Kinga','Wojciechowska','735-559-155'),
       ('Ewa','Janda','885-553-993'),
       ('Dominik','Ziętek','665-551-450')

--konie
insert into Konie
values (2,'Elliot','Eli','Leo','Morgan','2020-02-15',140,'Cremllo','Pensjonat',null),
       (1,'Leo','Lois','Tito','Trakeński','2008-10-05',135,'Myszata','Rekreacja','BOJ'),
       (3,'Sable','Samber','Left','Hackney','2020-03-04',150,'Cremllo','Pensjonat',null),
       (1,'Chip','Celesta','Stormy','Shire','2005-12-14',185,'Siwa','Rekreacja','Sport'),
       (1,'Nicky','Noc','Wiggles','Cleveland bay','2005-05-03',165,'Gniada','Rekreacja','Sport'),
       (1,'Gus','Gwiazda','Codi','Oldenburska','2011-02-15',175,'Karogniada','Rekreacja','BOJ'),
       (4,'Lynx','Luna','Ivory','Folblut','2020-10-04',145,'Bułana','Pensjonat',null),
       (1,'Thor','Tundra','Phantom', 'Irlandzki koń sportowy','2000-09-07',160,'Kara','Rekreacja','Sport'),
       (5,'Pippy','Pamela','Tristan','Hanowerski','1996-08-15',165,'Kara','Pensjonat','BOJ'),
       (1,'Smudge','Smuga','Sunday','Kłusak orłowski','2016-06-19',165,'Perlino','Rekreacja','BOJ'),
       (1,'Merlin','Moria','Tofee','Irlandzki koń sportowy','2005-02-09',160,'Derka','Rekreacja','Sport'),
       (6,'Lexi','Lux','Rexy','Australian stock horse','2020-10-15',120,'Kasztanowata','Pensjonat', null)
       -- grupy
insert into Grupy
values ('A',2,'BOJ'),
       ('B',2,'BOJ'),
       ('C',2,'BOJ'),
       ('D',1,'SOJ')
--uczniowie
insert into Uczniowie
values ('D','Maja','Chlebek','2011-09-17'),
       ('D','Florian','Szymański','2002-04-24'),
       ('B','Adrianna','Ziętek','2003-11-12'),
       ('A','Renata','Szwarc','1977-09-16'),
       ('B','Stanisław','Jankowski','1983-11-13'),
       ('A','Remigiusz','Szwed','2015-03-08'),
       ('A','Fryderyk','Wiśniewski','2013-11-13'),
       ('D','Małgorzata','Wasilewska','2010-05-08'),
       ('D','Kazimiera','Kosmatka','1989-06-28'),
       ('C','Urban','Adamczak','1952-11-09'),
       ('A','Adelajda','Gniewek','1965-07-14'),
       ('B','Małgorzata','Dubanowska','2008-02-15'),
       ('C','Małgorzata','Ryba','2013-05-09'),
       ('C','Kamila','Gniewek','2001-12-27'),
       ('B','Maryna','Kozłow','1959-10-04'),
       ('C','Lesław','Klimek','1991-09-26')
       select * from Uczniowie
       select * from Konie
--Lekcje
insert into Lekcje
values ('A',6,8,'2021-05-12',null,null),
       ('A',4,5,'2021-05-12',null,null),
       ('A',7,4,'2021-05-12',null,null),
       ('A',11,6,'2021-05-12',null,null),
       ('B',3,2,'2021-06-25',null,null),
       ('B',5,4,'2021-06-25',null,null),
       ('B',12,6,'2021-06-25',null,null),
       ('B',15,11,'2021-06-25',null,null),
       ('C',10,10,'2021-08-17',null,null),
       ('C',13,5,'2021-08-17',null,null),
       ('C',14,8,'2021-08-17',null,null)