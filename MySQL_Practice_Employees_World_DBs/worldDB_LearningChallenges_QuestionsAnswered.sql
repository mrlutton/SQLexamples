
-- Exercises


-- 1) Using count, get the number of cities in the USA
-- SELECT COUNT(*), country.name FROM city, country
-- WHERE country.code=city.countryCode
-- AND country.name='United States';
-- OR COULD USE A JOIN:
-- SELECT COUNT(*), country.name FROM country
-- JOIN city ON country.code=city.countryCode
-- WHERE country.name='United States';

 -- 2) Find out what the population and average life expectancy for people in Argentina (ARG) is
-- SELECT name, population, AVG(lifeExpectancy) FROM country WHERE code='arg';

-- 3) Using IS NOT NULL, ORDER BY, LIMIT, what country has the highest life expectancy?
-- SELECT name, lifeexpectancy
-- FROM country
-- ORDER BY lifeexpectancy desc
-- LIMIT 1;

-- 4) Using LEFT JOIN, ON, what is the capital of Spain (ESP)?
/*
SELECT city.name, country.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code='ESP';
*/

-- 5) Using LEFT JOIN, ON, list all the languages spoken in the 'Southeast Asia' region
/*
SELECT language, region
FROM countrylanguage
LEFT JOIN country
ON countrylanguage.CountryCode=country.code
WHERE country.region='Southeast Asia';
*/
-- BONUS
-- Select 25 cities around the world that start with the letter 'F' in a single SQL query.
SELECT name FROM city WHERE name LIKE 'f%' ORDER BY name asc LIMIT 25;