-- CREATE OR
ALTER VIEW `vw_world_all` AS
SELECT country.Name as CountryName, Continent, Region, country.Population as CountryPopulation, 
LifeExpectancy, city.Name as CityName, city.Population as CityPopulation, Language, IsOfficial, Percentage
FROM country 
INNER JOIN city on city.CountryCode=country.Code
INNER JOIN countrylanguage on countrylanguage.CountryCode=country.Code
WITH CHECK OPTION;