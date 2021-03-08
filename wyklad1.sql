use Northwind
-- zapytania o dane - 1 polecenie w SQL
-- operacja projekcji i selekcji

select *    -- co chcemy uzyskać
from Products   --skąd to weźmiemy
-- na wejściu mamy tabele ( 1 lub wiele ), na wyjściu tabelę (zawsze jedną)

-- projekcja to wskazanie kolumn, które będą w wyniku
-- Przykład
-- Chcemy nazwę, cenę, stan magazynowy, wartość
select  -- projekcja
        ProductName
       , UnitPrice
       , UnitsInStock
       , UnitPrice * UnitsInStock as 'Wartosc'
from Products

-- selekcja to wskazanie wierszy, które będą w wyniku
-- wyrażenia logiczne
-- 1) wyrażenia numeryczne - "<" ">" "<=" ">=" "=" "BETWEEN"
-- BETWEEN -> wartość z przedziału
select  -- projekcja
        ProductName
       , UnitPrice
       , UnitsInStock
       , UnitPrice * UnitsInStock as 'Wartosc'
from Products
where UnitPrice>50  -- selekcja

-- spójniki logiczne AND, OR, operator NOT
-- do obsługi tekstów LIKE
-- do obsługi list IN

-- podaj produkty których nazwa kończy się na 'e'

select  -- projekcja
       *                -- wyświetl wszystkie kolumny
        , ProductName   -- a potem jeszcze raz wymienione poniżej
       , UnitPrice
       , UnitsInStock
       , UnitPrice * UnitsInStock as 'Wartosc'
from Products
where ProductName like '%e'       -- 2 znaki globalne
                                -- _ maska dokładnie jednego znaku
                                -- % maska dowolnego w tym również (!)pustego(!) ciągu znaków
-- wyrażenia regularne