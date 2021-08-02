use Northwind
select O.OrderID,
       O.OrderDate,
       OD.UnitPrice*OD.Quantity as 'WartoscZam',
       concat_ws(' ',E.FirstName,E.LastName) as 'Pracownik',
       rank() over (order by OD.UnitPrice*OD.Quantity asc) as 'Rank'
from Orders O join [Order Details] OD
    on O.OrderID = OD.OrderID join Employees E
        on O.EmployeeID = E.EmployeeID