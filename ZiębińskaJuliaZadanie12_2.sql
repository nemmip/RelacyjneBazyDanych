use northwind
select FirstName,
       LastName,
       Country,
       City,
       BirthDate,
       min(BirthDate) over () as najstarszy,
       max(BirthDate) over (partition by Country) as najmlodszy_kraj,
       max(BirthDate) over (partition by City) as namlodszy_miasto
from Employees