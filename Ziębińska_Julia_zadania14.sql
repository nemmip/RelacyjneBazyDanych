------------------------------------------------------------------------------------------
---------- Poczštek
------------------------------------------------------------------------------------------
---------- + oo
------------------------------------------------------------------------------------------
use Northwind



------------------------------------------------------------------------------------------
---------- Stwórz kopię tabeli Employees.
---------- Utwórz procedurę pozwalajšcš usunšć pracownika po podaniu jego nazwiska.
---------- Usuń pracownika o nazwisku "Fuller".
------------------------------------------------------------------------------------------
---------- PROCEDURE
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
select * into Employees1 from Employees
--drop table Employees1
go
create procedure usun_pracownika
@nazwisko varchar(50)
as
    delete from dbo.Employees1 where LastName like @nazwisko
go
exec usun_pracownika 'Fuller'



------------------------------------------------------------------------------------------
---------- Utwórz funkcję obliczajšcš różnicę miesięcy pomiędzy datami.
------------------------------------------------------------------------------------------
---------- FUNCTION
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
go
create function roznica_miesiecy
(@data1 datetime, @data2 datetime)
returns int
as
begin
    return month(@data2)-month(@data1)
end
select dbo.roznica_miesiecy('2000-01-01','2000-05-05')



------------------------------------------------------------------------------------------
---------- Utwórz trigger zapobiegajšcy usuwaniu więcej niż 1 wiersza z tabeli Employees1.
------------------------------------------------------------------------------------------
---------- TRIGGER
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------
go
create trigger triger
    on Employees1
    for delete
    as
    begin
        if @@ROWCOUNT>1
        begin
            rollback
            print 'Za duzo wierszy chcesz usunac'
        end
    end
select *from Employees1
delete from Employees1 where EmployeeID>1
delete from Employees1 where EmployeeID=1



------------------------------------------------------------------------------------------
---------- Utwórz wyzwalacz zapobiegajšcy usuwaniu tabel z bazy danych.
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
go
create trigger wyzwalacz
    on database
    for drop_table as
    begin
        rollback
        print 'Nie mozna wykonac operacji'
    end
create table Tabela(a int)
drop table Tabela