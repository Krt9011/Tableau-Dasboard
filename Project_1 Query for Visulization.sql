
-- Global Numbers Table 1
select date, sum(new_cases) as Total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from ['Covid DEaths$'] 
where continent is not null
group by date
order by 1,2

---Table 2
Select location, sum(cast(new_deaths as int)) as TotalDeathCount
From ['Covid DEaths$']
Where continent is null
and location not in ('world', 'European Union', 'International')
group by Location
order by Totaldeathcount

-- Table 3
select location, max(total_cases) as highest_infectioncount, population, max(total_cases/population*100) as Population_infected
from ['Covid DEaths$'] --where location = 'India'
group by location, population
order by Population_infected desc


-- Table 4
select location,date, max(total_cases) as highest_infectioncount, population, max(total_cases/population*100) as Population_infected
from ['Covid DEaths$'] --where location = 'India'
group by location, population,date
order by Population_infected desc