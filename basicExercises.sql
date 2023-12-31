--HACKER RANK CHALLENGE BASIC SQL

-- 1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM City 
WHERE CountryCode = 'USA' AND Population > 100000

-- 2. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(City) - COUNT(DISTINCT(City)) FROM Station

-- 3. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT City, LENGTH(City) FROM Station GROUP BY City ORDER BY LENGTH(City) DESC LIMIT 1;

SELECT City, LENGTH(City) FROM Station GROUP BY City ORDER BY LENGTH(City), City LIMIT 1;

-- 4. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE City LIKE 'A%' or City LIKE 'E%' or City LIKE 'I%' or City LIKE 'O%' or City LIKE 'U%';

-- 5. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE City LIKE '%A' or City LIKE '%E' or City LIKE '%I' or City LIKE '%O' or City LIKE '%U';

-- 6. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE UPPER(City) LIKE '[AEIOU]%[AEIOU]';

-- 7. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE UPPER(City) NOT LIKE '[AEIOU]%';

-- 8. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE UPPER(City) NOT LIKE '%[AEIOU]';

-- 9. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE UPPER(City) NOT LIKE '[AEIOU]%[AEIOU]';

-- 10. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT(City) FROM Station WHERE UPPER(City) NOT LIKE '[AEIOU]%' AND UPPER(City) NOT LIKE '%[AEIOU]';

-- 11. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name FROM Students WHWERE marks > 75 ORDER BY RIGHT(name,3),id ASC;

-- 12. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name FROM Employee ORDER BY name;

-- 13.Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. 
-- Sort your result by ascending employee_id.

SELECT name FROM Employee WHERE salary > 2000 AND months < 10 ORDER BY employee_id;

-- 14.Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

SELECT Country.Continent, ROUND(AVG(City.Population),2) FROM Country INNER JOIN City ON Country.Code = City.CountryCode GROUP BY Country.Continent;