CREATE DATABASE StanTech
use StanTech

CREATE TABLE DaneTech(
IDModelu INT  not null PRIMARY KEY IDENTITY (1,1),
Marka nvarchar(50),
Model nvarchar (100),
PredkoscMaks NVARCHAR(250) check (PredkoscMaks like '%km/h'),
MomentObrotowy NVARCHAR(250) check (MomentObrotowy like '%Nm' ),
MocSilnika NVARCHAR(250) check (MocSilnika like '%KM'))

CREATE TABLE AutobusyBaza(
IDAutobusu INT PRIMARY KEY IDENTITY (1,1),
IDModelu INT FOREIGN key references DaneTech,
D2 INT check (D2 between 1 and 3))

CREATE TABLE Przeglady(
IDPrzegladu INT PRIMARY KEY IDENTITY (1,1),
IDAutobusu INT foreign key references AutobusyBaza,
DataPrzegladu DATETIME,
NazwaStacjiiDiagostycznej NVARCHAR(250),
NumerTelefonu NVARCHAR(11) check (NumerTelefonu
                                      like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'))

CREATE TABLE DaneDiagnostyka(
IDPrzegladu INT FOREIGN KEY references Przeglady,
CisnienieSprezania NVARCHAR(100) check (CisnienieSprezania like '%Mpa'),
ElementySmolowate float check (ElementySmolowate <=1),
ZuzycieOleju NVARCHAR(250) check (ZuzycieOleju like '%l/1000km'),
D1 int check (D1 between 1 and 2))


CREATE TABLE ZuzyciePaliwa
(

    IDAutobusu    INT foreign key references AutobusyBaza,
    ZimoweZuzycie NVARCHAR(20) check (ZimoweZuzycie like '%l/100km'),
    LetnieZuzycie NVARCHAR(20) check (LetnieZuzycie like '%l/100km')
)

insert into DaneTech
values
('Mercedes-Benz','814D','120km/h','520Nm','136KM'),
('Mercedes-Benz','Sprinter 413 CDI','120km/h','305Nm','130KM'),
('Mercedes-Benz','Sprinter 515 CDI','90km/h','330Nm','150KM')

insert into AutobusyBaza
values
(1,1),
(2,3),
(3,2)

insert into Przeglady
values
(1,'2021-03-18','Autopuls','376-505-833'),
(2,'2021-04-08','Premio Dublet Bis','924-195-641'),
(3,'2021-04-08','Premio Dublet Bis','924-195-641')

insert into DaneDiagnostyka
values
(2,'2.5Mpa',0.2,'0.2l/1000km',2),
(3,'2.7Mpa',0,'0l/1000km',1),
(4,'2.9Mpa',0.72,'0.8l/1000km',2)

insert into ZuzyciePaliwa
values
(1,'16l/100km','13.5l/100km'),
(2,'10.8l/100km','9.8l/100km'),
(3,'15.7l/100km','8.9l/100km')