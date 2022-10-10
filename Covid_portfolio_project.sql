-- Death populTION PERCENTAage
select location, max(total_deaths) as death_toll, population, max((total_deaths/population))*100 as death_percentage
from Covid_Portfolio..Covid_deaths$
where void is not null and location not in ('North America', 'South America', 'Europe', 'Africa', 'Asia')
group by location, population

select * 
from Covid_Portfolio..Covid_deaths$

--death total based on continent
select location, sum(cast(new_deaths as int)) as total_death
from Covid_Portfolio..Covid_deaths$
where continent is null and void is not null
group by location
order by total_death desc



--added void colunm
 alter table Covid_Portfolio..Covid_deaths$
 add  void int


 update Covid_Portfolio..Covid_deaths$
 set void = 1
 where location not in ('World', 'European Union', 'International', 'High Income', 'Low Income', 'Upper Middle Income', 'Lower Middle Income')



 --death total by country
select location, sum(cast(new_deaths as int)) as total_death, continent
from Covid_Portfolio..Covid_deaths$
where  continent is not null
group by continent , location
order by total_death desc
 

 select location, population, max(total_deaths), max((total_deaths/population)) * 100 as percentage_deceased
from Covid_Portfolio..Covid_deaths$
where  continent is not null 
group by population , location, total_deaths
order by total_deaths desc


--total cases per country
select location, max(new_cases) as amount_infected, population 
from Covid_Portfolio..Covid_deaths$
where void is not null and location not in ('North America', 'South America', 'Europe', 'Africa', 'Asia')
group by location, population


select *
from Covid_Portfolio..Covid_Vaccination



--added void colunm
 alter table Covid_Portfolio..Covid_Vaccination
 add  void int


 update Covid_Portfolio..Covid_Vaccination
 set void = 1
 where location not in ('World', 'European Union', 'International', 'High Income', 'Low Income', 'Upper Middle Income', 'Lower Middle Income')



--amount of people vaccinated as of 10/04/22
 select location, max(people_vaccinated) as vaccinated, max(people_vaccinated/population) * 100 as percent_vaccinated
from Covid_Portfolio..Covid_Vaccination
where void is not null
group by location
order by vaccinated desc

select * 
from Covid_Portfolio..Covid_deaths$ death join Covid_Portfolio..Covid_Vaccination vacc
on death.date = vacc.date and death.location = vacc.location