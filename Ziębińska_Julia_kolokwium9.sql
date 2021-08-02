------------------------------------------------------------------------------------------
---------- Dodaj nowego dostawcę: "Uniwersytet Ekonomiczny w Katowicach",
---------- Tytuł osoby kontaktowej: "Rektor",
---------- Miastko: "Katowice",
---------- Kod pocztowy: "40-287".
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
USE Northwind
insert into Suppliers
(CompanyName, ContactTitle, City, PostalCode)
values
('Uniwersytet Ekonomiczny w Katowicach', 'Rektor', 'Katowice', '40-287')

------------------------------------------------------------------------------------------
---------- Ustaw adres na "1 Maja 50" dla klienta o najkrótszym identyfikatorze.
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------
update Customers
SET Address = '1 Maja 50'
where len(CustomerID) = (select (min(len(CustomerID)))
                        from Customers)



------------------------------------------------------------------------------------------
---------- Utwórz widok o nazwie "Klienci", który wyświetla
---------- identyfikator klienta, nazwę firmy, adres i region.
---------- Ogranicz wyświetlane rekordy tylko do klientów o identyfikatorze "UEK".
---------- Użyj widoku do wyświetlenia danych.
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
CREATE VIEW Klienci AS
SELECT CustomerID, CompanyName, Address, City, Region
FROM Customers
WHERE CustomerID = 'UEK'

SELECT * FROM Klienci
