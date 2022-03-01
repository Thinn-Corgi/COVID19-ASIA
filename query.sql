-- human_development_index rank in Asia
SELECT DISTINCT  location, human_development_index
 FROM `proud-coral-340312.COVID19.COVID19` 
 WHERE continent = 'Asia' 
 ORDER BY human_development_index 

--Death percentage in Asia 
--Find relationship between human_development_index and death rate
SELECT location,date,(total_deaths/total_cases)*100 AS death_percentage,human_development_index
 FROM `proud-coral-340312.COVID19.COVID19` 
 WHERE continent = 'Asia'
 AND total_deaths is not null 
 AND human_development_index is not null
 ORDER BY human_development_index

--vaccinated population in Asia
SELECT location,MAX(total_cases),MAX((people_vaccinated/population))*100 as PercentPopulationVaccinated, MAX(total_cases/population)*100 as PercentPopulationInfected
 FROM `proud-coral-340312.COVID19.COVID19` 
 WHERE continent = 'Asia'
 GROUP BY location
 
--create a new measure consists of population density and fraction of aged population
SELECT location,date,new_cases, new_deaths, population_density,aged_65_older,(population_density*aged_65_older) AS aged_density
 FROM `proud-coral-340312.COVID19.COVID19` 
 WHERE continent = 'Asia'
 AND (people_fully_vaccinated/population)*100 >=60
 AND aged_65_older >=5
