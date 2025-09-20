#show the whole table 
SELECT * FROM world.city;

#Show city names and population where population > 1,000,000
SELECT Name,Population
from world.city
where Population > 1000000;


# How many cities are in the table?
SELECT COUNT(*) AS TOTAL_CITY
FROM world.city;


#List distinct countries present in the table
Select distinct CountryCode
from world.city
order by CountryCode;


#City with the highest population
select Name,CountryCode,Population
from world.city
ORDER BY Population desc
limit 1;


# City with the second highest population
SELECT Name,CountryCode,Population
from world.city
ORDER BY Population DESC
LIMIT 1 OFFSET 1;



#Top 3 most populous cities for each country
SELECT Name,countrycode,Population
from world.city
order by Population DESC
limit 3;


#Total population per country (and number of cities)

SELECT CountryCode,
       COUNT(*) AS num_cities,
       SUM(Population) AS total_population
FROM world.city
GROUP BY CountryCode
ORDER BY total_population DESC;


# What percent of the country’s city-population does each city have?
SELECT Name, CountryCode, Population,
       ROUND(Population * 100.0 / SUM(Population) OVER (PARTITION BY CountryCode), 2) AS pct_of_country
FROM world.city
ORDER BY CountryCode, Population DESC;


# Find city names that appear in more than one country (same name, different countries)
SELECT Name
FROM world.city
GROUP BY Name
HAVING COUNT(DISTINCT CountryCode) > 1;



